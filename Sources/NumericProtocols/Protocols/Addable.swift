//
// Addable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be added.
public protocol Addable: Equatable {
	/// Returns the sum of adding the two specified values.
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	/// - returns: The sum.
	static func + (_ lhs: Self, _ rhs: Self) -> Self
}

extension Addable {
	/// Adds the two specified values and stores the sum in the left-hand-side variable.
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	public static func += (_ lhs: inout Self, _ rhs: Self) {
		lhs = lhs + rhs
	}

    /// Returns the sum of adding the specified value to this value.
    ///
    /// ```swift
    /// print(2.adding(4))
    /// // Prints "6"
    /// ```
    ///
    /// - parameter addend: The addend.
    /// - returns: The sum.
    public func adding(_ addend: Self) -> Self {
        return self + addend
    }
    
	/// Adds the specified value to this value and produces the sum.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.add(4)
	/// print(number)
    /// // Prints "6"
    /// ```
    ///
    /// - parameter addend: The addend.
    public mutating func add(_ addend: Self) {
        self += addend
    }
}

extension Addable
where Self: AdditiveArithmetic {
	public static func += (_ lhs: inout Self, _ rhs: Self) {
		lhs = lhs + rhs
	}
}
