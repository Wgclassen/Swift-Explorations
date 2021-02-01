/*:
## Exercise: Goals

Think of a goal of yours that can be measured in progress every day, whether it’s minutes spent exercising, number of photos sent to friends, hours spent sleeping, or number words written for your novel.

 - callout(Exercise): Create an array literal with 20 to 25 items of sample data for your daily activity. It may be something like `let milesBiked = [3, 7.5, 0, 0, 17 ... ]` Feel free to make up or embellish the numbers, but make sure you have entries that are above, below and exactly at the goal you've thought of. _Hint: Make sure to choose the right kind of array for your data, whether `[Double]` or `[Int]`._
 */
let readPages = [3, 7, 20, 15, 23, 24, 25, 1, 25, 64, 75, 100, 40, 52, 51, 52, 64, 75, 87, 91, 21, 1, 13, 17, 21]
readPages.count
//:  - callout(Exercise): Write a function that takes the daily number as an argument and returns a message as a string. It should return a different message based on how close the number comes to your goal. You can be as ambitious and creative as you'd like with your responses, but make sure to return at least two different messages depending on your daily progress!
let bestScore = 30
let goodScore = 20
let avgScore = 10

func readEvaluation (score: Int) -> String {
    if score > bestScore {
        return ("incrível!")
    }else if score > goodScore {
        return ("muito bom!")
    } else if score > avgScore {
        return ("bom, mas podia ler mais!")
    } else {
    return ("muito ruim!")
    }
}
//:  - callout(Exercise): Write a `for…in` loop that iterates over your sample data, calls your function to get an appropriate message for each item, and prints the message to the console.
for day in 0..<readPages.count {
    print ("No dia \(day+1) você leu \(readPages[day]) páginas, " + readEvaluation(score: readPages[day]))
}
/*:
[Previous](@previous)  |  page 16 of 18  |  [Next: Exercise: Screening Messages](@next)
 */
