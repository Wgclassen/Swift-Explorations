/*:
## Plots, Revisited
 
 This version of the API also exposes some new types to help you create better scatter plots. `PlotView` displays your plot data. `makePlot()` creates an instance named `plotView`. The plot data is a series of `PlotPoint` instances, stored as an array in the `points` property.
 
 `PlotView` has the following properties:
 
- `points`: An `Array` of `PlotPoint`s.
- `yAxisMinimum`: The minimum value of the Y axis, expressed as a `Double`.
- `yAxisMaximum`: The maximum value of the Y axis, expressed as a `Double`.
- `xAxisMinimum`: The minimum value of the X axis, expressed as a `Double`.
- `xAxisMaximum`: The maximum value of the X axis, expressed as a `Double`.

 `PlotPoint` has the following properties:
 
- `x`: The X coordinate of the point, expressed as a `Double`.
- `y`: The Y coordinate of the point, expressed as a `Double`.
- `color`: The color of the point, expressed as a `Color`.
- `size`: The size of the point, expressed as a `Double`.
 
 You can use several initializers to create a `PlotPoint` instance.
 
 The color will default to `.black` and the size to 5:\
 `init(x:y:f)`
 
The size will default to 5:\
`init(x:y:color:)`
 
 You specify all properties:\
`init(x:y:color:size:)`

 
 As with pie charts and bar charts, you'll also get an instance of `ChartKeyView` called `keyView`.

 - callout(Exercise): Create a plot using your own data.
 */
makePlot()

//:  - callout(Challenge): Recreate the `addPointAt(x:y:color:)`, `setXAxis(minimum:maximum:)`, and `setYAxis(minimum:maximum:)` functions from the first visualization playground.

/*:
[Previous](@previous)  |  page 7 of 9  |  [Next: Plot Settings](@next)
 */