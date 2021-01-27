/*:
## Functions and Decisions
 
 Conditionals are perfect opportunities to write helpful functions. If you have some decision-making code that doesn't read easily or makes things look too complicated, you can wrap it in a function and make it look like you’re asking a question.
 
 Take your gig decision from the previous page. The final logic of the decision, used at the site of the `if` statement, means that you have to parse out the entire conditional every time you read through the code.
 
 Instead, you can create a function that returns a `Bool` value to encapsulate all the necessary logic.
 */
func bandCanCarryGear(bandMemberCount: Int, gearWeight: Int, bulkiestItemWeight: Int, chanceOfRain: Double) -> Bool {
    let maximumTripCount = 2
    let weightPerPerson = 50
    let totalCarryingCapacity = bandMemberCount * weightPerPerson * maximumTripCount
    
    return gearWeight < totalCarryingCapacity && (chanceOfRain < 0.1 || bulkiestItemWeight < 80)
}
//:  This approach hides the complexity of the decision. Functions that return a `Bool` can be used directly in an `if` statement, like this:
if bandCanCarryGear(bandMemberCount: 5, gearWeight: 650, bulkiestItemWeight: 60, chanceOfRain: 0.05) {
    "Rock on."
} else {
    "Everyone quits! Looks like you've got a solo show."
}
/*:
Now anyone reading the code should be able to understand what it’s doing. (It looks like you need to hire another drummer, or leave some speakers behind.)

Continue your rock and roll adventure on the next page.

[Previous](@previous)  |  page 9 of 15  |  [Next: Remainder Operator](@next)
 */