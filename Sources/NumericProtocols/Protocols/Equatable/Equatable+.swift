// Equatable+.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Equatable {
	
	// MARK: - Inspecting Values
	
    /// Returns a boolean value indicating whether this value is equal to the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether the two values are equal.
    public func isEqual(to rhs: Self) -> Bool {
        return self == rhs
    }
    
    /// Returns a boolean value indicating whether this value is unequal to the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether the two values are unequal.
    public func isUnequal(to rhs: Self) -> Bool {
        return self != rhs
    }
}

extension Equatable
where Self: Divisible & ExpressibleByIntegerLiteral {
	
	// MARK: - Instance Properties
	
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
