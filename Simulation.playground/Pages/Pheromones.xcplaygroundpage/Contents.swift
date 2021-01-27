/*:
## Pheromones
 
 The ant colony model is based on a fundamental behavior of ants: They secrete pheromones into the environment. Pheromones are chemicals that many animals (including humans) use to communicate via smell. Much of the behavior of an ant colony is regulated by pheromones.
 
 The environment is modeled by dividing the world into a grid of cells. When an ant deposits some pheromone, it increases the concentration of the pheromone in the cell where the ant is located. The brightness of color in a cell represents its concentration of pheromone.
 */
startSimulation()
/*:
## Basic Parameters
 
 You can modify the way a simulation behaves by changing its parameters. On this page, you'll experiment with four.
 
- `environmentCellSize: Int` \
    The width and height in pixels of each cell in the environment \
    *Suggested range: 1–25* \
 ` `
- `numberOfAnts: Int` \
    The number of ants in the simulation \
    *Suggested range: 1–300* \
 ` `
- `pheromoneEvaporationRate: Double` \
    The rate, in units per second, that pheromone evaporates from a cell \
    *Suggested range: 0–1000* \
 ` `
- `pheromoneDepositRate: Double` \
    The rate, in units per second, that pheromone is deposited by an ant \
    *Suggested range: 0–1000*

 - callout(Exercise): 
 Try modifying these parameters to see how they affect the simulation. Look to see how quickly trails or areas of pheromone grow and dissipate, and whether there is any long-lived structure.
 */
//environmentCellSize = 10
//numberOfAnts = 100
//pheromoneEvaporationRate = 50
//pheromoneDepositRate = 400
/*:
### Visualization
 
 Simulations often visualize parts of a natural system that are normally invisible. Ants don't actually deposit visible pheromones, and the model would be more visually accurate if pheromones were invisible. But visualizing pheromones is a critical analytical tool for this simulation. On the next page, you'll see why.
 
 
[Previous](@previous)  |  page 4 of 6  |  [Next: Foraging](@next)
 */