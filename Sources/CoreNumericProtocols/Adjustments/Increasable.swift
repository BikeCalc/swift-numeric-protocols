//
// Increasable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be increased by n percent.
public protocol Increasable {
    /// Returns the sum of increasing this value by the specified value.
    ///
    /// - parameter percentage: The addend.
    /// - returns: The sum.
    func increasing(by percentage: Self) -> Self
}

extension Increasable {
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
		self = self.increasing(by: percentage)
    }
}
