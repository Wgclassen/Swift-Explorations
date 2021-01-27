/*:
## Computed Properties
 
 A `Song` has a `duration` property, measured in seconds. But it would also be useful to ask a song for its duration as a string formatted in minutes and seconds.
 
 To solve this, you could have two properties, `minutes` and `seconds`, but then you would need to perform a calculation to find out the total duration. Alternatively, you could have three properties — `minutes`, `seconds`, and `duration` — but it would be easy to create a struct with inconsistent data, where the duration value didn't add up to the right number of minutes and seconds.
 
 A better approach to the problem would be to calculate the formatted string from the duration value.
 
 For properties that can be calculated on demand, you can add a _computed property_ to the struct like this:
 */
struct Song {
    let title: String
    let artist: String
    let duration: Int
    
    var formattedDuration: String {
        let minutes = duration / 60
        // The modulus (%) operator gives the remainder
        let seconds = duration % 60
        return "\(minutes)m \(seconds)s"
    }
    
}
let song = Song(title: "No, no, no", artist: "Fizz", duration: 150)
song.formattedDuration

/*:
 You have already encountered a computed property: the `count` of an `Array`.
 
 A computed property is declared as a `var`, since it could change depending on the rest of the struct. The rest of the declaration consists of a name, a type annotation, and then some code in braces, which has to return a value of the correct type. You can access the computed property just like any other.
 
 Note that inside the definition of `formattedDuration`, the property `duration` is accessed without dot notation. Within the code of a struct, you can access its own properties directly by their names, without using the dot.

 - callout(Exercise): Add another computed property to `Song` named `formattedTitle`, which gives you a `String`. For the song above, the formatted title would be “No, no, no by Fizz”.

 Computed properties are a further example of the power of structs to create data abstraction. Instead of using separate functions outside the struct, you can put related functionality right alongside the data it relies on. Code that uses the struct can simply use these new properties without needing to know how they work.

 - callout(Exercise): Re-implement the song information function from page 4 as a computed property. It can rely on the other computed properties to do its work. (Imagine how these two computed properties would have looked as separate functions operating on data from parallel arrays!)

 Next see how the types you defined can be used in functions.

[Previous](@previous)  |  page 6 of 10  |  [Next: Functions](@next)
 */