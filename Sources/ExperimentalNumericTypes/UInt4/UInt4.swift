//
// UInt4.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols
import StandardNumericProtocols
import StandardNumericTypes

/// A 4-bit unsigned integer value type.
public struct UInt4 {
    /// The underlying value.
    internal typealias Value = UInt8

    /// The underlying value.
    internal let value: Self.Value

    /// Creates a new instance with the specified value.
    ///
    /// - parameter value: The value of this instance.
    /// - Warning: The value must be between zero and fifteen, inclusive.
    internal init(value: Self.Value) {
        precondition(0...15 ~= value)
        self.value = value
    }

    /// The modulus used by this 4-bit unsigned integer type.
    private static let modulus: UInt16 = 16
}

extension UInt4 {
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

extension UInt4: Addable {
    /// Returns the sum of adding the two specified values.
    ///
    /// ```swift
    /// let one: UInt4 = 1
    /// print(one + one)
    /// // Prints "2"
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

extension UInt4: AdditiveArithmetic {}

// MARK: - Comparable

extension UInt4: Comparable {
    public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
}

// MARK: - CustomStringConvertible

extension UInt4: CustomStringConvertible {
    public var description: String {
        return self.value.description
    }
}

// MARK: - Decodable

extension UInt4: Decodable {
    public init(from decoder: Decoder) throws {
        let container: SingleValueDecodingContainer = try decoder.singleValueContainer()
        let value: Self.Value = try container.decode(Self.Value.self)

        guard Self.min.value...Self.max.value ~= value else {
            let debugDescription: String = "UInt4 value must be between \(Self.min) and \(Self.max)."
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: debugDescription
            )
        }

        self.init(value: value)
    }
}

// MARK: - Divisible

extension UInt4: Divisible {
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
    /// let six: UInt4 = 6
    /// let two: UInt4 = 2
    /// print(six / two)
    /// // Prints "3"
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

extension UInt4: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}

// MARK: - Equatable

extension UInt4: Equatable {
    public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt4: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        precondition(0...15 ~= value)

        let newValue: Self.Value = .init(value)

        self.init(value: newValue)
    }
}

// MARK: - Hashable

extension UInt4: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value.hashValue)
    }
}

// MARK: - LosslessStringConvertible

extension UInt4: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let value: Self.Value = .init(description),
              Self.min.value...Self.max.value ~= value else {
            return nil
        }

        self.init(value: value)
    }
}

// MARK: - Multipliable

extension UInt4: Multipliable {
    public func isMultiple(of other: Self) -> Bool {
        if self == 0 && other == 0 {
            return true
        }

        guard other != 0 else {
            return false
        }

        return (self % other) == 0
    }

    /// Returns the product of multiplying the two specified values.
    ///
    /// ```swift
    /// let two: UInt4 = 2
    /// print(two * two)
    /// // Prints "4"
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

extension UInt4: Numeric {
    public typealias Magnitude = Self

    public init?<Source>(exactly source: Source)
    where Source: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
              Self.min.value...Self.max.value ~= value else {
            return nil
        }

        self.init(value: value)
    }

    public var magnitude: Self {
        return self
    }
}

// MARK: - Raisable

extension UInt4: Raisable {
    public typealias Exponent = Self

    public static func ** (_ lhs: Self, _ rhs: Self.Exponent) -> Self {
        switch rhs {
        case 0:
            return 1
        case 1:
            return lhs
        default:
            var result: Self = lhs
            var exponent: Self.Exponent = 2

            while exponent <= rhs {
                result *= lhs
                exponent += 1
            }

            return result
        }
    }
}

// MARK: - ReportableAsOverflow

extension UInt4: ReportableAsOverflow {
    public func addingReportingOverflow(_ rhs: Self) -> Self.Report {
        let sum: UInt16 = .init(self.value) + .init(rhs.value)
        let partialValue: Self.Value = .init(sum % Self.modulus)

        guard sum <= Self.max.value else {
            return (.init(value: partialValue), true)
        }

        return (.init(value: partialValue), false)
    }

    public func subtractingReportingOverflow(_ rhs: Self) -> Self.Report {
        let difference: Int16 = .init(self.value) - .init(rhs.value)
        let modulus: Int16 = .init(Self.modulus)

        guard difference >= 0 else {
            let partialValue: Self.Value = .init((difference % modulus + modulus) % modulus)
            return (.init(value: partialValue), true)
        }

        return (.init(value: .init(difference)), false)
    }

    public func multipliedReportingOverflow(by rhs: Self) -> Self.Report {
        let product: UInt16 = .init(self.value) * .init(rhs.value)
        let partialValue: Self.Value = .init(product % Self.modulus)

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

extension UInt4: RepresentableByMax {
    public static var max: Self {
        return .init(value: 15)
    }
}

// MARK: - RepresentableByMin

extension UInt4: RepresentableByMin {
    public static var min: Self {
        return .init(value: 0)
    }
}

// MARK: - RepresentableByZero

extension UInt4: RepresentableByZero {
    public static var zero: Self {
        return .init(value: 0)
    }
}

// MARK: - Sendable

extension UInt4: Sendable {}

// MARK: - Strideable

extension UInt4: Strideable {
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

extension UInt4: Subtractable {
    /// Returns the difference of subtracting the second specified value from the first.
    ///
    /// ```swift
    /// let two: UInt4 = 2
    /// let one: UInt4 = 1
    /// print(two - one)
    /// // Prints "1"
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
