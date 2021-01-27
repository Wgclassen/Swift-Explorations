import Foundation

class Ant {
    
    var position = CGPoint.zero
    var direction = Double.random(in: 0 ..< Double.pi * 2)
    var speed = 1.0 // Units per second
    var isCarryingFood = false // Is carrying 1 unit of food from the environment map
    var maxPheromoneDepositRate = EnvironmentCellValues() {
        didSet {
            currentPheromoneDepositRate = maxPheromoneDepositRate
        }
    }
    var currentPheromoneDepositRate = EnvironmentCellValues()
    var pheromoneDepositFalloffRate = EnvironmentCellValues()
    var currentPheromone = EnvironmentCellValueType.homePheromone {
        didSet {
            currentPheromoneDepositRate.setAmount(maxPheromoneDepositRate.amountOf(currentPheromone), ofType: currentPheromone)
        }
    }
    var pheromoneMap: PheromoneContaining?
    var foodMap: FoodContaining?
    var detectionSensitivityRadius = EnvironmentCellValues()
    
    static var nextID: UInt = 0
    var id: UInt = {
        let id = nextID
        nextID += 1
        return id
    }()
    
    func move(timeDelta: TimeInterval) {
        evaluate()
        
        direction = pickDirection()
        //        print(direction)
        //        print("\((pheromoneMap! as! EnvironmentMap).location(containing: position))")
        depositPheromones(timeDelta: timeDelta)
        
        if isCarryingFood {
            //            print("\(direction * speed * timeDelta)")
        }
        position = position + CGPoint.withAngle(direction) * CGFloat(speed) * CGFloat(timeDelta)
    }
    
    func evaluate() {
        if isCarryingFood {
            if isHome {
                currentPheromone = .homePheromone
                //                foodMap?.dropFood(at: position)
                isCarryingFood = false
            }
        } else if !isHome {
            if (pheromoneMap as! EnvironmentMap).location(containing: position) == EnvironmentMap.Location(x: 10, y: 10) {
                _ = 0
            }
            if foodMap?.gatherFood(at: position) ?? false {
                isCarryingFood = true
                currentPheromone = .foodPheromone
            }
        } else {
            currentPheromone = .homePheromone
        }
    }
    
    func depositPheromones(timeDelta: TimeInterval) {
        pheromoneMap?.dropPheromone(currentPheromoneDepositRate.withOnly(currentPheromone) * timeDelta, at: position)
        currentPheromoneDepositRate -= pheromoneDepositFalloffRate * maxPheromoneDepositRate * timeDelta
        currentPheromoneDepositRate = currentPheromoneDepositRate.clampedToNonnegative()
    }
    
    func pickDirection() -> Double {
        guard let pheromoneMap = pheromoneMap else { return direction.deviated(byAngle: 1) }
        
        var proposedDirection: Double?
        
        switch currentPheromone {
        case .homePheromone:
            let foodPheromoneDirection = pheromoneMap.directionOfGreatestConcentration(of: .foodPheromone, from: position, withRadius: detectionSensitivityRadius.foodPheromoneType)
            let foodDirection = pheromoneMap.directionOfGreatestConcentration(of: .food, from: position, withRadius: detectionSensitivityRadius.foodType)
            let foodPheromoneVector = foodPheromoneDirection == nil ? CGPoint.zero : CGPoint.withAngle(foodPheromoneDirection!)
            let foodVector = foodDirection == nil ? CGPoint.zero : CGPoint.withAngle(foodDirection!)
            let directionVector = (foodPheromoneVector + foodVector * 2)
            if directionVector != .zero {
                proposedDirection = directionVector.angle
            }
        case .foodPheromone:
            proposedDirection = pheromoneMap.directionOfGreatestConcentration(of: .homePheromone, from: position, withRadius: detectionSensitivityRadius.homePheromoneType)
        case .foragingPheromone:
            proposedDirection = pheromoneMap.directionOfGreatestConcentration(of: .foodPheromone, from: position, withRadius: detectionSensitivityRadius.foodPheromoneType)
        default:
            proposedDirection = nil
        }
        
        if let proposedDirection = proposedDirection {
            let proposedVector = CGPoint.withAngle(proposedDirection.deviated(byAngle: currentPheromone == .homePheromone ? Double.pi * 0.65 : Double.pi * 0.25))
            let existingVector = CGPoint.withAngle(direction)
            let newVector = existingVector * 2 + proposedVector
            return newVector.angle
        } else {
            return direction.deviated(byAngle: Double.pi * 0.25)
        }
    }
}

extension Ant {
    
    var isHome: Bool {
        get {
            return self.position.distance(from: .zero) < 20
        }
    }
    
}
