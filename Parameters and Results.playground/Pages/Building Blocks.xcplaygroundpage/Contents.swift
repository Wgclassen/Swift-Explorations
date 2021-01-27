/*:
## Building Blocks
 
 When you were first introduced to functions it was as a way of grouping tasks together. Each function was a building block for a larger program.
 
 Now you’ve learned that functions can also:
 
- Take information in
- Do work
- Return information
 
 Building blocks like this are much more powerful.
 
 This function can be used to build a list:
 */
func listByAdding(item: String, toList: String) -> String {
    return toList + "\n" + item
}
var list = "Milk"
list = listByAdding(item:"Eggs", toList: list)
list = listByAdding(item:"Bread", toList: list)
//: Compare this to the way you were building lists before, with compound assignment:
list += "\n" + "Rice"
/*:
You’ll probably notice that your code is easier to read when you use this convenience function. You no longer have to use `"\n"` to separate the items in the list. _Hiding complexity_ is one of the key benefits that functions bring to your code.

[Previous](@previous)  |  page 9 of 18  |  [Next: Control Flow](@next)
 */