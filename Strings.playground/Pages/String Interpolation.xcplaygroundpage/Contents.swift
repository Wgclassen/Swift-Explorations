/*:
## String Interpolation
When you define a string in Swift, you can include placeholders that will be filled in later with values. It works a lot like the fill-in-the-blanks example from the previous page:

“Hello _______, welcome to _______!”

But instead of using blank spaces as placeholders, you use `\(name)`. The value of `name` will replace the placeholder.

Take a look at string interpolation in action. Notice in the results sidebar that the values of firstName and city are filled in:
 */
let firstName = "Tim"
let city = "Cupertino"

let welcomeString = "Hello \(firstName), welcome to \(city)"
/*:
 - Experiment: Create your own string to describe your favorite food.\
“I like _____ because it is _____.”
 */
// Change this to your favorite food
let favoriteFood = "pie"

// Change this to why you like it
let reason = "tasty"

// Define a string below in the pattern "I like ___ because it is ___."

/*:
On the next page, see what happens with long strings.

[Previous](@previous)  |  page 8 of 18  |  [Next: Viewing Playground Results](@next)
 */