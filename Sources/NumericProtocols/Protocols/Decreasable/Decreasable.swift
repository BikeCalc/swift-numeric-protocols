// Decreasable.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be decreased by n percent.
public protocol Decreasable: Increasable {}

extension Decreasable {
	
	// MARK: - Decreasing Values
	
    /// Returns the difference of descreasing this value by the specified value.
	///
    /// ```swift
    /// let value: Double = Double(10)
    /// print(value.decreasing(by: 10))
    /// // Prints "9"
    /// ```
    ///
    /// - parameter percentage: The subtrahend.
    /// - returns: The difference.
    public func decreasing(by percentage: Self) -> Self {
        return self - self * percentage / 100
    }
    
    /// Decreases this value by the specified value and produces the difference.
    ///
    /// ```swift
    /// var value: Double = 10
    /// value.decrease(by: 10)
    /// print(value)
    /// // Prints "9"
    /// ```
    ///
    /// - parameter percentage: The subtrahend.
    public mutating func decrease(by percentage: Self) {
		self = self.decreasing(by: percentage)
    }
}
