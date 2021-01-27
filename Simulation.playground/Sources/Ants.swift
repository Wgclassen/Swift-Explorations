import PlaygroundSupport
import SpriteKit

var scene: GameScene!

public var simulationBoundaryRectRadius: CGSize? {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antEnvironmentBoundaryRectRadius = simulationBoundaryRectRadius
        }
    }
}

public var antSpeed: Double = 80 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antSpeed = antSpeed
        }
    }
}

public var numberOfAnts: Int = 100 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.numberOfAnts = numberOfAnts
            if let scene = scene {
                scene.simulation = simulation
            }
        }
    }
}

public var numberOfFoodPiles: Int = 2 {
    didSet {
        simulation = createSimulation()
        if let scene = scene {
            scene.simulation = simulation
        }
    }
}

public var foodPheromoneDepositRate: Double = 1000 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antPheromoneDepositRate.foodPheromoneType = foodPheromoneDepositRate
        }
    }
}

public var homePheromoneDepositRate: Double = 400 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antPheromoneDepositRate.homePheromoneType = homePheromoneDepositRate
        }
    }
}

public var foodPheromoneDepositFalloffRate: Double = 0.1 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antPheromoneDepositFalloffRate.foodPheromoneType = foodPheromoneDepositFalloffRate
        }
    }
}

public var homePheromoneDepositFalloffRate: Double = 0.1 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.antPheromoneDepositFalloffRate.homePheromoneType = homePheromoneDepositFalloffRate
        }
    }
}

public var environmentCellSize: Int = 10 {
    didSet {
        simulation = createSimulation()
        if let scene = scene {
            scene.simulation = simulation
        }
    }
}

public var foodPheromoneEvaporationRate: Double = 10 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.pheromoneDecayRate.foodPheromoneType = foodPheromoneEvaporationRate
        }
    }
}

public var homePheromoneEvaporationRate: Double = 4 {
    didSet {
        if let simulation = simulation {
            simulation.parameters.pheromoneDecayRate.homePheromoneType = homePheromoneEvaporationRate
        }
    }
}

var simulation: AntSimulation?

func createSimulation() -> AntSimulation {
    var parameters = AntSimulation.Parameters()
    
    parameters.numberOfAnts = numberOfAnts
    parameters.antSpeed = antSpeed
    parameters.antPheromoneDepositRate.foodPheromoneType = foodPheromoneDepositRate
    parameters.antPheromoneDepositRate.homePheromoneType = homePheromoneDepositRate
    parameters.pheromoneDecayRate = EnvironmentCellValues(typeA: homePheromoneEvaporationRate, typeB: 0, typeC: foodPheromoneEvaporationRate, typeD: 0)
    parameters.antDetectionSensitivityRadius = EnvironmentCellValues(typeA: 60, typeB: 0, typeC: 40, typeD: 30)
    parameters.antPheromoneDepositFalloffRate = EnvironmentCellValues(typeA: homePheromoneDepositFalloffRate, typeB: 0, typeC: foodPheromoneDepositFalloffRate, typeD: 0)
    parameters.antEnvironmentBoundaryRectRadius = simulationBoundaryRectRadius
    
    let simulation = AntSimulation(parameters: parameters, environmentMap: EnvironmentMap(cellSize: UInt(environmentCellSize)))
    
    simulation.dropRandomFoodPiles(count: UInt(numberOfFoodPiles), ofAmount: 100, minimumDistance: 10, maximumDistance: 20)
    
    return simulation
}

public func startSimulation(withFoodPiles numberOfPiles: Int) {
    numberOfFoodPiles = numberOfPiles
    simulationBoundaryRectRadius = CGSize(width: 320, height: 240)
    createSimulation()

    // Original code; hard-coded values
//    simulation = AntSimulation(numberOfAnts: 100, environmentMap: EnvironmentMap(cellSize: 10))
//    antSpeed = 80
//    var antPheromoneDepositRate = EnvironmentCellValues()
//    antPheromoneDepositRate.foodPheromoneType = 1000
//    antPheromoneDepositRate.homePheromoneType = 400
//    antPheromoneDepositRate.foodType = 400
//    simulation.antPheromoneDepositRate = antPheromoneDepositRate
//    pheromoneDecayRate = EnvironmentCellValues(typeA: 4, typeB: 0, typeC: 10, typeD: 0)
//    antDetectionSensitivityRadius = EnvironmentCellValues(typeA: 60, typeB: 0, typeC: 40, typeD: 30)
//    antPheromoneDepositFalloffRate = EnvironmentCellValues(typeA: 0.1, typeB: 0, typeC: 0.1, typeD: 0)

    /*
//    simulation.antSpeed = 100
//    simulation.environmentMap.decayRate = EnvironmentCellValues(typeA: 10, typeB: 10, typeC: 10, typeD: 0)
//    simulation = AntSimulation(numberOfAnts: 100, environmentMap: EnvironmentMap(cellSize: 10))
    simulation = AntSimulation(numberOfAnts: numberOfAnts, environmentMap: EnvironmentMap(cellSize: pheromoneCellSize))
    simulation.antSpeed = antSpeed
    var depositRate = EnvironmentCellValues()
    depositRate.foodPheromoneType = 1000
    depositRate.homePheromoneType = 400
    depositRate.foodType = 400
    simulation.antPheromoneDepositRate = depositRate
//    simulation.environmentMap.decayRate = EnvironmentCellValues(typeA: 4, typeB: 0, typeC: 10, typeD: 0)
    simulation.antDetectionSensitivityRadius = EnvironmentCellValues(typeA: 40, typeB: 0, typeC: 40, typeD: 30)
    simulation.antPheromoneDepositFalloffRate = EnvironmentCellValues(typeA: 0.1, typeB: 0, typeC: 0.1, typeD: 0)
    
    simulation.environmentMap.decayRate =
    

    print("BEFORE LOAD")
*/


    // Load the SKScene from 'GameScene.sks'
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
    scene = GameScene(fileNamed: "GameScene")
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    scene.simulation = simulation
    
    // Present the scene
    sceneView.presentScene(scene)
    
    PlaygroundPage.current.liveView = sceneView
}
