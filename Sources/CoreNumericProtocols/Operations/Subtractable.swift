//
// Subtractable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be subtracted.
public protocol Subtractable: Equatable {
	/// Returns the difference of subtracting the second specified value from the first.
	///
	/// - Parameter lhs: The minuend.
	/// - Parameter rhs: The subtrahend.
	/// - Returns: The difference.
	static func - (_ lhs: Self, _ rhs: Self) -> Self
}

extension Subtractable {
	/// Subtracts the second specified value from the first and stores the difference in the left-hand-side variable.
	///
	/// - Parameter lhs: The minuend.
	/// - Parameter rhs: The subtrahend.
	public static func -= (_ lhs: inout Self, _ rhs: Self) {
		lhs = lhs - rhs
	}

    /// Returns the difference of subtracting the specified value from this value.
    ///
    /// ```swift
    /// print(6.subtracting(4))
    /// // Prints "2"
    /// ```
    ///
    /// - Parameter subtrahend: The subtrahend.
    /// - Returns: The difference.
    public func subtracting(_ subtrahend: Self) -> Self {
        return self - subtrahend
    }

    /// Subtracts the specified value from this value and produces the difference.
    ///
    /// ```swift
    /// var number: Double = 6
    /// number.subtract(4)
	/// print(number)
    /// // Prints "2"
    /// ```
    ///
    /// - Parameter subtrahend: The subtrahend.
    public mutating func subtract(_ subtrahend: Self) {
        self -= subtrahend
    }
}
