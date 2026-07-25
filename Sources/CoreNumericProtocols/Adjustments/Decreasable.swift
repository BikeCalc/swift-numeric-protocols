//
// Decreasable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be decreased by n percent.
public protocol Decreasable {
    /// Returns the difference of decreasing this value by the specified value.
    ///
    /// - Parameter percentage: The subtrahend.
    /// - Returns: The difference.
    func decreasing(by percentage: Self) -> Self
}

extension Decreasable {
    /// Decreases this value by the specified value and produces the difference.
    ///
    /// ```swift
    /// var value: Double = 10
    /// value.decrease(by: 10)
    /// print(value)
    /// // Prints "9"
    /// ```
    ///
    /// - Parameter percentage: The subtrahend.
    public mutating func decrease(by percentage: Self) {
		self = self.decreasing(by: percentage)
    }
}
