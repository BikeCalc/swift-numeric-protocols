// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be added.
public protocol Addable: Equatable {
	/// Returns the sum of adding the two specified values.
	///
	/// - Parameter lhs: The augend.
	/// - Parameter rhs: The addend.
	/// - Returns: The sum.
	static func + (_ lhs: Self, _ rhs: Self) -> Self
}

extension Addable {
	/// Adds the two specified values and stores the sum in the left-hand-side variable.
	///
	/// - Parameter lhs: The augend.
	/// - Parameter rhs: The addend.
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
    /// - Parameter addend: The addend.
    /// - Returns: The sum.
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
    /// - Parameter addend: The addend.
    public mutating func add(_ addend: Self) {
        self += addend
    }
}
