/*:
 ## But `wait()`... There's More!
 
 There's one final trick `PixelDisplay` has up its sleeve: The `wait()` method pauses the display for a given period of time before continuing to the next drawing operation. Along with the `clear()` method, `wait()` enables you to create animations by drawing something, pausing for a beat, clearing the screen, and updating the drawing.
 
 The code below animates a single white pixel across the display at 30 frames per second.
 */
var frameTime = 1.0 / 30.0

for i in 0...39 {
    display.setPixel(x: i, y: 5, color: .white)
    display.wait(time: frameTime)
    display.clear()
}
/*:
 - callout(Exercise): Create your own animation using a series of actions in one or more loops. You might want to use one or several variables to track and update the state of your animation.

[Previous](@previous)  |  page 8 of 13  |  [Next: Custom Sprite Types](@next)
 */
