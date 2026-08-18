// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import CoreNumericOperators
import CoreNumericProtocols

extension BinaryInteger
where Self: Divisible & RepresentableByZero {
    /// Returns a boolean value indicating whether this value is divisible by the specified value.
    ///
    /// ```swift
    /// print(50.isDivisible(by: 0))
    /// // Prints "false"
    /// ```
    ///
    /// - Parameter other: The value to test.
    /// - Returns: `true` if this value is divisible by the specified value, and `false` otherwise.
    public func isDivisible(by other: Self) -> Bool {
        guard other.isZero == false else {
            return false
        }

        return (self % other).isZero
    }
}

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
where Self: Multipliable {
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

extension BinaryInteger
where Self: Divisible & Raisable {
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
        switch other {
        case 0:
            return self == 0 || self == 1
        case 1:
            return self == 1
        default:
            var number: Self = self

            while number > 1 && number.isDivisible(by: other) {
                let quotient: Self = number / other

                guard quotient != number else {
                    return false
                }

                number = quotient
            }

            return number == 1
        }
    }
}

extension BinaryInteger
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
        switch other {
        case -1:
            return self == 1 || self == -1
        case 0:
            return self == 0 || self == 1
        case 1:
            return self == 1
        default:
            var number: Self = self

            while number.isDivisible(by: other) {
                let quotient: Self = number / other

                guard quotient != number else {
                    return false
                }

                number = quotient

                if number == 1 {
                    return true
                }
            }

            return number == 1
        }
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
