/*:
 ## Piggy Bank
 
 You'll start with a simple type that represents a piggy bank. This bank only accepts pennies via a `deposit(pennies:)` method, and reports its balance via the `balance()` method. You can also `withdraw(pennies:)` from the account.
 
 - callout(Experiment): Test the instance of `PiggyBank` below by depositing and withdrawing money, and checking its balance. Note any errors you encounter. How many pennies can you store in the bank? Does it have a maximum or minimum?
 */

var bank = PiggyBank()

bank.deposit(pennies: 1)
bank.balance()
bank.withdraw(pennies: 1)
bank.balance()


//: [Previous](@previous)  |  page 2 of 7  |  [Next: Limits of Integers](@next)