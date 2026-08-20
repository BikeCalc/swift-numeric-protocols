// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import CoreNumericProtocols

extension BinaryFloatingPoint
where Self: Decreasable {
    /// Returns this value decreased by the specified percentage.
    ///
    /// ```swift
    /// let value: Double = Double(10)
    /// print(value.decreasing(by: 10))
    /// // Prints "9"
    /// ```
    ///
    /// - Parameter percentage: The percentage to decrease this value by.
    /// - Returns: The decreased value.
    public func decreasing(by percentage: Self) -> Self {
        return self - self * percentage / 100
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

    /// Returns a boolean value indicating whether this value is divisible by the specified value.
    ///
    /// Nonfinite values are not divisible and cannot be divisors.
    ///
    /// ```swift
    /// print(50.isDivisible(by: 0))
    /// // Prints "false"
    /// ```
    ///
    /// - Parameter other: The value to test.
    /// - Returns: `true` if this finite value is divisible by the specified finite value, and `false` otherwise.
    public func isDivisible(by other: Self) -> Bool {
        guard self.isFinite,
              other.isFinite,
              other.isZero == false else {
            return false
        }

        return (self % other).isZero
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
    /// - Parameter other: The value to test.
    /// - Returns: `true` if this value is a multiple of the specified value, and `false` otherwise.
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
where Self: Divisible & Negateable & Raisable {
    /// Returns a boolean value indicating whether this value is a power of the specified value.
    ///
    /// ```swift
    /// print(100.isPower(of: 10))
    /// // Prints "true"
    /// ```
    ///
    /// - Parameter other: The value to test.
    /// - Returns: `true` if this value is a power of the specified value, and `false` otherwise.
    public func isPower(of other: Self) -> Bool {
        guard self.isNaN == false else {
            return false
        }

        guard self != 1 else {
            return true
        }

        guard other.isNaN == false else {
            return false
        }

        if other.isZero || other.isInfinite {
            guard self.isZero || self.isInfinite else {
                return false
            }

            return self.isZero || other.sign == .minus || self.sign == .plus
        }

        guard self.isFinite, self.isZero == false else {
            return false
        }

        if other.magnitude == 1 {
            return self == other
        }

        guard self.magnitude != 1 else {
            return false
        }

        let usesPositiveExponent: Bool = (self.magnitude > 1) == (other.magnitude > 1)
        var power: Self = 1

        while true {
            let nextPower: Self = usesPositiveExponent ? power * other : power / other

            guard nextPower != self else {
                return true
            }

            guard nextPower.isFinite, nextPower.isZero == false, nextPower != power else {
                return false
            }

            if self.magnitude > 1 {
                guard nextPower.magnitude < self.magnitude else {
                    return false
                }
            } else {
                guard nextPower.magnitude > self.magnitude else {
                    return false
                }
            }

            power = nextPower
        }
    }
}

extension BinaryFloatingPoint
where Self: Increasable {
    /// Returns this value increased by the specified percentage.
    ///
    /// ```swift
    /// let value: Double = 10
    /// print(value.increasing(by: 10))
    /// // Prints "11"
    /// ```
    ///
    /// - Parameter percentage: The percentage to increase this value by.
    /// - Returns: The increased value.
    public func increasing(by percentage: Self) -> Self {
        return self + self * percentage / 100
    }
}

extension BinaryFloatingPoint
where Self: Roundable, Self.DecimalPlace: UnsignedInteger {
    /// Returns this instance rounded to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation. Values that cannot be represented exactly in binary may produce results that differ from exact decimal arithmetic.
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
    /// - Parameter decimalPlace: The number of decimal places.
    /// - Returns: This instance rounded.
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
    /// This operation uses the type's native binary floating-point representation. Values that cannot be represented exactly in binary may produce results that differ from exact decimal arithmetic.
    ///
    /// ```swift
    /// print(1.2345.truncated(to: 2))
    /// // Prints "1.23"
    /// ```
    ///
    /// - Parameter decimalPlace: The number of decimal places.
    /// - Returns: This instance truncated.
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
