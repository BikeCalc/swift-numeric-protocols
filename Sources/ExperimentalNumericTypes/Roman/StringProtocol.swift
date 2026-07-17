//
// StringProtocol.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension StringProtocol {
    /// A boolean value indicating whether this instance is a roman symbol.
    public var isRomanSymbol: Bool {
        guard self.isEmpty == false else {
            return false
        }
        
        return RomanSymbol.allCases.contains(where: { (symbol) in
            symbol.rawValue == self
        })
    }
     
    /// A boolean value indicating whether this instance is a roman numeral.
    public var isRomanNumeral: Bool {
        return RomanNumeralParser(String(self)).parse() != nil
    }
}
