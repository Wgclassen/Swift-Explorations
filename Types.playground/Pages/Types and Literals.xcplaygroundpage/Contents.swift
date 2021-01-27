/*:
## Types and Literals
 
 When you write a value in code — like `42` or `"hello"` — it’s known as a _literal_. A literal is the simplest form of expression. It's already a value that doesn't need any further evaluation, as opposed to a mathematical expression that's written with an operator like `+` or `*`.
 
 Swift makes assumptions about what types the literals are meant to be. For example, any value inside double quotes will be treated as a `String`, and a whole number will be treated as an `Int`. If you invite some friends to the beach and they meet you wearing swimsuits, you’d use that context clue to infer they'll be jumping into the water. In the same way, Swift uses context clues from code to infer what type something is. It’s called _type inference_.

 There’s another common type that can be inferred. You already know that whole numbers are inferred to be `Int` types, but if you type a number with a decimal point, it will be inferred to be a `Double` type.
 */
let partNumber = 3.2
let wholeNumber = 2
/*:
 You can always find out which type Swift inferred by holding down Option and clicking on the identifier:
 
 ![Quick Help window revealing the inferred Int type of wholeNumber](quick_help.png)

 - Experiment: Try to perform a calculation with `partNumber` and `wholeNumber`, for example add them together. Look at the errors. Change the values to be both whole numbers, or both decimal numbers, and see what difference it makes.\
\
You can‘t mix and match `Double` and `Int` types in Swift because of type safety.
 */

/*:
Next, find out another way Swift decides on types.\
\
[Previous](@previous)  |  page 6 of 13  |  [Next: Type Inference from Assignment](@next)
 */