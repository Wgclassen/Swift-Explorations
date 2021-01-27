/*:
## Plot Customization
 
 These additional API functions let you further customize your plots.
 
 You can set the maximum and minimum values of the X and Y axes using the two functions below. Note that, in most cases, the two axes won't be displayed at the same scale.
 
 `setXAxis(minimum:maximum:)`
 
- `minimum`: The minimum value of the axis, specified as a `Double`.
- `maximum`: The maximum value of the axis, specified as a `Double`.
 
 `setYAxis(minimum:maximum:)`
 
- `minimum`: The minimum value of the axis, specified as a `Double`.
- `maximum`: The maximum value of the axis, specified as a `Double`.

 - Experiment: Edit the code below to change the look of the chart.
 */
makePlot()

setXAxis(minimum: -10, maximum: 10)
setYAxis(minimum: -10, maximum: 10)

addPointAt(x: 1, y: 2, color: .black)
addPointAt(x: 3, y: 1, color: .black)
addPointAt(x: 3, y: 4, color: .black)
addPointAt(x: 2, y: 6, color: .black)
addPointAt(x: 4, y: 5, color: .black)
addPointAt(x: 7, y: 5, color: .black)
addPointAt(x: -8, y: 2, color: .black)
addPointAt(x: 10, y: -6, color: .black)
addPointAt(x: -8, y: -9, color: .black)

/*:
[Previous](@previous)  |  page 9 of 11  |  [Next: Your Own Data](@next)
 */