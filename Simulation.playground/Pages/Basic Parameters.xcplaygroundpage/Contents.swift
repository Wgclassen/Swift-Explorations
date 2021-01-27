/*:
## Basic Parameters
 
 The colony's nest is located at the center of the screen. Each of the red dots represents an ant. When the simulation starts, they're all at the nest and will then wander randomly on this page.
 */
startSimulation()
/*:
## Basic Parameters
 
 You can modify the way a simulation behaves by changing its parameters. Although this simulation has many parameters, you'll experiment with just two on this page. You may try any values you want, but there's a suggested range for each one.
 
- `numberOfAnts: Int` \
    The number of ants in the simulation \
     *Suggested range: 1-300* \
 ` `
- `antSpeed: Double` \
    The speed of ant movement, measured in pixels per second \
     *Suggested range: 1-200*

 - callout(Exercise): 
 Try modifying these parameters to see how they affect the simulation.

 Observe how quickly the ants dissipate and how much of the screen they cover. What happens when an ant wanders too far?
 */
//numberOfAnts = 2
//antSpeed = 150
//: - Note: The ants' wandering is created by using a *random number generator*. Random numbers are often used in simulations to approximate the variability that exists in the real world. Without random behavior, the ant simulation would be *deterministic*, meaning that you'd see identical ant behavior every time for a given set of parameter values. That wouldn't be a good approximation of real ants.
/*:
[Previous](@previous)  |  page 3 of 6  |  [Next: Pheromones](@next)
 */