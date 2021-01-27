/*:
## Foraging
 
Now there are piles of food in the simulation, represented in red. When they encounter food, ants pick up a small amount and carry it back to the nest.
 
Researchers have identified many different pheromones that ants use. In this simulation, which is focused on food foraging behavior, you'll look at only two:
 
- The blue squares represent concentration of the "nest" pheromone, which represents proximity to the colony's nest.
- The green squares represent concentration of the "food" pheromone, which represents proximity to a food source.
 
 On the display, blue and green mix to form cyan, the bright blue hue you see when both types of pheromone are present. Yellow is a mix of green and red, which happens as ants discover food and deposit the food pheromone onto the cell with the food source.

 On the previous page, ants wandered aimlessly. But here, ants react to the scent of pheromones, and to the scent of the food. When they're within range, then can choose to follow the *gradient*, the direction of increasing intensity.
 
 Observe the behavior of the colony as it finds and exploits food sources. How do ants decide when to deposit which pheromone? Is the amount they deposit constant? How does the colony behave with multiple sources of food?
 */
startSimulation()
/*:
### Parameters
 
 The pheromone parameters are now set individually per type:
 
- `homePheromoneDepositRate: Double` \
 The rate, in units per second, that the nest pheromone is deposited by an ant \
 *Suggested range: 0–1000* \
 ` `
- `foodPheromoneDepositRate: Double` \
 The rate, in units per second, that the food pheromone is deposited by an ant \
 *Suggested range: 0–1000* \
 ` `
- `homePheromoneEvaporationRate: Double` \
 The rate, in units per second, that the nest pheromone evaporates from a cell \
 *Suggested range: 0–1000* \
 ` `
- `foodPheromoneEvaporationRate: Double` \
 The rate, in units per second, that the food pheromone evaporates from a cell \
 *Suggested range: 0–1000*

 - Experiment: 
 Try modifying these parameters, along with the others from previous pages, to change the foraging behavior of the colony.
 */
//homePheromoneDepositRate = 100
//foodPheromoneDepositRate = 100
//homePheromoneEvaporationRate = 50
//foodPheromoneEvaporationRate = 50

//environmentCellSize = 10
//numberOfAnts = 100

//numberOfAnts = 20
//antSpeed = 150

//: [Previous](@previous)  |  page 5 of 6  |  [Next: Wrapup](@next)