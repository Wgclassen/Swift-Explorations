/*:
## Brute-Force Guessing
 
 How long does it take to guess a password by brute force? It depends on its length and the kinds of characters it's known to contain. With long, complicated passwords, the algorithm for brute-force guessing takes unreasonably long to run.
 
 What does it mean for an algorithm to run in an unreasonable amount of time?
 
 Look at the code below. The `passwordIsCorrect(_:)` function acts as the login form for a hypothetical web service, returning `true` when the correct password is entered. The `guessPasswordOfThreeCharacters(containing:)` function uses a brute-force algorithm to try all possible combinations of the characters passed in.
 
 This function is used below to guess a purely numeric password. Looking at the results bar on the right, you'll notice it guesses the correct password on the 124th try.
 */
import Foundation

func passwordIsCorrect(_ password: String) -> Bool {
    return password == "123"
}

let digits = "0123456789"
let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
let lowercaseAlphas = "abcdefghijklmnopqrstuvwxyz"
let uppercaseAlphas = lowercaseAlphas.uppercased()

func guessPasswordOfThreeCharacters(containing characters: String) {
    var password: String = ""
    
    for a in characters {
        for b in characters {
            for c in characters {
                password = String(a) + String(b) + String(c)
                if passwordIsCorrect(password) {
                    print("Found password: \(password)")
                    // The return statement below means that the function exits
                    // early when the password is guessed, rather than executing
                    // all loops to completion.
                    return
                }
            }
        }
    }
}

guessPasswordOfThreeCharacters(containing: digits)
/*:
 Try passing in a different character set to `guessPasswordOfThreeCharacters(containing:)` by combining the arrays above. For example, you can pass in `digits + lowercaseAlphas` to check for all digits and lowercase letters.
 
 Here are some questions to think about (the answers may differ depending on the set of characters you use):
 
- How many calculations are needed for the password "456" when checking only digits?
- How many calculations are needed for the password "456" when checking digits and lowercase letters?
- Does it matter in which order the arrays are combined?
- What is the maximum number of calculations needed if a password can contain characters of all types listed above?
- Which password can be guessed on the first try?
- Which password requires the most tries before it can be guessed?
 */
//guessPasswordOfThreeCharacters(containing: digits + lowercaseAlphas)
/*:
 Based on the password you choose to set in `checkPassword(_:)` and the order you supply the characters to guess, you can see that—even with just three characters—your playground can run for a very long time before finding a result.

 Because the algorithm contains a loop within a loop within a loop, you have to multiply the iterations of each loop to calculate the number of times the innermost statement executes. As a result, the algorithm is *exponential*. It operates as a function of the power of the number of possible characters. In the initial example, a password with just 10 possible characters of length 3, the number of possible passwords is 10³, or 1,000. If you lengthen the password by just one character, you need to add a new loop—and the possibilities increase to 10⁴, or 10,000.

 Exponential algorithms are said to run in *unreasonable time* because the time for them to run grows very quickly as the problem size increases. Try the challenge below to get a feel for what unreasonable time feels like to a user.

 - callout(Challenge): 
 Make of copy the `guessPasswordOfThreeCharacters(containing:)` function below and rename it to `guessPasswordOfFourCharacters(containing:)`. Modify it to guess passwords of four characters by adding another `for` loop.\
 \
 Modify the `passwordIsCorrect(_:)` function to contain a four-character password. Try using your new password-guessing function to see how it affects how long your playground runs before it finds a password. (Hint: you should comment out any existing calls to `guessPasswordOfThreeCharacters` on this page to avoid extraneous work.)
 */

/*:
  _Copyright © 2020 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 5 of 5
 */