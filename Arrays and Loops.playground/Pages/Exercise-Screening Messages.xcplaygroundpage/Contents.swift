/*:
## Exercise: Screening Messages

 You've somehow come to possess a huge list of messages about a series of characters: Caterpillar, Dormouse, Cheshire Cat, and others. The list is contained in the `aliceMessages` constant below.
 
 Try to print out the `aliceMessages` array to see the whole list, but beware: It's large enough that it may cause your playground to run slowly.
 */
import Foundation

aliceMessages


/*:
 The Caterpillar has asked you to go through the messages and to relay any that contain the Caterpillar's name, along with the message number. Instead of reading all the text yourself, you decide to write more code to help.
 
 You'll use another kind of `for...in` loop on this page. You're accustomed to the loop variable containing the items from the array, but in this case, you want to print the message number. So your loop will iterate over the *indices* of the array instead of its contents. Here's an example of iterating over the indices of an array.
 */
let colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]

for i in 0 ... colors.count - 1 {
    print("\(i): \(colors[i])")
}
/*:
 The loop variable is `i`. Its values are defined by the *range expression* to the right. It uses the `...` operator to define a series of values starting with the one on the left, going up through the one on the right. To generate the indices of an array, the start of the range is 0, and the end is the last index, which is one less than the count of the array.
 
 - callout(Exercise): Create a `for…in` loop to process the `aliceMessages` array by iterating through its legal indices.
    - In the body of the loop, use the index to access a message from the array and check whether it `contains` the string "Caterpillar".
    - If the message refers to the Caterpillar, print it to the console, along with its index.

 This process is called a *linear search*. Linear search is a common algorithm for processing arrays by examining its contents in order and evaluating each item to determine whether it meets certain criteria.

 - Note: The `contains` method is part of the `Foundation` framework that you read about in the “Types” playground. That's why the `import Foundation` statement is in the code above. If the framework isn't imported, you'll get an error saying “Value of type 'String' has no member 'contains'.”
 */
// Write the `for…in` loop here:

/*:
[Previous](@previous)  |  page 17 of 18  |  [Next: Exercise: Partial Iteration](@next)
 */