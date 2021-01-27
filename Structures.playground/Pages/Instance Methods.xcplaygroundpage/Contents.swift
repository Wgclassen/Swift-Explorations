/*:
## Instance Methods
 
 You learned how to use instance methods in the Instances lesson. When you define your own type, you can also define instance methods.
 
 Instance methods are declared like functions, but you put them inside the body of the type definition:
 */
struct Rectangle {
    let width: Int
    let height: Int
    
    func isBiggerThan(_ rectangle: Rectangle) -> Bool {
        let areaOne = width * height
        let areaTwo = rectangle.width * rectangle.height
        return areaOne > areaTwo
    }
}

/*:
Notice that within the body of the method definition, you can access the values of `height` and `width` of the struct without using a dot. The instance method is written as part of the struct definition, and so it can directly access the properties within the instance.

Just like the methods on built-in types, the methods you define are called using the instance name, then a dot, then the name and arguments of the method:
 */
let rectangle = Rectangle(width: 10, height: 10)
let otherRectangle = Rectangle(width: 10, height: 20)

rectangle.isBiggerThan(otherRectangle)
otherRectangle.isBiggerThan(rectangle)


//:  - callout(Exercise): Simplify the `isBiggerThan` method by creating a computed property named `area` for the rectangle struct and then using the computed property inside the `isBiggerThan()` method.
 
//:  - callout(Exercise): For further practice, extend the `Song` struct below by adding a `isLongerThan` method. You can paste your code from page 6 as a starting point. Then use a loop to find the longest song in the array and print it to the console. (Hint: use a variable to keep track of the longest song and initialize it to the first one in the array.)
struct Song {
    let title: String
    let artist: String
    let duration: Int

    /* Code from page 6 here, plus the new method */
}

let songs = [
    Song(title: "Ooh yeah", artist: "Brenda and the Del-chords", duration: 90),
    Song(title: "Maybe", artist: "Brenda and the Del-chords", duration: 200),
    Song(title: "No, no, no", artist: "Fizz", duration: 150),
    Song(title: "Makin' up your mind", artist: "Boom!", duration: 440)
]


/*:
 Instance methods are just like computed properties in the way they enable data abstraction.
 
Next, a summary of what you’ve learned.

[Previous](@previous)  |  page 8 of 10  |  [Next: Wrapup](@next)
 */