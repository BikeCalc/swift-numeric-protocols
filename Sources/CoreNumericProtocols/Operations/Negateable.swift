// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be negating.
public protocol Negateable: Equatable {
    /// Returns the additive inverse of the specified value.
    ///
    /// - Parameter operand:
    /// - Returns: The additive inverse.
    prefix static func - (_ operand: Self) -> Self
}

extension Negateable {
    /// A boolean value indicating whether this value is signed.
    ///
    /// ```swift
    /// print(-1.isSigned)
    /// // Prints "true"
    /// ```
    public var isSigned: Bool {
        return true
    }

    /// Returns a boolean value indicating whether this value is the opposite of the specified value.
    ///
    /// ```swift
    /// print(10.isOpposite(of: -10))
    /// // Prints "true"
    /// ```
    ///
    /// - Parameter other: The value to test.
    /// - Returns: Returns `true` if this value is the opposite of the given value, and `false` otherwise.
    public func isOpposite(of other: Self) -> Bool {
        return self == other.negating()
    }

    /// Returns the additive inverse of this value.
    ///
    /// ```swift
    /// print(2.negating())
    /// // Prints "-2"
    /// ```
    ///
    /// - Returns: The additive inverse.
    public func negating() -> Self {
        return -self
    }

    /// Replaces this value with its additive inverse.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.negate()
    /// print(number)
    /// // Prints "-2"
    /// ```
    public mutating func negate() {
        self = self.negating()
    }
}

extension Negateable
where Self: Comparable & RepresentableByZero {
    /// A boolean value indicating whether this value is negative.
    ///
    /// ```swift
    /// print(1.isNegative)
    /// // Prints "false"
    /// ```
    public var isNegative: Bool {
        return self < .zero
    }

    /// A boolean value indicating whether this value is positive.
    ///
    /// ```swift
    /// print(1.isPositive)
    /// // Prints "true"
    /// ```
    public var isPositive: Bool {
        return .zero < self
    }
}
