/*:
## Pie Charts
 
 Pie charts represent a set of values that make up a whole "pie." Imagine you conduct a survey that asks people their favorite fruit: apples, oranges, or bananas. How many in your survey base prefer which fruit? As the responses roll in, you learn that 35% of them choose apples, 25% choose oranges, and 40% choose bananas. To represent this data, a pie chart would divide a circle into three colored wedges (or pie slices): one that occupies 35% of the circle, one that occupies 25%, and one that occupies 40%.
 
 This visualization API allows you to build a pie chart using the `addWedge(withProportion:color:)` function. The two parameters serve the following roles:
 
- `withProportion`: The size of the wedge, as a percentage of the whole pie. The number should be a `Double` between 0 and 1.
- `color`: The color of the wedge. You can use any one of the following values. (Make sure to use a period before the color name, exactly as written below. If you don't, Swift will return a "use of unresolved identifier" error.)
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
 
 Below is an example use of the API.

 - Experiment: Try modifying the parameters to see how they affect the look of the chart. Also try adding more wedges.
 */
makePieChart()

addWedge(withProportion: 0.15, color: .red)
addWedge(withProportion: 0.35, color: .yellow)
addWedge(withProportion: 0.4, color: .blue)
addWedge(withProportion: 0.1, color: .gray)

/*:
[Previous](@previous)  |  page 2 of 11  |  [Next: Chart Key](@next)
 */