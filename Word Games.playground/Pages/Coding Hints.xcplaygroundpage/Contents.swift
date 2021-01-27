/*:
 ## Coding Hints
 
 Declare constants for each of the terms in your text. Name them so that the player knows how to fill them in:
 
    let noun =
    let adjective3 =
 
 While you're developing your code, you'll want to put in placeholder values. Then, when you're ready to play, you'll delete those values. The lines will cause errors, but they'll go away when the player assigns their own values.
 
 Create the final string using your knowledge of string interpolation and concatenation. The approach is up to you—use the one you find works best for your text. If you want, you can use a special string syntax for long text, especially if it contains multiple lines:
 */
let hardToReadStringConstant = "This is a long string with multiple lines. It's a bit hard to read because of the escaped characters.\n\nEspecially if you want empty lines, like the one above, since you have to use multiple consecutive newlines.\nAnd if you want \"quote marks,\" they have to be escaped too."
print(hardToReadStringConstant)
print("******")
let manyLineString =
"""
This is also a long string with multiple lines. It's just like any other string—its syntax is just a little different.
It can be interpolated \(1), \(2), or any number of times. You don't have to escape "quote marks."

And it can contain empty lines, like the one above.
Just use three quotes on their own lines to open and close it.
"""
print(manyLineString)
/*:
 Finally, print the string to the console.

 If you don't want the player to get a peek at your text, you can press return until your string code falls below the bottom of the page.
 
 The next few pages are left blank for you to create your games. Have fun!

[Previous](@previous)  |  page 2 of 7  |  [Next: Game 1](@next)
 */