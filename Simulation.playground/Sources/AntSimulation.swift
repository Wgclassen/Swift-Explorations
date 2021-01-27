import Foundation

extension EnvironmentCellValues {
    
    var homePheromoneType: Double {
        get {
            return typeA
        }
        set {
            typeA = newValue
        }
    }
    
    var foragingPheromoneType: Double {
        get {
            return typeB
        }
        set {
            typeB = newValue
        }
    }
    
    var foodPheromoneType: Double {
        get {
            return typeC
        }
        set {
            typeC = newValue
        }
    }
    
    var foodType: Double {
        get {
            return typeD
        }
        set {
            typeD = newValue
        }
    }
}

enum EnvironmentCellValueType: CaseIterable {
    case homePheromone, foragingPheromone, foodPheromone, food
}

extension EnvironmentCellValues {
    
    func amountOf(_ type: EnvironmentCellValueType) -> Double {
        switch type {
        case .homePheromone:
            return homePheromoneType
        case .foragingPheromone:
            return foragingPheromoneType
        case .foodPheromone:
            return foodPheromoneType
        case .food:
            return foodType
        }
    }
    
    mutating func setAmount(_ amount: Double, ofType type: EnvironmentCellValueType) {
        switch type {
        case .homePheromone:
            homePheromoneType = amount
        case .foragingPheromone:
            foragingPheromoneType = amount
        case .foodPheromone:
            foodPheromoneType = amount
        case .food:
            foodType = amount
        }
    }
    
    func withOnly(_ type: EnvironmentCellValueType) -> EnvironmentCellValues {
        return EnvironmentCellValues.withAmount(self.amountOf(type), ofOnly: type)
    }
    
    static func withAmount(_ amount: Double, ofOnly type: EnvironmentCellValueType) -> EnvironmentCellValues {
        switch type {
        case .homePheromone:
            return EnvironmentCellValues.ofTypeA(amount)
        case .foragingPheromone:
            return EnvironmentCellValues.ofTypeB(amount)
        case .foodPheromone:
            return EnvironmentCellValues.ofTypeC(amount)
        case .food:
            return EnvironmentCellValues.ofTypeD(amount)
        }
    }
    
}

protocol PheromoneContaining {
    func dropPheromone(_ amounts: EnvironmentCellValues, at point: CGPoint)
    func contents(at point: CGPoint) -> EnvironmentCellValues
    func directionOfGreatestConcentration(of type:EnvironmentCellValueType, from point: CGPoint, withRadius radius: Double) -> Double?
//    func directionOfGreatestConcentrationOfTypes(withWeights weights:EnvironmentCellValues, from point: CGPoint, withRadii radii: Double) -> Double?
}

protocol FoodContaining {
    func gatherFood(at point: CGPoint) -> Bool
    func dropFood(at point: CGPoint)
}

extension ClosedRange {
    func clamp(_ value : Bound) -> Bound {
        return self.lowerBound > value ? self.lowerBound
            : self.upperBound < value ? self.upperBound
            : value
    }
}

extension Numeric where Self: Comparable {
    func clamped(_ minValue: Self, _ maxValue: Self) -> Self {
        return (minValue...maxValue).clamp(self)
    }
}

extension CGSize {
    func clamped(_ minValue: CGSize, _ maxValue: CGSize) -> CGSize {
        return CGSize(width: (minValue.width...maxValue.width).clamp(self.width),
                      height: (minValue.height...maxValue.height).clamp(self.height))
    }
}

class AntSimulation {
    
    public struct Parameters {
        var numberOfAnts: Int = 1 {
            didSet {
                numberOfAnts = numberOfAnts.clamped(1, .max)
            }
        }
        var antSpeed: Double = 1  {
            didSet {
                antSpeed = antSpeed.clamped(0, .infinity)
            }
        }
        var antPheromoneDepositRate = EnvironmentCellValues() {
                   didSet {
                       antPheromoneDepositRate = antPheromoneDepositRate.clampedToNonnegative()
                   }
               }
        var antPheromoneDepositFalloffRate = EnvironmentCellValues() {
                   didSet {
                       antPheromoneDepositFalloffRate = antPheromoneDepositFalloffRate.clampedToNonnegative()
                   }
               }
        var antDetectionSensitivityRadius = EnvironmentCellValues() {
                   didSet {
                       pheromoneDecayRate = pheromoneDecayRate.clampedToNonnegative()
                   }
               }
        var pheromoneDecayRate = EnvironmentCellValues() {
            didSet {
                pheromoneDecayRate = pheromoneDecayRate.clampedToNonnegative()
            }
        }
        var maxAntDistanceFromNest: Double? {
            didSet {
                maxAntDistanceFromNest = maxAntDistanceFromNest?.clamped(0, .infinity)
            }
        }
        var antEnvironmentBoundaryRectRadius: CGSize? {
            didSet {
                antEnvironmentBoundaryRectRadius = antEnvironmentBoundaryRectRadius?.clamped(.zero, CGSize(width: CGFloat.infinity, height: CGFloat.infinity))
            }
        }
    }
    
    public var parameters: Parameters {
        didSet {
//            print("\(parameters)")
            if ants.count > parameters.numberOfAnts {
                ants.removeLast(ants.count - parameters.numberOfAnts)
            } else if ants.count < parameters.numberOfAnts {
                for _ in 0 ..< parameters.numberOfAnts - ants.count {
                    addAnt()
                }
            }
            
            for ant in ants {
                setupAnt(ant, resetting: false)
            }
            
            environmentMap.decayRate = parameters.pheromoneDecayRate
        }
    }
    
    var ants = [Ant]()
    var environmentMap: EnvironmentMap!
    var antFoodPileCount = UInt(0)
    
    init(parameters: Parameters, environmentMap: EnvironmentMap) {
        self.environmentMap = environmentMap
        self.environmentMap.decayRate = parameters.pheromoneDecayRate
        self.parameters = parameters
        for _ in 1 ... parameters.numberOfAnts {
            addAnt()
        }
    }

    func addAnt() {
        let ant = Ant()
        ants.append(ant)
        setupAnt(ant)
    }
    
    func setupAnt(_ ant: Ant, resetting: Bool = true) {
        ant.speed = parameters.antSpeed
        ant.maxPheromoneDepositRate = parameters.antPheromoneDepositRate
        ant.pheromoneDepositFalloffRate = parameters.antPheromoneDepositFalloffRate
        ant.detectionSensitivityRadius = parameters.antDetectionSensitivityRadius
        
        if resetting {
            ant.pheromoneMap = environmentMap
            ant.foodMap = environmentMap
            ant.currentPheromone = .homePheromone
            ant.position = .zero
            ant.direction = Double.random(in: 0 ..< Double.pi * 2)
        }
    }
    
    func dropRandomFoodPiles(count: UInt, ofAmount amount: Double, minimumDistance: Int, maximumDistance: Int) {
        guard antFoodPileCount < count else { return }
        
        var remaining = count - antFoodPileCount
        while remaining > 0 {
            let location = EnvironmentMap.Location(x: Int.random(in: -maximumDistance ... maximumDistance), y: Int.random(in: -maximumDistance ... maximumDistance))
            if environmentMap.cellDistance(fromLocation: .zero, to: location) < Double(minimumDistance) {
                continue
            }
            
            remaining -= 1
            antFoodPileCount += 1
            
            dropFood(amount: amount, at: location)
        }
    }
    
    func dropFood(amount: Double, at location: EnvironmentMap.Location) {
        environmentMap.setContents(EnvironmentCellValues.withAmount(amount, ofOnly: .food), at: location)
    }
    
    func enforceBoundaries() {
        guard parameters.maxAntDistanceFromNest != nil || parameters.antEnvironmentBoundaryRectRadius != nil else { return }
        
        for ant in ants {
            if let maxDistance = parameters.maxAntDistanceFromNest {
                if ant.position.distance(from: .zero) > maxDistance {
                    setupAnt(ant)
                }
            } else if let boundaryRectRadius = parameters.antEnvironmentBoundaryRectRadius {
                if abs(ant.position.x) > boundaryRectRadius.width || abs(ant.position.y) > boundaryRectRadius.height {
                    setupAnt(ant)
                }
            }
        }
    }
    
    func update(timeDelta: TimeInterval) {
        // Ant actions
        for ant in ants {
            ant.move(timeDelta: timeDelta)
        }
        
        enforceBoundaries()
        
        // Pheromone field
        environmentMap.update(timeDelta: timeDelta)
    }
    
}
