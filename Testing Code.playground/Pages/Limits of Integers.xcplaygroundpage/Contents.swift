/*:
 ## Limits of Integers
 
 You may have noticed references to the `UInt8` type on the previous page, either in the autocompletion suggestions for methods or in the error messages.
 
 Below is the code for `PiggyBank`.
 */
/// Represents a piggy bank that holds only pennies.
class PiggyBank {
    private var pennies: UInt8 = 0
    
    init() {
        pennies = 0
    }
    
    /// Returns the balance of the bank.
    func balance() -> UInt8 {
        return pennies
    }
    
    /// Deposits pennies into the bank.
    /// - Parameter pennies: the number of pennies to deposit.
    func deposit(pennies: UInt8) {
        self.pennies += pennies
    }
    
    /// Withdraws pennies from the bank.
    /// - Parameter pennies: the number of pennies to withdraw.
    func withdraw(pennies: UInt8) {
        self.pennies -= pennies
    }
}
/*:
 So what's a `UInt8`?
 
 All numbers in Swift occupy a fixed number of bits. The standard `Int` type occupies either 32 or 64 bits, depending on the computer that's running it. The `UInt8` type occupies only 8 bits.
 
 The "U" in `UInt8` stands for "unsigned." An unsigned integer is always positive. Piggy banks hold real coins, so there's no need to allow for a negative balance.
 
 Since this piggy bank counts its pennies with `UInt8`, the number of pennies it can contain is limited by the capacity of an 8-bit number. Values of `UInt8` range from 0 to 255.
 
 - callout(Experiment): Uncomment the line below to see an example of an illegal `UInt8` value.
 */
var bank = PiggyBank()
//bank.deposit(pennies: 500)
/*:
 The console should print "`Integer literal '500' overflows when stored into 'UInt8'.`"
 
 Overflow is the result of trying to store a number that won't fit into the number of bits available. Some languages allow overflow and silently "wrap" the value around to zero again. In Swift, overflow will always cause an error, helping you to design your code carefully and to find problems during testing. It's far better to deal with a niggly error than to end up with a program that behaves strangely (and perhaps dangerously) but doesn't crash. Of course, in practice, you probably won't use types like `UInt8`, because you'll want to work with numbers larger than 255. Since the limit of a 64-bit integer is more than 9 quintillion, it's highly unlikely you'll encounter overflow in your programs—unless you want to count the stars in the universe!
 
 Comment the line above back out again so that you can execute more code below.
 
 - callout(Experiment): Uncomment the lines below to see another example of overflow.
 */
//bank.deposit(pennies: 100)
//bank.deposit(pennies: 100)
//bank.deposit(pennies: 100)
/*:
 This time, error in the console is harder to decipher. By first checking that the integer literal was a legal `UInt8` value, Swift could detect the error on line 45 before executing your code. But overflow can also occur when you reach the bank's limitations as your program executes. In that case, you'll see an "`EXC_BAD_INSTRUCTION`" error in the console. If you were debugging an app, the exact line of code that caused the overflow would be highlighted, so you'd quickly discover the issue.
 
 Comment the lines above back out again so that you can execute more code below.
 
 - callout(Experiment): Uncomment the lines below to see a final example of overflow.
 */
//bank.deposit(pennies: 50)
//bank.withdraw(pennies: 100)
/*:
 This time the overflow happened in the reverse direction—trying to assign a negative number to a `UInt8`.
 
 On the next page, you'll document and test this code.

[Previous](@previous)  |  page 3 of 7  |  [Next: Documentation and Testing](@next)
 */