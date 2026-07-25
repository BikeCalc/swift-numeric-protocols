//
// BinaryInteger.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols

extension BinaryInteger
where Self: Divisible {
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

extension BinaryInteger
where Self: Raisable, Self.Exponent: BinaryInteger {
    /// Returns the power of raising the first specified value to the second.
    ///
    /// ```swift
    /// print(2 ** 3)
    /// // Prints "8"
    /// ```
    ///
    /// - Parameter lhs: The base.
    /// - Parameter rhs: The exponent.
    /// - Returns: The power.
    public static func ** (_ lhs: Self, _ rhs: Self.Exponent) -> Self {
        switch rhs {
        case ..<0:
            return 0
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
