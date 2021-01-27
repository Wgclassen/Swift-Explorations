/*:
## Password Security
 
 Passwords like "abcdef" or "123qwe" or "password" may be easy to remember, but they only provide an illusion of security. Hackers are ever more sophisticated in their attacks, so you should be careful to select a password that can't be guessed easily.
 
 Imagine that you've created a new app that requires users to sign up for an account. When they sign up, they have to choose an account password. You want your users to have a secure passwords, so you'll use this playground to develop an algorithm that rejects insecure passwords.
 
 The first step is to ensure that the user hasn't chosen one of the most commonly used passwords, which hackers are sure to try first. It's the easiest way to get into somebody's account, since it doesn't require a sophisticated algorithm to make a guess.
 
 The array below contains the [ten most commonly used passwords of 2017](https://www.teamsid.com/worst-passwords-2017-full-list/), according to [TeamsID](https://www.teamsid.com/security/), an Internet security company.
 */
let tenMostCommonPasswords = [
    "123456",
    "password",
    "12345678",
    "qwerty",
    "12345",
    "123456789",
    "letmein",
    "1234567",
    "football",
    "iloveyou"
]
/*:
### Implement your algorithm below.
 
 Use the `contains()` method of `Array` to make sure the user hasn't chosen one of these passwords. Display a message informing the user whether or not they've chosen a secure password.
 */
let password = "password"

/*:
page 1 of 5  |  [Next: Checking for Characters](@next)
 */