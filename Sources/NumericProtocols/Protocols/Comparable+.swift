//
// Comparable+.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Comparable {
	
	// MARK: - Inspecting Values
	
    /// Returns a boolean value indicating whether this value is less than the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether this value is less than the specified value.
    public func isLess(than rhs: Self) -> Bool {
        return self < rhs
    }
    
    /// Returns a boolean value indicating whether this value is less than or equal to the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether this value is less than or equal to the specified value.
    public func isLessThanOrEqual(to rhs: Self) -> Bool {
        return self <= rhs
    }
    
    /// Returns a boolean value indicating whether this value is greater than the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether this value is greater than the specified value.
    public func isGreater(than rhs: Self) -> Bool {
        return self > rhs
    }
    
    /// Returns a boolean value indicating whether this value is greater than or equal to the specified value.
    ///
    /// - parameter rhs: Another value to compare.
    /// - returns: A boolean indicating whether this value is greater than or equal to the specified value.
    public func isGreaterThanOrEqual(to rhs: Self) -> Bool {
        return self >= rhs
    }
	
	/// Returns a boolean value indicating whether this value is within a specified closed range.
	///
	/// ```swift
	/// let number: Int = 2
	/// print(number.isWithin(1...3))
	/// // Prints "true"
	/// ```
	///
	/// - parameter closedRange: An interval from a lower bound up to, and including, an upper bound.
	/// - returns: A boolean value.
	public func isWithin(_ closedRange: ClosedRange<Self>) -> Bool {
		return closedRange ~= self
	}
	
	/// Returns a boolean value indicating whether this value is within two specified values.
	///
	/// ```swift
	/// let number: Int = 2
	/// print(number.isWithin(1, to: 3))
	/// // Prints "true"
	/// ```
	///
	/// - parameter lowerBound: The lower bound value.
	/// - parameter upperBound: The upper bound value.
	/// - returns: A boolean value.
	/// - Warning: The lower bound value must be smaller than the upper bound value.
	public func isWithin(_ lowerBound: Self, to upperBound: Self) -> Bool {
		precondition(lowerBound < upperBound)
		
		let closedRange: ClosedRange<Self> = lowerBound...upperBound
		
		return self.isWithin(closedRange)
	}
}
