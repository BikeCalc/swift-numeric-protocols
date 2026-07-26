// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

extension StringProtocol {
    /// A boolean value indicating whether this instance is a Roman symbol.
    public var isRomanSymbol: Bool {
        guard self.isEmpty == false else {
            return false
        }

        return RomanSymbol.allCases.contains(where: { (symbol) in
            symbol.rawValue == self
        })
    }

    /// A boolean value indicating whether this instance is a Roman numeral.
    public var isRomanNumeral: Bool {
        return RomanNumeralParser(String(self)).parse() != nil
    }
}
