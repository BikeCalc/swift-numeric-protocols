//
// BinaryFloatingPoint.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols

extension BinaryFloatingPoint
where Self: Decreasable {
    /// Returns the difference of decreasing this value by the specified value.
    ///
    /// ```swift
    /// let value: Double = Double(10)
    /// print(value.decreasing(by: 10))
    /// // Prints "9"
    /// ```
    ///
    /// - parameter percentage: The subtrahend.
    /// - returns: The difference.
    public func decreasing(by percentage: Self) -> Self {
        return self - self * percentage / 100
    }
}

extension BinaryFloatingPoint
where Self: Divisible & Multipliable {
    /// Returns a boolean value indicating whether this value is a multiple of the specified value.
    ///
    /// ```swift
    /// print(50.isMultiple(of: 10))
    /// // Prints "true"
    /// ```
    ///
    /// - parameter other: The value to test.
    /// - returns: Returns `true` if this value is a multiple of the given value, and `false` otherwise.
    public func isMultiple(of other: Self) -> Bool {
        if self == 0 && other == 0 {
            return true
        }

        guard other != 0 else {
            return false
        }

        return (self % other) == 0
    }
}

extension BinaryFloatingPoint
where Self: Divisible {
    /// Returns the reciprocal of this instance.
    public var reciprocal: Self? {
        guard self.isInvertible else {
            return nil
        }

        return 1 / self
    }

    /// A boolean value indicating whether this instance is invertible.
    public var isInvertible: Bool {
        return self.isZero == false
            && self.isNaN == false
    }
}

extension BinaryFloatingPoint
where Self: Increasable {
    /// Returns the sum of increasing this value by the specified value.
    ///
    /// ```swift
    /// let value: Double = 10
    /// print(value.increasing(by: 10))
    /// // Prints "11"
    /// ```
    ///
    /// - parameter percentage: The addend.
    /// - returns: The sum.
    public func increasing(by percentage: Self) -> Self {
        return self + self * percentage / 100
    }
}

extension BinaryFloatingPoint
where Self: Roundable, Self.DecimalPlace: UnsignedInteger {
    /// Returns this instance rounded to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation.
    /// Values that cannot be represented exactly in binary may produce results that
    /// differ from exact decimal arithmetic.
    ///
    /// ```swift
    /// print(1.2345.rounded(to: 2))
    /// // Prints "1.23"
    /// ```
    ///
    /// ```swift
    /// print(1.5678.rounded(to: 2))
    /// // Prints "1.57"
    /// ```
    ///
    /// - parameter decimalPlace: The number of decimals places.
    /// - returns: This instance rounded.
    public func rounded(to decimalPlace: Self.DecimalPlace) -> Self {
        var divisor: Self = 1
        var remaining = decimalPlace

        while remaining > 0 {
            divisor *= 10
            remaining -= 1
        }

        return (self * .init(divisor)).rounded(.toNearestOrAwayFromZero) / .init(divisor)
    }
}

extension BinaryFloatingPoint
where Self: Truncatable, Self.DecimalPlace: UnsignedInteger {
    /// Returns this instance truncated to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation.
    /// Values that cannot be represented exactly in binary may produce results that
    /// differ from exact decimal arithmetic.
    ///
    /// ```swift
    /// print(1.2345.truncated(to: 2))
    /// // Prints "1.23"
    /// ```
    ///
    /// - parameter countPlaces: The number of decimals places.
    /// - returns: This instance truncated.
    public func truncated(to decimalPlace: Self.DecimalPlace) -> Self {
        var divisor: Self = 1
        var remaining = decimalPlace

        while remaining > 0 {
            divisor *= 10
            remaining -= 1
        }

        return (self * .init(divisor)).rounded(.towardZero) / .init(divisor)
    }
}
