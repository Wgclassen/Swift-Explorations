/*:
 ## Limitations of Floats

 Like `Int` and `UInt8`, Swift floating point types are represented in a fixed amount of space—a `Double` occupies 64 bits. As a result, some floating point numbers can't be represented exactly; they can only be approximated.

 Below is the implementation of the `change(for:purchasePrice:)` function. You can see that both its parameters are `Double`s, enabling the function to handle prices as they're typically expressed: in dollars and cents with a decimal point. It's not important to study this code in detail—you'll be using it in some exercises.
 */
func change(for amountGiven: Double, purchasePrice: Double) -> [Denomination] {
    // Handle illegal values.
    if purchasePrice > 500 || purchasePrice < 0.01 {
        print("Purchase price must be between $0.01 and $500.")
        return []
    }
    if amountGiven < purchasePrice {
        print("Insufficient amount (\(amountGiven)) to purchase item at price \(purchasePrice).")
        return []
    }

    // Convert amounts to pennies.
    let amountInPennies = Int(amountGiven * 100)
    let purchaseInPennies = Int(purchasePrice * 100)
    
    // Calculate change in pennies.
    var changeInPennies = amountInPennies - purchaseInPennies
    
    // Set up an array of all available denominations.
    var denominations: [Denomination] = [.ten, .five, .one, .quarter, .dime, .nickel, .penny]
    
    // Initialize the change to an empty array and the current denomination to the largest.
    var change = [Denomination]()
    var currentDenomination = denominations[0]
    
    // Add denominations to the change.
    while changeInPennies > 0 {
        // If the current denomination is too large, choose the next-smallest one and
        // skip to the next iteration of the loop.
        if currentDenomination.valueInPennies > changeInPennies {
            denominations.remove(at: 0)
            currentDenomination = denominations[0]
            continue
        }
        
        // Add one of this denomination to the change and subtract that amount
        // from the change due.
        changeInPennies -= currentDenomination.valueInPennies
        change.append(currentDenomination)
    }
    
    return change
}

// This example doesn't work.
change(for: 10, purchasePrice: 8.95) // Should be [.one, .nickel]
/*:
 Lines 20 and 21 of `change(for:purchasePrice:)`, replicated below, convert the two argument values to whole numbers of pennies, represented by integers. (The `Int` initializer truncates the input floating point number by removing all digits past the decimal.)

`let amountInPennies = Int(amountGiven * 100)`\
`let purchaseInPennies = Int(purchasePrice * 100)`

 The rest of the function uses these values to calculate change. The function itself has no logical errors—it should work for all valid inputs. The problem is that `Double`s don't always work the way you expect them to. If you scroll up to those lines in the function, you might spot the error in the results sidebar. Take a look in the results sidebar for the line below to see it more clearly.
 */
8.95
//: Some strange behavior is going on. Due to the limitations of the `Double` type, the `Double` literal 8.95 isn't actually that value when it's represented in the computer. So when you multiply it by 100, the result isn't 895.0, but 894.999.... `Double`s have other limitations as well, such as those that only crop up in addition operations. (These can even fool you by appearing correct in the results sidebar.)
let a = 0.05
let b = 0.01
a + b
a + b == 0.06
print(a)
print(b)
print(a+b)
/*:
 Certain values of `Double` just can't be represented accurately. This limitation can have an impact on everyday code, depending on how it uses numbers.
 
 In the case above, a quick solution is to multiply the value by 100, then round to the nearest cent—*before* converting it to an `Int`.
 */
let price = 8.95
let priceInPennies = price * 100
let roundedPriceInPennies = priceInPennies.rounded() // Produces a new Double
let integerPriceInPennies = Int(roundedPriceInPennies) // Produces an Int

//: [Previous](@previous)  |  page 6 of 7  |  [Next: Summary](@next)