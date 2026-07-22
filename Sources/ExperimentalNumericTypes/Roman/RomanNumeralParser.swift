//
// RomanNumeralParser.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

internal struct RomanNumeralParser {
    private let string: String

    internal init(_ string: String) {
        self.string = string
    }

    internal func parse() -> (symbols: Array<RomanSymbol>, value: Roman.Value)? {
        guard let symbols: Array<RomanSymbol> = self.parseSymbols() else {
            return nil
        }

        var value: Roman.Value = 0

        for symbol in symbols {
            guard value <= Roman.max.value - symbol.value else {
                return nil
            }

            value += symbol.value
        }

        return (symbols, value)
    }

    private func parseSymbols() -> Array<RomanSymbol>? {
        guard self.string.isEmpty == false else {
            return nil
        }

        guard self.string.contains(where: { String($0) == RomanSymbol.N.description }) == false else {
            return self.string == RomanSymbol.N.description ? [.N] : nil
        }

        guard let symbols: Array<RomanSymbol> = self.tokenizeSymbols() else {
            return nil
        }

        guard self.hasValidOrder(symbols) else {
            return nil
        }

        guard self.hasValidRecurrences(symbols) else {
            return nil
        }

        guard self.hasValidSubtractivePrefixes(symbols) else {
            return nil
        }

        guard self.hasValidSubtractiveSuffixes(symbols) else {
            return nil
        }

        return symbols
    }

    private func tokenizeSymbols() -> Array<RomanSymbol>? {
        var symbols: Array<RomanSymbol> = []

        for character in self.string {
            let rawValue: String = .init(character)

            guard let symbol: RomanSymbol = .init(rawValue: rawValue) else {
                return nil
            }

            if let previousSymbol = symbols.last,
               previousSymbol.isSubtractable(from: symbol) {
                do {
                    let concatenatedSymbol: RomanSymbol = try previousSymbol.concatenate(with: symbol)
                    symbols.removeLast()
                    symbols.append(concatenatedSymbol)
                } catch {
                    return nil
                }
            } else {
                symbols.append(symbol)
            }
        }

        return symbols
    }

    private func hasValidOrder(_ symbols: Array<RomanSymbol>) -> Bool {
        for (lhs, rhs) in zip(symbols.dropLast(), symbols.dropFirst()) {
            if lhs < rhs {
                return false
            }
        }

        return true
    }

    private func hasValidRecurrences(_ symbols: Array<RomanSymbol>) -> Bool {
        for (lhs, rhs) in zip(symbols.dropLast(), symbols.dropFirst()) {
            if lhs == rhs, rhs.isRepeatable == false {
                return false
            }
        }

        for index in symbols.indices.dropFirst(3) {
            let sequence: ArraySlice<RomanSymbol> = symbols[index - 3...index]
            let repeatedSymbol: RomanSymbol = sequence[sequence.startIndex]

            if sequence.dropFirst().allSatisfy({ $0 == repeatedSymbol }) {
                return false
            }
        }

        return true
    }

    private func hasValidSubtractivePrefixes(_ symbols: Array<RomanSymbol>) -> Bool {
        for (lhs, rhs) in zip(symbols.dropLast(), symbols.dropFirst()) {
            guard let separatedSymbols: Array<RomanSymbol> = try? rhs.separate(),
                  let subtractingSymbol: RomanSymbol = separatedSymbols.first else {
                continue
            }

            if lhs == subtractingSymbol {
                return false
            }
        }

        return true
    }

    private func hasValidSubtractiveSuffixes(_ symbols: Array<RomanSymbol>) -> Bool {
        for (lhs, rhs) in zip(symbols.dropLast(), symbols.dropFirst()) {
            guard let separatedSymbols: Array<RomanSymbol> = try? lhs.separate(),
                  let subtractingSymbol: RomanSymbol = separatedSymbols.first else {
                continue
            }

            if rhs == subtractingSymbol {
                return false
            }
        }

        return true
    }
}
