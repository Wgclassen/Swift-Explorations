import Foundation

// Struct rather than dictionary for efficiency, since we're storing a bunch of these
// in a dictionary.
struct EnvironmentCellValues {
    var typeA = 0.0
    var typeB = 0.0
    var typeC = 0.0
    var typeD = 0.0
}

extension EnvironmentCellValues {
    
    static func ofTypeA(_ concentration: Double) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: concentration, typeB: 0, typeC: 0, typeD: 0)
    }
    
    static func ofTypeB(_ concentration: Double) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: 0, typeB: concentration, typeC: 0, typeD: 0)
    }
    
    static func ofTypeC(_ concentration: Double) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: 0, typeB: 0, typeC: concentration, typeD: 0)
    }
    
    static func ofTypeD(_ concentration: Double) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: 0, typeB: 0, typeC: 0, typeD: concentration)
    }
    
    static func withAmountOfAllTypes(_ amount: Double) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: amount, typeB: amount, typeC: amount, typeD: amount)
    }
}

extension EnvironmentCellValues {
    static let zero = EnvironmentCellValues()
}

extension EnvironmentCellValues: Equatable {
}

extension EnvironmentCellValues {
    
    func clampedToNonnegative() -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: Double.maximum(0, typeA), typeB: Double.maximum(0, typeB), typeC: Double.maximum(0, typeC), typeD: Double.maximum(0, typeD))
    }
    
    func clampedTo(_ clampValues: EnvironmentCellValues) -> EnvironmentCellValues {
        return EnvironmentCellValues(typeA: Double.minimum(clampValues.typeA, typeA),
                                     typeB: Double.minimum(clampValues.typeB, typeB),
                                     typeC: Double.minimum(clampValues.typeC, typeC),
                                     typeD: Double.minimum(clampValues.typeD, typeD))
    }
    
}

extension EnvironmentCellValues {
    
    static func += (lhs: inout EnvironmentCellValues, rhs: EnvironmentCellValues) {
        lhs.typeA += rhs.typeA
        lhs.typeB += rhs.typeB
        lhs.typeC += rhs.typeC
        lhs.typeD += rhs.typeD
    }
    
    static func -= (lhs: inout EnvironmentCellValues, rhs: EnvironmentCellValues) {
        lhs.typeA -= rhs.typeA
        lhs.typeB -= rhs.typeB
        lhs.typeC -= rhs.typeC
        lhs.typeD -= rhs.typeD
    }
    
    static func *= (lhs: inout EnvironmentCellValues, rhs: EnvironmentCellValues) {
        lhs.typeA *= rhs.typeA
        lhs.typeB *= rhs.typeB
        lhs.typeC *= rhs.typeC
        lhs.typeD *= rhs.typeD
    }
    
}

func +(lhs: EnvironmentCellValues, rhs: EnvironmentCellValues) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA + rhs.typeA, typeB: lhs.typeB + rhs.typeB, typeC: lhs.typeC + rhs.typeC, typeD: lhs.typeD + rhs.typeD)
}

func +(lhs: EnvironmentCellValues, rhs: Double) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA + rhs, typeB: lhs.typeB + rhs, typeC: lhs.typeC + rhs, typeD: lhs.typeD + rhs)
}

func -(lhs: EnvironmentCellValues, rhs: EnvironmentCellValues) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA - rhs.typeA, typeB: lhs.typeB - rhs.typeB, typeC: lhs.typeC - rhs.typeC, typeD: lhs.typeD - rhs.typeD)
}

func -(lhs: EnvironmentCellValues, rhs: Double) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA - rhs, typeB: lhs.typeB - rhs, typeC: lhs.typeC - rhs, typeD: lhs.typeD - rhs)
}

func *(lhs: EnvironmentCellValues, rhs: EnvironmentCellValues) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA * rhs.typeA, typeB: lhs.typeB * rhs.typeB, typeC: lhs.typeC * rhs.typeC, typeD: lhs.typeD * rhs.typeD)
}

func *(lhs: EnvironmentCellValues, rhs: Double) -> EnvironmentCellValues {
    return EnvironmentCellValues(typeA: lhs.typeA * rhs, typeB: lhs.typeB * rhs, typeC: lhs.typeC * rhs, typeD: lhs.typeD * rhs)
}

class EnvironmentMap {
    
    struct Location: Equatable, Hashable, CustomStringConvertible {
        var x: Int
        var y: Int
        
        static let zero = Location(x: 0, y: 0)
        
        static func ==(lhs: Location, rhs: Location) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(x)
            hasher.combine(y)
        }
        
        var description: String {
            return "(\(x), \(y))"
        }
    }
    
    var cellSize = UInt(10) { // Grid cell size, in points
        didSet {
            cellSize = cellSize.clamped(1, UInt.max)
        }
    }
    var concentrations = [Location:EnvironmentCellValues]()
    var decayRate = EnvironmentCellValues(typeA: 0, typeB: 0, typeC: 0, typeD: 0) // Decay per cell, in units per second
    
    init(cellSize: UInt) {
        self.cellSize = cellSize.clamped(1, UInt.max)
    }
    
    func location(containing point: CGPoint) -> Location {
        return Location(x: Int(floor((point.x + CGFloat(cellSize) / 2) / CGFloat(cellSize))), y: Int(floor((point.y + CGFloat(cellSize) / 2) / CGFloat(cellSize))))
    }
    
    func centerPosition(of location: Location) -> CGPoint {
        return CGPoint(x: CGFloat(location.x) * CGFloat(cellSize), y: CGFloat(location.y) * CGFloat(cellSize))
    }
    
    func topLeftPosition(of location: Location) -> CGPoint {
        return CGPoint(x: CGFloat(location.x) * CGFloat(cellSize) - CGFloat(cellSize) / 2, y: CGFloat(location.y) * CGFloat(cellSize) - CGFloat(cellSize) / 2)
    }
    
    func contents(at point: CGPoint) -> EnvironmentCellValues {
        return contents(at: location(containing: point))
    }
    
    func contents(at location: Location) -> EnvironmentCellValues {
        return concentrations[location] ?? .zero
    }
    
    func setContents(_ concentration: EnvironmentCellValues, at point: CGPoint) {
        return setContents(concentration, at: location(containing: point))
    }
    
    func setContents(_ concentration: EnvironmentCellValues, at location: Location) {
        if concentration.clampedToNonnegative() == .zero {
            if let existing = concentrations[location], existing == .zero {
                concentrations[location] = nil
            } else {
                concentrations[location] = .zero
            }
        } else {
            concentrations[location] = concentration.clampedToNonnegative()
        }
    }
    
    func addContents(_ amounts: EnvironmentCellValues, at point: CGPoint) {
        addContents(amounts, at: location(containing: point))
    }
    
    func addContents(_ amounts: EnvironmentCellValues, at location: Location) {
        if amounts.foodPheromoneType > 0 {
            //            print("\(location): \(amounts.foodPheromoneType)")
        }
        concentrations[location, default: .zero] = (concentrations[location, default: .zero] + amounts).clampedTo(EnvironmentCellValues(typeA: 500, typeB: 0, typeC: 500, typeD: 1000))
    }
    
    func update(timeDelta: TimeInterval) {
        for (location, concentration) in concentrations {
            if location == .zero {
                setContents(EnvironmentCellValues.withAmount(20000, ofOnly: .homePheromone), at: location)
            } else {
                setContents(concentration - decayRate * timeDelta, at: location)
            }
        }
    }
    
}

extension EnvironmentMap {
    
    func distance(fromLocation location1: Location, to location2: Location) -> Double {
        return centerPosition(of: location1).distance(from: centerPosition(of: location2))
    }
    
    func cellDistance(fromLocation location1: Location, to location2: Location) -> Double {
        return CGPoint(x: location1.x, y: location1.y).distance(from: CGPoint(x: location2.x, y: location2.y))
    }
    
    func locations(withinRadius radius: Double, from location: Location) -> [(Location, CGPoint, Double)] {
        var locations = [(Location, CGPoint, Double)]()
        
        let locationDelta = Int(ceil(radius / Double(cellSize)))
        for x in location.x - locationDelta ... location.x + locationDelta {
            for y in location.y - locationDelta ... location.y + locationDelta {
                if x == location.x && y == location.y { continue }
                
                let proposedLocation = Location(x: x, y: y)
                let distance = self.distance(fromLocation: location, to: proposedLocation)
                if distance <= radius {
                    locations.append((proposedLocation, (centerPosition(of: proposedLocation) - centerPosition(of: location)).normalized, distance))
                }
            }
        }
        
        return locations
    }
    
}

extension EnvironmentMap.Location {
    
    func distance(to location: EnvironmentMap.Location) -> Double {
        return CGPoint(x: x, y: y).distance(from: CGPoint(x: location.x, y: location.y))
    }
    
}

extension EnvironmentMap: PheromoneContaining {
    
    func dropPheromone(_ amounts: EnvironmentCellValues, at point: CGPoint) {
        addContents(amounts, at: point)
    }
    
    func directionOfGreatestConcentration(of type:EnvironmentCellValueType, from point: CGPoint, withRadius radius: Double) -> Double? {
        let bias = (point - centerPosition(of: location(containing: point))) / CGFloat(cellSize)
        let locations = self.locations(withinRadius: radius, from: location(containing: point))
        var cumulativeDirection: CGPoint = .zero
        var substanceEncountered = false
        
        for (location, direction, distance) in locations {
            let amount = CGFloat(contents(at: location).amountOf(type))
            if amount > 0 {
                cumulativeDirection += bias + (direction / CGFloat(distance) * amount)
                substanceEncountered = true
            }
        }
        
        if substanceEncountered {
            _ = 0
        }
        
        return substanceEncountered ? cumulativeDirection.normalized.angle : nil
    }
    
    // Problem: may be different radii, which complicates things considerably.
    func directionOfGreatestConcentrationOfTypes(withWeights weights:EnvironmentCellValues, from point: CGPoint, withRadius radius: Double) -> Double? {
//        let bias = (point - centerPosition(of: location(containing: point))) / CGFloat(cellSize)
        let locations = self.locations(withinRadius: radius, from: location(containing: point))
        var cumulativeDirection: CGPoint = .zero
        var substanceEncountered = false
        
        for (location, direction, distance) in locations {
            //            let amount = CGFloat(contents(at: location).amountOf(type))
            let amounts = contents(at: location)
            if amounts != .zero {
                substanceEncountered = true
                //                cumulativeDirection += bias + (direction / CGFloat(distance) * amount)
                for type in EnvironmentCellValueType.allCases {
                    cumulativeDirection += (direction / CGFloat(distance * amounts.amountOf(type) * weights.amountOf(type)))
                }
            }
        }
        
        if substanceEncountered {
            _ = 0
        }
        
        return substanceEncountered ? cumulativeDirection.normalized.angle : nil
    }
    
}

extension EnvironmentMap: FoodContaining {
    
    func gatherFood(at point: CGPoint) -> Bool {
        var contents = self.contents(at: point)
        guard contents.foodType > 0 else {return false}
        
        contents.foodType -= 1
        setContents(contents, at: point)
        
        return true
    }
    
    func dropFood(at point: CGPoint) {
        var contents = self.contents(at: point)
        contents.foodType += 1
        setContents(contents, at: point)
    }
    
}
