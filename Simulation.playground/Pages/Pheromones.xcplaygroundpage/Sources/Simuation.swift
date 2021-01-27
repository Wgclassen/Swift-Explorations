import Foundation

public var pheromoneDepositRate = 0.0 {
    didSet {
        homePheromoneDepositRate = pheromoneDepositRate
    }
}

public var pheromoneEvaporationRate = 0.0 {
    didSet {
        homePheromoneEvaporationRate = pheromoneEvaporationRate
    }
}

public func startSimulation() {
//    numberOfAnts = 50
//    pheromoneEvaporationRate = 50
//    pheromoneDepositRate = 800
    homePheromoneDepositFalloffRate = 0

    startSimulation(withFoodPiles: 0)
}
