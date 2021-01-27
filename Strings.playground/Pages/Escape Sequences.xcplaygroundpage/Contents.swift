/*:
## Escape Sequences
When you type an _escape character_ followed by something that’s treated specially, you're creating an _escape sequence_. You’ve already seen two different kinds of escape sequences:
 */
// The backslash followed by a quotation mark is an escape sequence.
let favoriteQuotation = "Hamlet said, \"To be, or not to be?\""

// Another escape sequence is the placeholder in an interpolated string.
let flavor = "chocolate"
let iceCreamAnnouncement = "The flavor of the day is \(flavor)"
/*:
Some escape sequences in Swift let you insert invisible characters. One that you’ll use often is the _newline_ character. As you might guess from the name, this character makes the text skip to a new line.

The escape sequence for a newline is the backslash character followed by the letter “n”:
 */
let startOfAPoem = "Roses are red.\nViolets are blue."
/*:
In the result displayed above, notice a new line starts where the `\n` appears in the string.

 - Note: If the result isn't visible, click the show result button for the line of code above.

Also notice that the string in the results sidebar shows the `\n` instead of skipping a line.\
That’s because the results sidebar can only use one line to show results.


Move on to the next page to wrap things up.

[Previous](@previous)  |  page 12 of 18  |  [Next: Wrapup](@next)
 */