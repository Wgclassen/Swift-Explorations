/*:
 ## Higher-Order Information
 
 So far, you've done some basic *data transformation* to correct errors. As a result, you've tabulated the entire survey. That makes marketing team happy—they know exactly the number of votes for each show.
 
 But now they'd like a high-level summary. These are their questions:
 
 - Which are the three most popular shows?
 - Which are the three least popular shows?
 - How do shows compare to each other in terms of the ranking: not very popular, moderately popular, or very popular?

 Deriving extra information from a data set is a common technique, sometimes referred to as *data translation*. You'll write functions on the next few pages to answer the questions above by doing some translations of your data set. You'll find that you can use some common list algorithms as building blocks to complete these tasks.
 
 First, note that your teammate has extended the Tabulator type with a new property, `tabulatedValues`, of type `[TabulatedValue]`. A `TabulatedValue` is a simple struct with two members: the value and its count. Note that the array is not returned in any particular order—you'll notice that it changes each time the code runs.
 
 - experiment: Add more values to the tabulator to see how the `tabulatedValues` property works.
 */
var tabulator = Tabulator()

tabulator.incrementCount(forValue: "Ocean Express")

print(tabulator.tabulatedValues)

//: [Previous](@previous)  |  page 8 of 11  |  [Next: Least and Most Popular](@next)