//
// Int4.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols
import StandardNumericProtocols
import StandardNumericTypes

/// A 4-bit signed integer value.
///
/// `Int4` stores values in the closed range `-8...7`. The value is backed by `Int8` storage, but only the low four bits are semantically part of the integer. Truncating and overflow-reporting operations interpret those bits using two's-complement signed integer rules.
public struct Int4 {
    /// The storage type used to hold the 4-bit value.
    internal typealias Value = Int8

    /// The underlying storage value.
    ///
    /// This value is always constrained to `-8...7`.
    internal let value: Self.Value

    /// Creates a new instance with the specified value.
    ///
    /// - parameter value: The value of this instance.
    /// - Warning: The value must be between negative eight and seven, inclusive.
    internal init(value: Self.Value) {
        precondition(-8...7 ~= value, "Int4 value must be between -8 and 7.")
        self.value = value
    }

    /// The unsigned low four bits of this value.
    private var bitPattern: UInt8 {
        return .init(bitPattern: self.value) & 0b1111
    }

    /// Creates a value by interpreting the low four bits as two's-complement.
    ///
    /// - parameter bits: The bits to interpret.
    private init(bitPattern bits: UInt8) {
        let nibble: UInt8 = bits & 0b1111
        let modulus: Self.Value = 16
        let value: Self.Value = if nibble >= 0b1000 {
            .init(nibble) - .init(modulus)
        } else {
            .init(nibble)
        }

        self.init(value: value)
    }
}

// MARK: - Addable

extension Int4: Addable {
    /// Returns the sum of adding the two specified values.
    ///
    /// ```swift
    /// let one: Int4 = 1
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

extension Int4: AdditiveArithmetic {}

// MARK: - BinaryInteger

extension Int4: BinaryInteger {
    /// A one-word collection containing the machine-word representation of an `Int4` value.
    ///
    /// `Int4` always fits in a single machine word.
    public struct Words: RandomAccessCollection, Sendable {
        /// The type of each machine word in the collection.
        public typealias Element = UInt

        /// The type used to index the collection.
        public typealias Index = Int

        /// The single machine word containing this value.
        private let value: UInt

        /// Creates a one-word collection with the specified value.
        ///
        /// - parameter value: The value stored by the collection.
        internal init(_ value: UInt) {
            self.value = value
        }

        /// The position of the first word.
        public var startIndex: Int {
            return 0
        }

        /// The position after the last word.
        public var endIndex: Int {
            return 1
        }

        /// Accesses the word at the specified position.
        ///
        /// - parameter position: The position of the word to access.
        /// - returns: The word at the specified position.
        public subscript(position: Int) -> UInt {
            precondition(position == self.startIndex, "Int4 words index must be zero.")

            return self.value
        }

        /// Returns the position immediately after the specified index.
        ///
        /// - parameter index: A valid index of the collection.
        /// - returns: The index immediately after `index`.
        public func index(after index: Int) -> Int {
            precondition(index == self.startIndex, "Int4 words index must be the start index.")

            return index + 1
        }

        /// Returns the position immediately before the specified index.
        ///
        /// - parameter index: A valid index of the collection.
        /// - returns: The index immediately before `index`.
        public func index(before index: Int) -> Int {
            precondition(index == self.endIndex, "Int4 words index must be the end index.")

            return index - 1
        }

        /// Returns an index offset from the specified index.
        ///
        /// - parameter index: The index to offset.
        /// - parameter distance: The distance to offset `index` by.
        /// - returns: An index offset by `distance`.
        public func index(_ index: Int, offsetBy distance: Int) -> Int {
            let newIndex: Int = index + distance
            precondition(self.startIndex...self.endIndex ~= newIndex, "Int4 words index must be within bounds.")

            return newIndex
        }

        /// Returns the distance between two indices.
        ///
        /// - parameter start: The starting index.
        /// - parameter end: The ending index.
        /// - returns: The distance from `start` to `end`.
        public func distance(from start: Int, to end: Int) -> Int {
            return end - start
        }
    }

    /// The machine-word representation of this value.
    public var words: Self.Words {
        return .init(.init(bitPattern: .init(self.value)))
    }

    /// The number of trailing zeros in this value's 4-bit binary representation.
    public var trailingZeroBitCount: Int {
        guard self != 0 else {
            return Self.bitWidth
        }

        return self.bitPattern.trailingZeroBitCount
    }

    /// Creates a new instance from the specified integer.
    ///
    /// - parameter source: The value to use for the new instance.
    /// - Warning: The source must be representable in the range `-8...7`.
    public init<T>(_ source: T)
    where T: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
              Self.min.value...Self.max.value ~= value else {
            preconditionFailure("Int4 value must be between \(Self.min) and \(Self.max).")
        }

        self.init(value: value)
    }

    /// Stores the bitwise AND of the two specified values in the left-hand-side variable.
    ///
    /// - parameter lhs: The left-hand-side value.
    /// - parameter rhs: The right-hand-side value.
    public static func &= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(bitPattern: lhs.bitPattern & rhs.bitPattern)
    }

    /// Stores the bitwise OR of the two specified values in the left-hand-side variable.
    ///
    /// - parameter lhs: The left-hand-side value.
    /// - parameter rhs: The right-hand-side value.
    public static func |= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(bitPattern: lhs.bitPattern | rhs.bitPattern)
    }

    /// Stores the bitwise XOR of the two specified values in the left-hand-side variable.
    ///
    /// - parameter lhs: The left-hand-side value.
    /// - parameter rhs: The right-hand-side value.
    public static func ^= (_ lhs: inout Self, _ rhs: Self) {
        lhs = .init(bitPattern: lhs.bitPattern ^ rhs.bitPattern)
    }
}

// MARK: - Comparable

extension Int4: Comparable {
    public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
}

// MARK: - CustomStringConvertible

extension Int4: CustomStringConvertible {
    public var description: String {
        return self.value.description
    }
}

// MARK: - Decodable

extension Int4: Decodable {
    public init(from decoder: Decoder) throws {
        let container: SingleValueDecodingContainer = try decoder.singleValueContainer()
        let value: Self.Value = try container.decode(Self.Value.self)

        guard Self.min.value...Self.max.value ~= value else {
            let debugDescription: String = "Int4 value must be between \(Self.min) and \(Self.max)."
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: debugDescription
            )
        }

        self.init(value: value)
    }
}

// MARK: - Divisible

extension Int4: Divisible {
    /// Returns the quotient of dividing the first specified value by the second.
    ///
    /// ```swift
    /// let six: Int4 = 6
    /// let two: Int4 = 2
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

extension Int4: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}

// MARK: - Equatable

extension Int4: Equatable {
    public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Int4: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        precondition(-8...7 ~= value, "Int4 integer literal must be between \(Self.min) and \(Self.max).")

        let newValue: Self.Value = .init(value)

        self.init(value: newValue)
    }
}

// MARK: - FixedWidthInteger

extension Int4: FixedWidthInteger {
    public static var bitWidth: Int {
        return 4
    }

    public static var isSigned: Bool {
        return true
    }

    public var nonzeroBitCount: Int {
        return self.bitPattern.nonzeroBitCount
    }

    public var leadingZeroBitCount: Int {
        guard self.value >= 0 else {
            return 0
        }

        guard self != 0 else {
            return Self.bitWidth
        }

        return Self.bitWidth - self.bitPattern.bitWidth + self.bitPattern.leadingZeroBitCount
    }

    public var byteSwapped: Self {
        return self
    }

    public init<T>(truncatingIfNeeded source: T)
    where T: BinaryInteger {
        let bits: UInt8 = .init(truncatingIfNeeded: source)
        self.init(bitPattern: bits)
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
        let bits: UInt8 = .init(truncatingIfNeeded: product)
        let high: Self = .init(bitPattern: bits >> Self.bitWidth)
        let low: Self.Magnitude = .init(truncatingIfNeeded: bits)

        return (
            high: high,
            low: low
        )
    }

    public func dividingFullWidth(_ dividend: (high: Self, low: Self.Magnitude)) -> (quotient: Self, remainder: Self) {
        precondition(self != 0, "Divisor must not be zero.")

        let raw: UInt8 = (dividend.high.bitPattern << Self.bitWidth) | dividend.low.value
        let signedDividend: Self.Value = .init(bitPattern: raw)
        let result: (quotient: Self.Value, remainder: Self.Value) = signedDividend.quotientAndRemainder(dividingBy: self.value)
        let quotient: Self = .init(truncatingIfNeeded: result.quotient)
        let remainder: Self = .init(truncatingIfNeeded: result.remainder)

        return (
            quotient: quotient,
            remainder: remainder
        )
    }
}

// MARK: - Hashable

extension Int4: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value.hashValue)
    }
}

// MARK: - LosslessStringConvertible

extension Int4: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let value: Self.Value = .init(description),
              Self.min.value...Self.max.value ~= value else {
            return nil
        }

        self.init(value: value)
    }
}

// MARK: - Multipliable

extension Int4: Multipliable {
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
    /// let two: Int4 = 2
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

// MARK: - Negateable

extension Int4: Negateable {
    public static prefix func - (_ operand: Self) -> Self {
        let newValue: Self.Value = -operand.value
        return .init(value: newValue)
    }
}

// MARK: - Numeric

extension Int4: Numeric {
    public typealias Magnitude = UInt4

    public init?<Source>(exactly source: Source)
    where Source: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
              Self.min.value...Self.max.value ~= value else {
            return nil
        }

        self.init(value: value)
    }

    public var magnitude: Self.Magnitude {
        if self.value == Self.min.value {
            return 8
        }

        let absoluteValue: Self.Value = abs(self.value)
        return .init(value: .init(absoluteValue))
    }
}

// MARK: - Raisable

extension Int4: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension Int4: ReportableAsOverflow {
    public func addingReportingOverflow(_ rhs: Self) -> Self.Report {
        let sum: Self.Value = self.value &+ rhs.value
        let partialValue: Self = .init(truncatingIfNeeded: sum)

        let overflow: Bool = if rhs.value > 0 {
            self.value > Self.max.value - rhs.value
        } else if rhs.value < 0 {
            self.value < Self.min.value - rhs.value
        } else {
            false
        }

        return (partialValue: partialValue, overflow: overflow)
    }

    public func subtractingReportingOverflow(_ rhs: Self) -> Self.Report {
        let difference: Self.Value = self.value &- rhs.value
        let partialValue: Self = .init(truncatingIfNeeded: difference)

        let overflow: Bool = if rhs.value > 0 {
            self.value < Self.min.value + rhs.value
        } else if rhs.value < 0 {
            self.value > Self.max.value + rhs.value
        } else {
            false
        }

        return (partialValue: partialValue, overflow: overflow)
    }

    public func multipliedReportingOverflow(by rhs: Self) -> Self.Report {
        let product: Self.Value = self.value &* rhs.value
        let partialValue: Self = .init(truncatingIfNeeded: product)

        let overflow: Bool = if self.value == 0 || rhs.value == 0 {
            false
        } else if self.value > 0 && rhs.value > 0 {
            self.value > Self.max.value / rhs.value
        } else if self.value > 0 && rhs.value < 0 {
            rhs.value < Self.min.value / self.value
        } else if self.value < 0 && rhs.value > 0 {
            self.value < Self.min.value / rhs.value
        } else {
            self.value < Self.max.value / rhs.value
        }

        return (partialValue: partialValue, overflow: overflow)
    }

    public func dividedReportingOverflow(by rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (partialValue: self, overflow: true)
        }

        guard self.value != Self.min.value || rhs.value != -1 else {
            return (partialValue: self, overflow: true)
        }

        let quotient: Self.Value = self.value / rhs.value
        let partialValue: Self = .init(value: quotient)

        return (partialValue: partialValue, overflow: false)
    }

    public func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (partialValue: self, overflow: true)
        }

        guard self.value != Self.min.value || rhs.value != -1 else {
            return (partialValue: 0, overflow: true)
        }

        let remainder: Self.Value = self.value % rhs.value
        let partialValue: Self = .init(value: remainder)

        return (partialValue: partialValue, overflow: false)
    }

    public func raisedReportingOverflow(to rhs: Self.Exponent) -> Self.Report {
        switch rhs {
        case ..<0:
            return (partialValue: 0, overflow: false)
        case 0:
            return (partialValue: 1, overflow: false)
        case 1:
            return (partialValue: self, overflow: false)
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

            return (partialValue: result, overflow: false)
        }
    }
}

// MARK: - RepresentableByMax

extension Int4: RepresentableByMax {
    public static var max: Self {
        return .init(value: 7)
    }
}

// MARK: - RepresentableByMin

extension Int4: RepresentableByMin {
    public static var min: Self {
        return .init(value: -8)
    }
}

// MARK: - RepresentableByZero

extension Int4: RepresentableByZero {
    public static var zero: Self {
        return .init(value: 0)
    }
}

// MARK: - Sendable

extension Int4: Sendable {}

// MARK: - SignedInteger

extension Int4: SignedInteger {}

// MARK: - SignedNumeric

extension Int4: SignedNumeric {}

// MARK: - Strideable

extension Int4: Strideable {}

// MARK: - Subtractable

extension Int4: Subtractable {
    /// Returns the difference of subtracting the second specified value from the first.
    ///
    /// ```swift
    /// let two: Int4 = 2
    /// let one: Int4 = 1
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
