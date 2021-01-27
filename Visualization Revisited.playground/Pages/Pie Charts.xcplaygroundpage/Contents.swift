/*:
## Pie Charts, Revisited
 
 The new API for pie charts exposes two new types: `PieWedge` and `PieChartView`.
 
 The `PieWedge` struct gives you several ways to create visual effects with pie charts. It has the following properties:
 
- `proportion`: The percentage of the pie occupied by the wedge, expressed as a `Double`.
- `color`: The color of the wedge. You can use any one of the following values. (Remember to use a period before the color name. If you don't, Swift will return a "use of unresolved identifier" error.)
    - .black
    - .blue
    - .brown
    - .cyan
    - .darkGray
    - .gray
    - .green
    - .lightGray
    - .magenta
    - .orange
    - .purple
    - .red
    - .yellow
- `scale`: The radius of the wedge relative to the pie's natural radius, expressed as a `Double`. Less than `1.0` will make the wedge smaller than normal-sized wedges, and greater than `1.0` will make the wedge larger (typically the desired effect).
- `offset`: The distance a wedge lies from the center of the pie, relative to the size of the wedge. An offset of 0 keeps the wedge at the center of the pie. An offset of 1.0 moves the center point of the wedge to where its outer edge would be.
 
 The `makePieChart()` function creates an instance of a `PieChartView` named `pieChartView`. `PieChartView` has one property named `wedges`, which is an array of `PieWedge` instances. Assign an array of wedges to this property, or use the `append()` method of `Array` to add them one at a time.
 
### Keys
 
 `makePieChart()` also creates a key named `keyView`. It's an instance of `ChartKeyView`, which has a `keyItems` property. `keyItems` is an array of `ChartKeyItem` instances. `ChartKeyItem` has the following properties:
 
- `color`: The color swatch displayed in the key. You can use any of the following values.
    - .black
    - .blue
    - .brown
    - .cyan
    - .darkGray
    - .gray
    - .green
    - .lightGray
    - .magenta
    - .orange
    - .purple
    - .red
    - .yellow
- `name`: The text to display expressed as a `String`.

 - callout(Exercise): Create a pie chart using your own data. Play with different `scale` and `offset` properties to see how they affect the look of your chart.
 */
makePieChart()

/*:
[Previous](@previous)  |  page 2 of 9  |  [Next: Pie Chart Settings](@next)
 */