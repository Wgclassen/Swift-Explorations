/*:
## You Make the Choice
 
 To a spellchecker, the sentence “My deer Uncle Joe came to visit” is a perfectly good sentence. There are no mispelled words.
 
 But your Uncle Joe probably doesn’t have four legs and antlers. You probably meant “My _dear_ Uncle Joe…”

 A spell checker can give you a correctly spelled sentence that doesn't say what you mean. In a similar way, a Fix-it will fix errors in your code, but the fix might not be what you meant to do.

 For example, on the last page, you used a Fix-it to turn a constant into a variable.
 
 You’ve already seen that you should only use a variable when the value absolutely needs to change over time. The Fix-it is trying to be helpful, but it could be suggesting that you make something mutable that you wanted to stay immutable.
 
 In the example on the last page, did the value of `name` really need to change? A better solution might have been to set the value of the constant to "John" in the first place:
 */
let name = "John"
/*:
 Always remember that Xcode is trying to give you a helpful suggestion, but it’s just a suggestion. Don’t accept a Fix-it without taking a moment to understand the change it will make.
 
[Previous](@previous)  |  page 8 of 13  |  [Next: Safer Code in a Varying World](@next)
 */