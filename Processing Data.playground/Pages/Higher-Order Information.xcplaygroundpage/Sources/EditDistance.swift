import Foundation

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

public func editDistance(from a: String, to b: String) -> Int {
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
