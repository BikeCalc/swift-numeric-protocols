// Increasable.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be increased by n percent.
public protocol Increasable: BinaryFloatingPoint {}

extension Increasable {
	
	// MARK: - Increasing Values
	
    /// Returns the sum of increasing this value by the specified value.
    ///
    /// ```swift
    /// let value: Double = 10
    /// print(value.increasing(by: 10))
    /// // Prints "11"
    /// ```
    ///
    /// - parameter percentage: The addend.
	/// - returns: The sum.
    public func increasing(by percentage: Self) -> Self {
		return self + self * percentage / 100
    }
    
    /// Increases this value by the specified value and produces the sum.
    ///
    /// ```swift
    /// var value: Double = 10
    /// value.increase(by: 10)
    /// print(value)
    /// // Prints "11"
    /// ```
    ///
    /// - parameter percentage: The addend.
    public mutating func increase(by percentage: Self) {
		self.increasing(by: percentage)
    }
}
