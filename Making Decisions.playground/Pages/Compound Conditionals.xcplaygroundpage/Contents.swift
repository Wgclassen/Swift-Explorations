/*:
## Compound Conditionals
 
 Imagine your five-person band gets a gig, and you have 450 pounds of equipment to haul from your van to the stage. You know that each member of the band can carry 50 pounds of gear per trip, but if anyone has to make more than two trips, they swear they’ll quit on the spot. So you do some arithmetic to figure out whether or not the band should accept the gig:
 */
let bandMemberCount = 5
let weightPerPerson = 50
let maximumTripCount = 2

let gearWeight = 450

let totalCarryingCapacity = bandMemberCount * weightPerPerson * maximumTripCount

if gearWeight < totalCarryingCapacity {
    "Rock on."
} else {
    "Everyone quits! Looks like you've got a solo show."
}
/*:
  Then you take the gig, and your band quits anyway! One of the pieces of equipment weighed 100 pounds and it was raining when you arrived—nobody wanted to get wet hauling the heavy gear. So it looks like your decision is more nuanced: If rain seems probable, you shouldn't have any gear that's difficult to carry. In summary, you should only take a gig if:
  
- You can handle all the gear in two or fewer trips, **and** either it's unlikely to rain or you don't have any especially bulky gear.
 
 That's doable using some `if...else` magic, like this:
 */
let chanceOfRain = 0.5
let bulkiestItemWeight = 60

if gearWeight < totalCarryingCapacity {
    if bulkiestItemWeight < 80 {
        "Rock on."
    } else if chanceOfRain >= 0.1 {
        "Everyone quits! Looks like you've got a solo show."
    }
} else {
    "Everyone quits! Looks like you've got a solo show."
}
/*:
 But that code is less than elegant. One result is duplicated due to the complex logic expressed by multiple `if` and `else` statements. In addition, the nested code isn't very clear to read—any manager that came after you would have a hard time tweaking your algorithm. And of course, adding new factors would produce even more tangled code.
 
 The solution lies with *Boolean operators*. The key terms from your complex decision are the words "and" and "or"—which correspond directly to operators that combine two `Bool` values and evaluate to a `Bool` result.
 
 The Boolean AND operator is written `&&`. It produces `true` only when both its operands are true:
 */
false && false
true && false
false && true
true && true
//:  The Boolean OR operator is written `||`. It produces `true` if either (or both) of its operands are true:
false || false
true || false
false || true
true || true
//:  You can combine simple conditionals with these operators, as well as the Boolean NOT operator, `!` and parentheses, to form new compound conditionals. Equipped with these new tools, you could write a different version of the code. Compare the code below to the one above. Will they have the same or a different result?
if gearWeight < totalCarryingCapacity && (chanceOfRain < 0.1 || bulkiestItemWeight < 80) {
    "Rock on."
} else {
    "Everyone quits! Looks like you've got a solo show."
}
//: This code has the same effect as the one above, although this code is much cleaner. But you can still do better. Next, learn about using functions as conditionals to completely encapsulate complex decisions.
 
/*:
[Previous](@previous)  |  page 8 of 15  |  [Next: Functions and Decisions](@next)
 */