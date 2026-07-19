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
        precondition(0...15 ~= value, "UInt4 value must be between \(Self.min) and \(Self.max).")
        self.value = value
    }

    /// The modulus used by this 4-bit unsigned integer type.
    private static let modulus: UInt16 = 16
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

// MARK: - BinaryInteger

extension UInt4: BinaryInteger {
    /// A collection containing the machine words of a `UInt4` value.
    public struct Words: RandomAccessCollection, Sendable {
        public typealias Element = UInt
        public typealias Index = Int

        private let value: UInt

        internal init(_ value: UInt) {
            self.value = value
        }

        public var startIndex: Int {
            return 0
        }

        public var endIndex: Int {
            return 1
        }

        public subscript(position: Int) -> UInt {
            precondition(position == self.startIndex, "UInt4 words index must be zero.")

            return self.value
        }

        public func index(after index: Int) -> Int {
            precondition(index == self.startIndex, "UInt4 words index must be the start index.")

            return index + 1
        }

        public func index(before index: Int) -> Int {
            precondition(index == self.endIndex, "UInt4 words index must be the end index.")

            return index - 1
        }

        public func index(_ index: Int, offsetBy distance: Int) -> Int {
            let newIndex: Int = index + distance
            precondition(self.startIndex...self.endIndex ~= newIndex, "UInt4 words index must be within bounds.")

            return newIndex
        }

        public func distance(from start: Int, to end: Int) -> Int {
            return end - start
        }
    }
    
    public var words: Self.Words {
        return .init(.init(self.value))
    }

    public var trailingZeroBitCount: Int {
        guard self != 0 else {
            return Self.bitWidth
        }

        return self.value.trailingZeroBitCount
    }

    public init<T>(_ source: T)
    where T: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
              Self.min.value...Self.max.value ~= value else {
            preconditionFailure("UInt4 value must be between \(Self.min) and \(Self.max).")
        }

        self.init(value: value)
    }

    public static func &= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(value: lhs.value & rhs.value)
    }

    public static func |= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(value: lhs.value | rhs.value)
    }

    public static func ^= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(value: lhs.value ^ rhs.value)
    }
}

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
        precondition(0...15 ~= value, "UInt4 integer literal must be between \(Self.min) and \(Self.max).")

        let newValue: Self.Value = .init(value)

        self.init(value: newValue)
    }
}

// MARK: - FixedWidthInteger

extension UInt4: FixedWidthInteger {
    public static var bitWidth: Int {
        return 4
    }

    public static var isSigned: Bool {
        return false
    }

    public var nonzeroBitCount: Int {
        return (self.value & 0b1111).nonzeroBitCount
    }

    public var leadingZeroBitCount: Int {
        guard self != 0 else {
            return Self.bitWidth
        }

        return Self.bitWidth - self.value.bitWidth + self.value.leadingZeroBitCount
    }

    public var byteSwapped: Self {
        return self
    }

    public init<T>(truncatingIfNeeded source: T)
    where T: BinaryInteger {
        let value: Self.Value = .init(truncatingIfNeeded: source) & 0b1111

        self.init(value: value)
    }

    public init(_truncatingBits bits: UInt) {
        self.init(truncatingIfNeeded: bits)
    }

    public init<T>(clamping source: T)
    where T: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source) else {
            self = source < 0 ? Self.min : Self.max
            return
        }

        if value < Self.min.value {
            self = Self.min
        } else if value > Self.max.value {
            self = Self.max
        } else {
            self.init(value: value)
        }
    }

    public func multipliedFullWidth(by other: Self) -> (high: Self, low: Self.Magnitude) {
        let product: Self.Value = self.value * other.value
        let high: Self = .init(truncatingIfNeeded: product >> Self.bitWidth)
        let low: Self = .init(truncatingIfNeeded: product)

        return (high, low)
    }

    public func dividingFullWidth(_ dividend: (high: Self, low: Self.Magnitude)) -> (quotient: Self, remainder: Self) {
        precondition(self != 0, "Divisor must not be zero.")

        let value: Self.Value = (dividend.high.value << Self.bitWidth) | dividend.low.value
        let result: (quotient: Self.Value, remainder: Self.Value) = value.quotientAndRemainder(dividingBy: self.value)

        return (
            quotient: .init(truncatingIfNeeded: result.quotient),
            remainder: .init(truncatingIfNeeded: result.remainder)
        )
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

extension UInt4: Strideable {}

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

// MARK: - UnsignedInteger

extension UInt4: UnsignedInteger {}
