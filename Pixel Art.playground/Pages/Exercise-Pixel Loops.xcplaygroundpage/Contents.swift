/*:
 ## Exercise: Pixel Loops
 
By using an array, you can create animated line drawings. The predefined functions below make the code for the array a bit more compact. To customize the graphic, feel free to add functions for other colors. This page has a display of 20 by 20 pixels.
 
 For added convenience, there's also a new `setPixel(_ pixel: Pixel)` method for `PixelDisplay`.
 */
func pixel(_ x: Int, _ y: Int, _ color: Color) -> Pixel {
    return Pixel(x: x, y: y, color: color)
}
func blackPixel(_ x: Int, _ y: Int) -> Pixel {
    return pixel(x, y, .black)
}

display.backgroundColor = .white

// Sample pixel using the new `setPixel(_ pixel: Pixel)` method
let pixel = Pixel(x: 0, y: 0, color: .red)
display.setPixel(pixel)

var pixels = [
    pixel(18, 10, .black), pixel(18, 10, .black), pixel(18, 11, .black), pixel(18, 12, .black), pixel(17, 13, .black), pixel(17, 14, .black), pixel(17, 14, .black), pixel(16, 15, .black), pixel(15, 16, .black), pixel(15, 16, .black), pixel(14, 17, .black), pixel(13, 17, .black), pixel(13, 17, .black), pixel(12, 18, .black), pixel(11, 18, .black), pixel(10, 18, .black), pixel(10, 18, .black), pixel(9, 18, .black), pixel(9, 18, .black), pixel(8, 18, .black), pixel(7, 17, .black), pixel(6, 17, .black), pixel(5, 16, .black), pixel(5, 16, .black), pixel(4, 15, .black), pixel(4, 15, .black), pixel(3, 14, .black), pixel(3, 13, .black), pixel(2, 12, .black), pixel(2, 12, .black), pixel(2, 11, .black), pixel(2, 10, .black), pixel(2, 10, .black), pixel(2, 9, .black), pixel(2, 8, .black), pixel(3, 7, .black), pixel(3, 6, .black), pixel(4, 5, .black), pixel(4, 5, .black), pixel(5, 4, .black), pixel(6, 3, .black), pixel(7, 3, .black), pixel(8, 2, .black), pixel(9, 2, .black), pixel(10, 2, .black), pixel(10, 2, .black), pixel(10, 2, .black), pixel(11, 2, .black), pixel(12, 2, .black), pixel(13, 3, .black), pixel(13, 3, .black), pixel(14, 3, .black), pixel(15, 4, .black), pixel(16, 5, .black), pixel(16, 5, .black), pixel(17, 6, .black), pixel(17, 7, .black), pixel(17, 7, .black), pixel(18, 8, .black), pixel(18, 9, .black), pixel(18, 10, .black)
]
/*:
 - callout(Exercise): Using the array of pixels above, write an animation loop that draws them one at a time, ending up with the entire drawing. (Hint: you don't have to clear the screen between iterations.)

 */


/*:
 - callout(Challenge): Try modifying the array to draw different things. To create different styles, experiment with the loop by clearing the display between iterations—or after every `n` iterations, using the `%` modulo operator.

[Previous](@previous)  |  page 12 of 13  |  [Next: Exercise: Freeform Animation](@next)
 */

