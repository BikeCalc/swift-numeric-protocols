//
// StringProtocol.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension StringProtocol {
    /// A boolean value indicating whether this instance is a roman symbol.
    internal var isRomanSymbol: Bool {
        guard self.isEmpty == false else {
            return false
        }
        
        let symbols: Array<RomanSymbol> = RomanSymbol.allCases
        
        return symbols.contains(where: { (symbol) in
            symbol.description == self
        })
    }
        
    /// A boolean value indicating whether this instance is a roman numeral.
    internal var isRomanNumeral: Bool {
        guard self.isEmpty == false else {
            return false
        }
        
        guard self.contains(where: { String($0) == RomanSymbol.N.description }) == false else {
            return self.count == 1
        }
        
        var symbols: [RomanSymbol] = []
        
        // Check symbols
        
        for character in self {
            let rawValue: String = .init(character)
            
            if let last = symbols.last?.rawValue, let symbol: RomanSymbol = .init(rawValue: rawValue + last) {
                symbols.removeLast()
                symbols.append(symbol)
            } else if let symbol: RomanSymbol = .init(rawValue: rawValue) {
                symbols.append(symbol)
            } else {
                return false
            }
        }
        
        // Check order
        
        for (index, (lhs, rhs)) in zip(symbols.dropLast(), symbols.dropFirst()).enumerated() {
            if lhs < rhs {
                do {
                    try symbols[index] = lhs.concatenate(with: rhs)
                    symbols.remove(at: index)
                } catch {
                    return false
                }
            }
        }
                              
        // Check recursions
                              
        for (index, (lhs, rhs)) in zip(symbols.dropLast(), symbols.dropFirst()).enumerated() {
            if lhs == rhs, rhs.isRepeatable == false {
                return false
            }
            
            guard symbols.indices.contains(index - 2) else {
                continue
            }
            
            let recursion = symbols[index - 2...index + 1]
            let repeatedSymbol = recursion[recursion.startIndex]
            
            if recursion.dropFirst().allSatisfy({ $0 == repeatedSymbol }) {
                return false
            }
        }
                             
        return true
    }
}
