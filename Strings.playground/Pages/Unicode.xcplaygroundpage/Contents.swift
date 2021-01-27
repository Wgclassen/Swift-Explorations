/*:
## Unicode

Unicode is an international standard that can represent almost any character from any language in a standard way.

Strings in Swift are fully Unicode-compliant, so you can create strings that contain the text of different languages, so you can create apps that can be used by people around the world:
 */
let englishGreeting = "Hello, World!"

let chineseGreeting = "你好，世界!"

let spanishGreeting = "¡Hola Mundo!"

let russianGreeting = "Привет мир!"

let japaneseGreeting = "こんにちは世界!"
//: Of course, programmers around the world speak different languages. In Swift, they can use Unicode in names as well as in strings:
// Constant name in Chinese that means 'English Greeting'
let 英语问候 = "Hello, World!"

// Constant name in French that means 'English Greeting'
let salutationAnglais = "Hello, World!"
/*:
Emoji characters are also defined in Unicode, so you can include emoji in strings.\
(On the Mac, press Command-Control-Space to bring up an emoji picker.)
 */
let welcomingPhrase = "Welcome! 😀"
let fruitSalad = "🍓🍏🍒🍐🍇🍉🥭🥥🍊"
/*:
Move on to the next page to see another way to see values in playgrounds.

[Previous](@previous)  |  page 4 of 18  |  [Next: The Console](@next)
 */