/*:
## Exercise: Partial Iteration
 
 There may be times that a task doesn't require you to iterate through an entire array. Imagine, for example, you're going to produce a play based on the messages from the previous page. The actor playing the dormouse might want to know if their first appearance isn't until midway through the messages—so they can sleep a bit later on rehearsal day.
 
 Your task on this page is to report the index of the first message that contains a given character's name.
 
 A `for...in` loop will always execute its body for each of the elements in an array. So even though you could use this type of loop to solve the problem, it'd be inefficient—especially for characters who appear early. Instead, you'll use a `while` loop.
 
 `while` loops are a bit like `if` statements. They require a condition before the loop body. The condition is evaluated before each iteration of the loop. The first time it evaluates to `false`, the loop exits. The code below uses a `while` loop to calculate factorial numbers.
 */
let factorialNumberToCalculate = 7
var x = 1
var result = 1

while x <= factorialNumberToCalculate {
    result *= x
    x += 1
}

print("\(factorialNumberToCalculate)! = \(result)")
/*:
 - callout(Exercise): Write code below to iterate through the `aliceMessages` array until the first time you encounter a message for the given character. Then print out the index of that message and exit the loop. Don't print anything if the character isn't found.\
 \
 Use a Boolean variable to keep track of whether you've found a message and an index variable that you increment in the loop. Make sure to test your code with names that won't turn up any messages to account for potential bugs. (Your conditional will be a compound Boolean expression.)
 */

/*:
  _Copyright © 2020 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._

[Previous](@previous)  |  page 18 of 18
 */