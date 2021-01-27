/*:
 ## Similar, Yet Different
 
 On the [Conditionals](Conditionals) page, you learned that code that looks correct can produce the wrong result. If/else statements are tricky to get right when you're first learning about them. There are two rules to keep in mind:
 
 1. Multiple if statements appearing sequentially will all get executed.
 2. In an if/else statement with multiple "else if" or "else" clauses, *only* one will execute—the first one that evaluates to true.
 
 This page has some code samples with errors. You'll observe how they work and then fix them.
 
 The code segment below converts number grades to letter grades according to the following rules:
 
 - F's are below 70.
 - C's are between 70 and 79.
 - B's are between 80 and 89.
 - A's are 90 or greater.
 */
let grade = 55

if grade >= 90 {
    print("You got an A 🤩")
} else if grade >= 80 {
    print("You got a B 😌")
} else if grade >= 70 {
    print("You got a C 😕")
} else {
    print("You got an F 😭")
}
/*:
 Try to predict what happens as you increase the score. What will the program print?
 
 - callout(Exercise): Fix the code so that it prints the correct outcome. You might do that by reordering it, or by using else clauses.
 
 Now look at the next code segment. It was written by your (somewhat demanding) bandmate, who explained how they came up with the logic:
 
 "If a gig is more than 20 miles away, our manager needs to bring something for me to read. If it's less than five miles away, tell them I'll leave extra early to exercise and get some steps in. But if it's more than 100 miles away, I'm not really interested in playing—they should find a sub for me. Otherwise I'm super low maintenance."
 */
let gigDistance = 3

if gigDistance > 100 {
    print("Better find somebody else on bass.")
} else if
    gigDistance > 20 {
    print("I need something to read.")
} else if gigDistance > 5 {
    print("You know me—I'm easy! Let's hop in the van.")
} else {
    print("I'll meet you there.")
}
/*:
 - callout(Exercise): Try testing the code with different distances. Then fix the code (and tell your bandmate they should take a Swift programming course).

[Previous](@previous)  |  page 14 of 15  |  [Next: Exercise: Leap Years](@next)
 */
