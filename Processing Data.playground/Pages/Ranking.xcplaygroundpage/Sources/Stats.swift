extension Array where Element: Comparable, Element: SignedNumeric {
    func median() -> Element {
        return self.sorted(by: >)[self.count / 2]
    }
    
    func medianAbsoluteDeviation() -> Element {
        let m = median()
        
        return map{ abs($0 - m) }.sorted(by: >)[self.count / 2]
    }
}

public extension Tabulator {
    func median() -> Int {
        tabulatedValues.map{ $0.count }.median()
    }
    
    func medianAbsoluteDeviation() -> Int {
        return tabulatedValues.map{ $0.count }.medianAbsoluteDeviation()
    }
}
