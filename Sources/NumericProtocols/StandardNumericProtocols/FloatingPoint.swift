//
// FloatingPoint.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension FloatingPoint
where Self: Raisable, Self.Exponent: BinaryInteger {
    /// Returns the power of raising the first specified value to the second.
    ///
    /// ```swift
    /// print(2.0 ** 3)
    /// // Prints "8.0"
    /// ```
    ///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    /// - returns: The power.
    public static func ** (_ lhs: Self, _ rhs: Self.Exponent) -> Self {
        switch rhs {
        case ..<0:
            var result: Self = 1
            var exponent = rhs

            while exponent < 0 {
                result /= lhs
                exponent += 1
            }

            return result
        case 0:
            return 1
        case 1:
            return lhs
        default:
            var result = lhs
            var exponent: Self.Exponent = 2

            while exponent <= rhs {
                result *= lhs
                exponent += 1
            }

            return result
        }
    }
}
