//
// Roman.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols
import StandardNumericProtocols
import StandardNumericTypes

/// A representation of a roman numeral.
public struct Roman {
    /// The underlying value.
    internal typealias Value = UInt16

    /// The underlying value.
    internal let value: Self.Value

    /// Creates a new instance with the specified value.
    ///
    /// - parameter value: The value of this instance.
    /// - Warning: The value must be in between 0 and 3999.
    private init(value: Self.Value) {
        precondition(0...3999 ~= value, "Roman value must be between \(Self.min) and \(Self.max).")
        self.value = value
    }
}

extension Roman {
    /// A boolean value indicating whether this value is even.
    ///
    /// ```swift
    /// print(0.isEven)
    /// // Prints "true"
    /// ```
    public var isEven: Bool {
        let remainder: Self = self % 2
        return remainder == 0
    }

    /// A boolean value indicating whether this value is odd.
    ///
    /// ```swift
    /// print(0.isOdd)
    /// // Prints "false"
    /// ```
    public var isOdd: Bool {
        let remainder: Self = self % 2
        return remainder != 0
    }
}


// MARK: - Addable

extension Roman: Addable {
    /// Returns the sum of adding the two specified value.
    ///
    /// ```swift
    /// let one: Roman = 1
    /// print(one + one)
    /// // Prints "II"
    /// ```
    ///
    /// - parameter lhs: The augend.
    /// - parameter rhs: The addend.
    /// - returns: The sum.
    public static func + (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value + rhs.value
        return .init(value: newValue)
    }
}

// MARK: - AdditiveArithmetic

extension Roman: AdditiveArithmetic {}

// MARK: - Comparable

extension Roman: Comparable {
    public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
}

// MARK: - CustomStringConvertible

extension Roman: CustomStringConvertible {
    public var description: String {
        guard self.value != 0 else {
            return RomanSymbol.N.description
        }

        let symbols: Array<RomanSymbol> = RomanSymbol.allCases.reversed()

        var number: Self.Value = self.value
        var result: String = ""

        while number > 0 {
            for symbol in symbols {
                let report: Self.Value.Report = number.subtractingReportingOverflow(symbol.value)

                if report.overflow == false && report.partialValue >= 0 {
                    number -= symbol.value
                    result += symbol.description
                    break
                }
            }
        }

        return result
    }
}

// MARK: - Decodable

extension Roman: Decodable {
    public init(from decoder: Decoder) throws {
        let container: SingleValueDecodingContainer = try decoder.singleValueContainer()

        if let description: String = try? container.decode(String.self),
           let value: Self = .init(description) {
            self = value
        } else if let value: Self.Value = try? container.decode(Self.Value.self),
           Self.min.value...Self.max.value ~= value {
            self.init(value: value)
        } else {
            let debugDescription: String = "Roman numeral value must be a valid Roman numeral string or an integer between \(Self.min) and \(Self.max)."
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: debugDescription
            )
        }
    }
}

// MARK: - Divisible

extension Roman: Divisible {
    public var reciprocal: Self? {
        guard self.isInvertible else {
            return nil
        }

        return self
    }

    public var isInvertible: Bool {
        return self == 1
    }

    /// Returns the quotient of dividing the first specified value by the second.
    ///
    /// ```swift
    /// let six: Roman = 6
    /// let two: Roman = 2
    /// print(six / two)
    /// // Prints "III"
    /// ```
    ///
    /// - parameter lhs: The dividend.
    /// - parameter rhs: The divisor.
    /// - returns: The quotient.
    public static func / (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value / rhs.value
        return .init(value: newValue)
    }

    /// Returns the remainder of dividing the first specified value by the second.
    ///
    /// - parameter lhs: The dividend.
    /// - parameter rhs: The divisor.
    /// - returns: The remainder.
    public static func % (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value % rhs.value
        return .init(value: newValue)
    }
}

// MARK: - Encodable

extension Roman: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.description.encode(to: encoder)
    }
}

// MARK: - Equatable

extension Roman: Equatable {
    public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Roman: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        precondition(0...3999 ~= value, "Roman integer literal must be between \(Self.min) and \(Self.max).")

        let newValue: Self.Value = .init(value)

        self.init(value: newValue)
    }
}

// MARK: - Hashable

extension Roman: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value.hashValue)
    }
}

// MARK: - LosslessStringConvertible

extension Roman: LosslessStringConvertible {
    public init?(_ description: String) {
        guard description.isEmpty == false else {
            return nil
        }

        if let value: Self.Value = .init(description) {
            guard value <= Self.max.value else {
                return nil
            }

            self.init(value: value)
        } else if let result = RomanNumeralParser(description).parse() {
            self.init(value: result.value)
        } else {
            return nil
        }
    }
}

// MARK: - Multipliable

extension Roman: Multipliable {
    public func isMultiple(of other: Roman) -> Bool {
        if self == 0 && other == 0 {
            return true
        }

        guard other != 0 else {
            return false
        }

        return (self % other) == 0
    }

    /// Returns the product of multiplying the two specified value.
    ///
    /// ```swift
    /// let two: Roman = 2
    /// print(two * two)
    /// // Prints "IV"
    /// ```
    ///
    /// - parameter lhs: The multiplicand.
    /// - parameter rhs: The multiplicator.
    /// - returns: The product.
    public static func * (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value * rhs.value
        return .init(value: newValue)
    }
}

// MARK: - Numeric

extension Roman: Numeric {
    public typealias Magnitude = Self

    public init?<Source>(exactly source: Source)
    where Source: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
              Self.min.value...Self.max.value ~= value else {
            return nil
        }

        self.init(value: value)
    }

    public var magnitude: Roman {
        return self
    }
}

// MARK: - Raisable

extension Roman: Raisable {
    public typealias Exponent = Self

    public static func ** (_ lhs: Self, _ rhs: Self.Exponent) -> Self {
        switch rhs {
        case 0:
            return 1
        case 1:
            return lhs
        default:
            var result: Self = lhs
            var exponent: Self = 2

            while exponent <= rhs {
                result *= lhs
                exponent += 1
            }

            return result
        }
    }
}

// MARK: - ReportableAsOverflow

extension Roman: ReportableAsOverflow {
    public func addingReportingOverflow(_ rhs: Self) -> Self.Report {
        let sum: UInt32 = .init(self.value) + .init(rhs.value)
        let modulus: UInt32 = .init(Self.max.value) + 1
        let partialValue: Self.Value = .init(sum % modulus)

        guard sum <= Self.max.value else {
            return (.init(value: partialValue), true)
        }

        return (.init(value: partialValue), false)
    }

    public func subtractingReportingOverflow(_ rhs: Self) -> Self.Report {
        let difference: Int32 = .init(self.value) - .init(rhs.value)
        let modulus: Int32 = .init(Self.max.value) + 1

        guard difference >= 0 else {
            let partialValue: Self.Value = .init((difference % modulus + modulus) % modulus)
            return (.init(value: partialValue), true)
        }

        return (.init(value: .init(difference)), false)
    }

    public func multipliedReportingOverflow(by rhs: Self) -> Self.Report {
        let product: UInt32 = .init(self.value) * .init(rhs.value)
        let modulus: UInt32 = .init(Self.max.value) + 1
        let partialValue: Self.Value = .init(product % modulus)

        guard product <= Self.max.value else {
            return (.init(value: partialValue), true)
        }

        return (.init(value: partialValue), false)
    }

    public func dividedReportingOverflow(by rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (self, true)
        }

        let quotient: Self.Value = self.value / rhs.value

        return (.init(value: quotient), false)
    }

    public func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (self, true)
        }

        let remainder: Self.Value = self.value % rhs.value

        return (.init(value: remainder), false)
    }

    public func raisedReportingOverflow(to rhs: Self.Exponent) -> Self.Report {
        switch rhs {
        case ..<2:
            let result: Self = self ** rhs
            return (result, false)

        default:
            var result: Self = self
            var exponent: Self.Exponent = 2

            while exponent <= rhs {
                let report: Self.Report = result.multipliedReportingOverflow(by: self)

                guard report.overflow == false else {
                    return report
                }

                result = report.partialValue
                exponent += 1
            }

            return (result, false)
        }
    }
}

// MARK: - RepresentableByMax

extension Roman: RepresentableByMax {
    public static var max: Self {
        return 3999
    }
}

// MARK: - RepresentableByMin

extension Roman: RepresentableByMin {
    public static var min: Self {
        return 0
    }
}

// MARK: - RepresentableByZero

extension Roman: RepresentableByZero {
    public static var zero: Self {
        .init(value: 0)
    }
}

// MARK: - Sendable

extension Roman: Sendable {}

// MARK: - Strideable

extension Roman: Strideable {
    public typealias Stride = Int

    public func advanced(by amount: Self.Stride) -> Self {
        let newValue: Self.Stride = .init(self.value) + amount
        return .init(integerLiteral: newValue)
    }

    public func distance(to other: Self) -> Self.Stride {
        return .init(other.value) - .init(self.value)
    }
}

// MARK: - Subtractable

extension Roman: Subtractable {
    /// Returns the difference of subtracting the second specified value from the first.
    ///
    /// ```swift
    /// let two: Roman = 2
    /// let one: Roman = 1
    /// print(two - one)
    /// // Prints "I"
    /// ```
    ///
    /// - parameter lhs: The minuend.
    /// - parameter rhs: The subtrahend.
    /// - returns: The difference.
    public static func - (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value - rhs.value
        return .init(value: newValue)
    }
}
