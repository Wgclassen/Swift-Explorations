/*:
## Bar Chart Settings
 
 You also have three new `enum`s that control the look of horizontal axis labels on your bar charts. They are:
 
 `AxisLabelGravity`
- `top`: Axis labels will align to the top of the axis label area.
- `bottom`: Axis labels will align to the bottom of the axis label area.
 
 `AxisLabelAttachment`
- `beginning`: Axis labels will attach at the beginning of the text.
- `end`: Axis labels will attach at the end of the text.
 
 `AxisLabelDistributionStyle`
- `endToEnd`: Axis labels will be distributed evenly, with the first and last labels aligning with the beginning and end of the axis, respectively.
- `centeredIntervals`: Axis labels will be distributed evenly with equal amounts of space around them.
 
 Three new properties of `BarChartView` let you control the look of the series labels:
 
- `seriesLabelGravity`, of type `AxisLabelGravity`
- `seriesLabelAttachment`, of type `AxisLabelAttachment`
- `seriesLabelDistributionStyle`, of type `AxisLabelDistributionStyle`

 - callout(Exercise): Experiment with the horizontal axis labels.
 */
makeBarChart()

/*:
[Previous](@previous)  |  page 6 of 9  |  [Next: Plots, Revisited](@next)
 */