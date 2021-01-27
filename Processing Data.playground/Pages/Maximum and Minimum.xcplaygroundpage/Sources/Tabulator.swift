public struct TabulatedValue: CustomStringConvertible {
    public let value: String
    public let count: Int
    
    public var description: String {
        return "\"\(value)\": \(count)"
    }
}

extension TabulatedValue: Comparable {
    public static func <(_ left: Self, _ right: Self) -> Bool {
        return left.count < right.count
    }
}


/// Keeps a running tally of show names.
public struct Tabulator {
    private var lookup = [String:Int]()
    
    public init() {
        lookup = [String:Int]()
    }
    
    /// A sorted array of the shows that have been tabulated.
    public var values: [String] {
        return lookup.keys.sorted()
    }
    
    public var tabulatedValues: [TabulatedValue] {
        return lookup.map{ return TabulatedValue(value: $0, count: $1) }
    }
    
    /// Increments the count for the given show. If the show hasn't been seen before,
    /// it's added to the `shows` array and the count is set to 1.
    /// - Parameter show: The show to tally.
    public mutating func incrementCount(forValue value: String) {
        lookup[value, default: 0] += 1
    }
    
    /// Returns the count for the given show.
    /// - Parameter show: The name of the show to get a tally for.
    public func count(forValue value: String) -> Int {
        return lookup[value, default: 0]
    }
}

