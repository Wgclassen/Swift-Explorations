/// Represents a piggy bank that holds only pennies.
public class PiggyBank {
    private var pennies: UInt8 = 0
    
    public init() {
        pennies = 0
    }
    
    /// Returns the balance of the bank.
    public func balance() -> UInt8 {
        return pennies
    }
    
    /// Deposits pennies UInt8o the bank.
    /// - Parameter pennies: the number of pennies to deposit.
    public func deposit(pennies: UInt8) {
        self.pennies += pennies
    }
    
    /// Withdraws pennies from the bank.
    /// - Parameter pennies: the number of pennies to withdraw.
    public func withdraw(pennies: UInt8) {
        self.pennies -= pennies
    }
}
