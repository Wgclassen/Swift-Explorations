/*:
## Bar Chart Customization
 
 Additional API functions let you further customize your bar charts.
 
 You can set the maximum and minimum values of the Y axis using the `setYAxis(minimum:maximum:)` function.
 
- `minimum`: The bottom value of the axis, specified as a `Double`. If a bar is shorter than this value, it won't show up in the chart.
- `maximum`: The top value of the axis, specified as a `Double`. If a bar is higher than this value, it won't display its true height, since it will extend higher than the top of the chart.
 
 To make sense of the data, you'll need to add labels. Call the `addBarLabel(_:)` function to add a label to the X axis. The sole argument to this function is a `String`. As you add labels, they'll be equally spaced across the width of the chart. If you call the function as many times as you have bars, your labels will line up neatly under the bars in the chart.

 - Experiment: Edit the code below to change the look of the chart.
 */
makeBarChart()

setYAxis(minimum: 0, maximum: 100)

addBar(withLength: 60, color: .yellow)
addBar(withLength: 83, color: .green)
addBar(withLength: 45, color: .red)
addBar(withLength: 17, color: .purple)

addBarLabel("Bananas")
addBarLabel("Limes")
addBarLabel("Strawberries")
addBarLabel("Grapes")

/*:
[Previous](@previous)  |  page 6 of 11  |  [Next: Your Own Data](@next)
 */