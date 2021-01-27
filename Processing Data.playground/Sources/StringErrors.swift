import Foundation

extension Character {
    static let keyboardLayout = [
    "qwertyuiop",
    "asdfghjkl;",
    "zxcvbnm,."
    ]
    
    var uppercased: Character {
        return Character(String(self.uppercased().prefix(1)))
    }
    
    var lowercased: Character {
        return Character(String(self.lowercased().prefix(1)))
    }
    
    var keyboardNeighbors: [Character] {
        let upper = self.isUppercase
        
        let char = self.lowercased
        
        guard let rowIndex = Character.keyboardLayout.firstIndex(where: { $0.contains(char) }) else {
            return [self]
        }
        
        let thisRow = Character.keyboardLayout[rowIndex]
        let columnIndex = thisRow.firstIndex(of: char)!
        let columnIndexInt = thisRow.distance(from: thisRow.startIndex, to: columnIndex)
        
        var neighbors = [Character]()
        for r in max(0, rowIndex - 1)...min(2, rowIndex + 1) {
            let row = Character.keyboardLayout[r]
            for c in max(0, columnIndexInt - 1)...min(row.count - 1, columnIndexInt + 1) {
                guard c < row.count else { continue }
                let index = row.index(thisRow.startIndex, offsetBy: c)
                guard row[index] != char else { continue }
                neighbors.append(upper ? row[index].uppercased : row[index])
            }
        }
        
        return neighbors
    }
}

extension String {
    func twiddledCase(at position: Int) -> String {
        guard let charIndex = self.index(self.startIndex, offsetBy: position, limitedBy: self.endIndex) else {
            return self
        }
        
        let head = self.prefix(position)
        let char = self[charIndex].isUppercase ? self[charIndex].lowercased() : self[charIndex].uppercased()
        let tail = self.suffix(from: self.index(self.startIndex, offsetBy: position + 1))

        return head + char + tail
    }
    
    func withCapError() -> String {
        let comps = self.components(separatedBy: .whitespaces)
        let wordIndex = Int.random(in: 0...comps.count - 1)
        
        let head = comps.prefix(wordIndex)
        let error = [comps[wordIndex].twiddledCase(at: Int.random(in: 0...1))]
        let tail = comps.suffix(from: wordIndex + 1)
        
        return (head + error + tail).joined(separator: " ")
    }
    
    func withCharacterErrors(count: Int) -> String {
        var errorIndices = Set<Int>()
        while errorIndices.count < count {
            errorIndices.insert(Int.random(in: 0...self.count - 1))
        }
                
        var result = ""
        for index in self.indices {
            if errorIndices.contains(self.distance(from:self.startIndex, to: index)) {
                result += String(self[index].keyboardNeighbors.randomElement()!)
            } else {
                result += String(self[index])
            }
        }
        
        return result
    }

//    func withExtraSpace() -> String {
//        return ""
//    }
}

extension Array where Element == Int {
    func asWeightedIndexes() -> Array {
        var result = [Int]()
        for index in 0 ..< self.count {
            result += Array(repeating: index, count: self[index])
        }
        return result
    }
}

extension Array where Element == String {
    public func randomElements(count: Int, weights: [Int], capErrorRate: Int, letterErrorRate: Int) -> [String] {
        var data = [String]()

        var paddedWeights = weights
        while paddedWeights.count < self.count {
            paddedWeights += weights
        }
        paddedWeights = Array<Int>(paddedWeights.prefix(self.count))
        
        let weightedIndexArray = paddedWeights.asWeightedIndexes()
        
        for _ in 1...count {
            data.append(self[weightedIndexArray.randomElement()!])
        }

        if capErrorRate > 0 {
            data = data.map {
                if Int.random(in:1...capErrorRate) % capErrorRate == 0 {
                    return $0.withCapError()
                } else {
                    return $0
                }
            }
        }

        if letterErrorRate > 0 {
            data = data.map {
                if Int.random(in:1...letterErrorRate) % letterErrorRate == 0 {
                    return $0.withCharacterErrors(count: [2, 1, 1, 1].randomElement()!)
                } else {
                    return $0
                }
            }
        }

        return data
    }
}
