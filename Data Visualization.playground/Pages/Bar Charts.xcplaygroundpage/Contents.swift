/*:
## Bar Charts
 
 The bar chart API functions let you build charts with any number of individually colored bars. Bar charts are typically used to compare different categories of data. One axis of the chart shows the categories being compared, and the other axis represents a value scale. The heights (or lengths) of the bars are proportional to the values they represent.
 
 Imagine, for example, you want to compare the number of students in each of your classes. Each class would have its own bar, and the number of students in the class would be represented by the height of the bar. Or maybe you want to compare how much money you spent in each of the past six months. Each month would be a bar, and its height would represent the dollars you spent during that month.
 
 The function `addBar(withLength:color:)` adds a bar to the chart. It's very similar to `addWedge(withProportion:color:)`.
 
- `withLength`: The size of the bar expressed as a `Double`.
- `color`: The color of the bar. You can use any one of the following values. (Remember about using a period before the color name.)
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

 
 The bar chart on this page has a minimum value of 0 and a maximum value of 10.
 
 Below is an example use of the API.

 - Experiment: Try modifying the parameters to see how they affect the look of the chart. Also try adding more bars.
 */
makeBarChart()

addBar(withLength: 1, color: .yellow)
addBar(withLength: 5, color: .green)
addBar(withLength: 9, color: .red)
addBar(withLength: 3, color: .purple)

/*:
[Previous](@previous)  |  page 5 of 11  |  [Next: Bar Chart Customization](@next)
 */