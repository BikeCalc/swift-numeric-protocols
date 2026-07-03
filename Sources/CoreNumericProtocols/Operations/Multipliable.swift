//
// Multipliable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be multiplied.
public protocol Multipliable: Equatable {
    /// Returns a boolean value indicating whether this value is a multiple of the specified value.
    ///
    /// - parameter other: The value to test.
    /// - returns: Returns `true` if this value is a multiple of the given value, and `false` otherwise.
    func isMultiple(of other: Self) -> Bool
    
    /// Returns the product of multiplying the two specified values.
    ///
    /// - parameter lhs: The multiplicand.
    /// - parameter rhs: The multiplicator.
    /// - returns: The product.
    static func * (_ lhs: Self, _ rhs: Self) -> Self
}

extension Multipliable {
	/// Multiplies the two specified values and stores the product in the left-hand-side variable.
	///
	/// - parameter lhs: The multiplicand.
	/// - parameter rhs: The multiplicator.
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
    /// - parameter multiplicator: The multiplicator.
    /// - returns: The product.
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
    /// - parameter multiplicator: The multiplicator.
    public mutating func multiply(by multiplicator: Self) {
        self *= multiplicator
    }
}
