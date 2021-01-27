/*:
## Third-Party Code
  
  Calculating the degree of difference between strings is a well-known challenge in computer science. One of the great things about computer science is that many common problems have already been solved elegantly and efficiently.
  
  The function below determines the *edit distance* between two strings—the degree of difference between them. It's based on a well-known algorithm named Wagner-Fischer. Lots of programmers share their code with the world, and a Swift implementation of this algorithm exists [right here](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Minimum%20Edit%20Distance).
 
 Programmers often use existing algorithms as building blocks when they create their own algorithms. And it's common to use code that was authored by somebody else. But when you do, make sure to follow these important steps:
 
 1. Verify that the code has a license that allows you to use it.
 2. If the license requires you to cite the source, make sure to comply.
 
 Notice that the Swift code for edit distance below is properly cited—the license from its [license page](https://github.com/raywenderlich/swift-algorithm-club/blob/master/LICENSE.txt) is included, as required by the license terms. A citation should include the origin or the author's name.
 
 It's unlikely you'll understand the code below, but you don't need to in order to complete this exercise. It's not bad practice to use code you don't completely understand—as long as you know it's been well tested and comes from a reputable source.
 */
/*
 Copyright (c) 2016 Matthijs Hollemans and contributors

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

func editDistance(from a: String, to b: String) -> Int {
    let m = a.count
    let n = b.count
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    
    // initialize matrix
    for index in 1...m {
        // the distance of any first string to an empty second string
        matrix[index][0] = index
    }

    for index in 1...n {
        // the distance of any second string to an empty first string
        matrix[0][index] = index
    }
    
    // compute Levenshtein distance
    for (i, selfChar) in a.enumerated() {
        for (j, otherChar) in b.enumerated() {
            if otherChar == selfChar {
                // substitution of equal symbols with cost 0
                matrix[i + 1][j + 1] = matrix[i][j]
            } else {
                // minimum of the cost of insertion, deletion, or substitution
                // added to the already computed costs in the corresponding cells
                matrix[i + 1][j + 1] = min(matrix[i][j] + 1, matrix[i + 1][j] + 1, matrix[i][j + 1] + 1)
            }
        }
    }
    
    return matrix[m][n]
}
//:  - callout(Exercise): Try the `editDistance()` function with some strings below to see it in action.
editDistance(from: "cat", to: "cake")

/*:
[Previous](@previous)  |  page 6 of 11  |  [Next: Spelling Errors](@next)
 */