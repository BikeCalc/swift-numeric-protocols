// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be multiplied.
public protocol Multipliable: Equatable {
    /// Returns a boolean value indicating whether this value is a multiple of the specified value.
    ///
    /// - Parameter other: The value to test.
    /// - Returns: Returns `true` if this value is a multiple of the given value, and `false` otherwise.
    func isMultiple(of other: Self) -> Bool

    /// Returns the product of multiplying the two specified values.
    ///
    /// - Parameter lhs: The multiplicand.
    /// - Parameter rhs: The multiplicator.
    /// - Returns: The product.
    static func * (_ lhs: Self, _ rhs: Self) -> Self
}

extension Multipliable {
	/// Multiplies the two specified values and stores the product in the left-hand-side variable.
	///
	/// - Parameter lhs: The multiplicand.
	/// - Parameter rhs: The multiplicator.
	public static func *= (_ lhs: inout Self, _ rhs: Self) {
		lhs = lhs * rhs
	}

    /// Returns the product of multiplying this value by the specified value.
    ///
    /// ```swift
    /// print(2.multiplying(by: 3))
    /// // Prints "6"
    /// ```
    ///
    /// - Parameter multiplicator: The multiplicator.
    /// - Returns: The product.
    public func multiplying(by multiplicator: Self) -> Self {
        return self * multiplicator
    }

    /// Multiplies this value by the specified value and produces the product.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.multiply(by: 3)
	/// print(number)
    /// // Prints "6"
    /// ```
    ///
    /// - Parameter multiplicator: The multiplicator.
    public mutating func multiply(by multiplicator: Self) {
        self *= multiplicator
    }
}
