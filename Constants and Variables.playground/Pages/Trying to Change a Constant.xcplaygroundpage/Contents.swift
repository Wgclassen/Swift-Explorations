/*:
## Trying to Change a Constant
 
 What happens if you try to assign a new value to a constant?
 
 As you can see below, Swift returns an error. The error is “Cannot assign to value: 'name' is a 'let' constant.” Now that you know more about what `let` and _constant_ mean, this error makes sense.
 */
let name = "Johnny"
name = "John"
/*:
 The error indicator looks a little different than normal. Can you spot it?
 
 This is the normal error indicator: ![Normal error](NormalError.png)
 
 But the indicator above is a red circle with a white dot in it: ![Fix-it error](FixItError.png)
 
 An error like that means Xcode has an idea how to fix the error.

#### Fix-it
 
 For some errors, Xcode will suggest a change in the code that will fix the error for you. This feature is called _Fix-it_.
 
 Click the red circle with the white dot in it. There are two lines of information. The first line describes the error. The second line suggests a way to fix the error:
 
 ![Fix-it suggestion](FixItSuggestion.png)
 
 The suggestion is to change `let` to `var`. Click the Fix button, and your code will be updated, making the error vanish.
 
Next, see if you should always accept a Fix-it.
 */
 
/*:
[Previous](@previous)  |  page 7 of 13  |  [Next: You Make the Choice](@next)
 */