// Subtractable.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be subtracted.
public protocol Subtractable: Equatable {
	
	// MARK: - Subtracting Values
	
	/// Returns the difference of subracting the second specified value from the first.
	///
	/// - parameter lhs: The minuend.
	/// - parameter rhs: The subtrahend.
	/// - returns: The difference.
	static func - (_ lhs: Self, _ rhs: Self) -> Self
}

extension Subtractable {
	
	// MARK: - Subtracting Values
	
	/// Subtracts the second specified value from the first and stores the difference in the left-hand-side variable.
	///
	/// - parameter lhs: The minuend.
	/// - parameter rhs: The subtrahend.
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
    /// - parameter subtrahend: The subtrahend.
    /// - returns: The difference.
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
    /// - parameter subtrahend: The subtrahend.
    public mutating func subtract(_ subtrahend: Self) {
        self -= subtrahend
    }
}

extension Subtractable
where Self: AdditiveArithmetic {
	public static func -= (_ lhs: inout Self, _ rhs: Self) {
		lhs = lhs - rhs
	}
}
