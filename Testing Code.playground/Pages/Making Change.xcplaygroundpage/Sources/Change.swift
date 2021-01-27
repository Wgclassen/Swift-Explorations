/// Represents denominations of US currency, from ten dollars to one penny.
public enum Denomination: String, CustomStringConvertible {
    case ten, five, one, quarter, dime, nickel, penny
    
    /// The value of the denomination expressed in pennies.
    var valueInPennies: Int {
        switch self {
        case .ten: return 1000
        case .five: return 500
        case .one: return 100
        case .quarter: return 25
        case .dime: return 10
        case .nickel: return 5
        case .penny: return 1
        }
    }
    
    public var description: String {
        return self.rawValue
    }
}

/// Gives the amount of change due for a given purchase.
///
/// - Parameters:
///   - amountGiven: The amount of money given
///   - purchasePrice: The price of the item being purchased
/// - Returns: An array of currency denominations that should be given as change. An empty array is returned in case of error.
/// - Note: The amount given should not be less than the purchase price. The maximum purchase price is $500
/// (larger amounts have to be handled via card or check) and the minimum purchase price is $0.01.
public func change(for amountGiven: Double, purchasePrice: Double) -> [Denomination] {
    if purchasePrice > 500 || purchasePrice < 0.01 {
        print("Purchase price must be between $0.01 and $500.")
        return []
    }
    if amountGiven < purchasePrice {
        print("Insufficient amount (\(amountGiven)) to purchase item at price \(purchasePrice).")
        return []
    }
    
    let amountInPennies = Int(amountGiven * 100)
    let purchaseInPennies = Int(purchasePrice * 100)
    var changeAmount = amountInPennies - purchaseInPennies
    
    var denominations: [Denomination] = [.ten, .five, .one, .quarter, .dime, .nickel, .penny]
    
    var change = [Denomination]()
    var currentDenomination = denominations[0]
    
    while changeAmount > 0 {
        if currentDenomination.valueInPennies > changeAmount {
            denominations.remove(at: 0)
            currentDenomination = denominations[0]
            continue
        }
        
        changeAmount -= currentDenomination.valueInPennies
        change.append(currentDenomination)
    }
    
    return change
}
