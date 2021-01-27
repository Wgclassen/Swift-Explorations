/*:
 ## Composition
 
 In computer graphics, it's common to repeat graphic elements. The functions below create a basic person. They use the provided `block` function, a slightly modified version from the previous page that returns an array rather than setting pixels directly.
*/
func block(x: Int, y: Int, width: Int, height: Int, color: Color) -> [Pixel] {
    var pixels = [Pixel]()
    for x in x ... x + width - 1 {
        for y in y ... y + height - 1 {
            pixels.append(Pixel(x: x, y: y, color: color))
        }
    }
    return pixels
}

func legs() {
    display.batchSetPixels(block(x: 18, y: 10, width: 2, height: 4, color: .blue))
}
func torso() {
    display.batchSetPixels(block(x: 17, y: 14, width: 4, height: 3, color: .white))
}
func head() {
    display.batchSetPixels(block(x: 18, y: 17, width: 2, height: 2, color: .yellow))
}

func person() {
    legs()
    torso()
    head()
}

person()
/*:
 It's great to use functions to encapsulate parts into a whole, but modifying the position of the person isn't easy. It would be impossible to manage a crowd of people without creating additional functions.
 
 - callout(Experiment): Try changing the position of the person. How many functions and values did you have to edit?

[Previous](@previous)  |  page 6 of 13  |  [Next: Sprites](@next)
 */