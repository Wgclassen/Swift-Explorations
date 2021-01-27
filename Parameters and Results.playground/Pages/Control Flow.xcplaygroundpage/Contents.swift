/*:
## Control Flow
 
 Take a second to think about how functions affect the sequence of actions in your code. How can you figure out when each statement in your code will be executed? The order that code executes in a program is called *control flow*.
 
 You're used to seeing the normal sequential flow of code, which follows the instructions in the order they appear. You've also experimented with creating functions, inside of which are more sequences of instructions. But when your code calls a function, the following line doesn't execute until *after* the function returns—that's not simple sequential execution.
 
 Here's how to trace control flow through code that uses functions. Start by finding the first executable statement that's not in a function. (Remember that function declarations don't execute code; they just define it.) Sequential statements execute in the order they appear in the code segment. In the code below, the first statement that executes is on line 15, which assigns an empty string to the variable `list`.
 */
func listByAdding(item: String, toList: String) -> String {
    let newList = toList + "\n- " + item
    return newList
}

var list = ""
var numberOfItems = 0

list = listByAdding(item:"Milk", toList: list)
numberOfItems += 1
list = listByAdding(item:"Eggs", toList: list)
numberOfItems += 1
list = listByAdding(item:"Bread", toList: list)
numberOfItems += 1

print("Your shopping list contains \(numberOfItems) items:\(list)")
/*:
 The two assignments on lines 15 and 16 execute in order. The next executable code, on line 18, calls the `listByAdding` function. When a function call happens, the normal sequential flow of your program is interrupted. Instead of continuing to line 19, control is transferred to the function, which means that the next line of code to execute is line 11. On line 12, the function returns a value. When a function executes a return statement or when the end of its code is reached, control passes back to the code that calls it. Recall that control flow was transferred to the function on line 18. That line now continues executing by assigning the value returned from `listByAdding` to `list`.
 
 The flow moves on to line 19, and a similar pattern continues through the rest of the program.
 
 

Next, learn about how to choose names for your functions and parameters that will make it easier to understand the work they do.

[Previous](@previous)  |  page 10 of 18  |  [Next: Naming](@next)
 */