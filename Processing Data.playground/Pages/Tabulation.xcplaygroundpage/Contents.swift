/*:
## Tabulation
 
 Imagine you work for Streaming Plus, a video streaming service. The marketing team wants to know how to spend their advertising budget. To help them decide, the company has provided a survey to users about their favorite shows. The survey lets users type the names of shows rather than showing them a very long scrolling list.
 
 One of your teammates at Streaming Plus has created a `Tabulator` type that you can use to process the survey data. A tabulator records the number of times it sees each unique `String` value you hand to it. It has the following properties and methods:
 
- **`values: [String]`**  A sorted array of the string values that have been tabulated.
- **`func incrementCount(forValue value: String)`**  Increments the count for the given value. If that value hasn't been seen before, it's added to the `values` array and its count is set to 1.
- **`func count(forValue value: String) -> Int`**  Returns the count for the given value. If that value has never been tabulated, the method will return 0.
 
 You can play with the tabulator below. Try adding or changing calls to `incrementCount()` to get a feel for how it works.
 */
var tabulator = Tabulator()

tabulator.incrementCount(forValue: "Ocean Express")
tabulator.incrementCount(forValue: "The Fourth Time")
tabulator.incrementCount(forValue: "The Fourth Time")
tabulator.incrementCount(forValue: "The Sternwood Five")
tabulator.incrementCount(forValue: "The Fourth Time")
tabulator.incrementCount(forValue: "The Fourth Time")
tabulator.incrementCount(forValue: "Ocean Express")
tabulator.incrementCount(forValue: "The Fourth Time")

print(tabulator.values)
//:  - callout(Exercise): Write a loop that iterates through all the tabulated strings (in `tabulator.values`) and prints the count for each one.

/*:
[Previous](@previous)  |  page 2 of 11  |  [Next: Counting Shows](@next)
 */