/*:
## Chart Key
 
 A chart without labels doesn't communicate very well. An additional function, `addKeyItem(withLabel: color:)`, lets you create a key that matches each color in the chart with the item or idea it represents.
 
- `withLabel`: The `String` name of the label.
- `color`: The color of the label. You can use the same list of colors that you applied to the wedges:
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

 - Experiment: Edit the code below to see how the key items work.
 */
makePieChart()

addWedge(withProportion: 0.3, color: .purple)
addWedge(withProportion: 0.15, color: .yellow)
addWedge(withProportion: 0.2, color: .green)
addWedge(withProportion: 0.35, color: .red)

addKeyItem(withLabel: "Grapes", color: .purple)
addKeyItem(withLabel: "Bananas", color: .yellow)
addKeyItem(withLabel: "Limes", color: .green)
addKeyItem(withLabel: "Strawberries", color: .red)

/*:
[Previous](@previous)  |  page 3 of 11  |  [Next: Your Own Data](@next)
 */