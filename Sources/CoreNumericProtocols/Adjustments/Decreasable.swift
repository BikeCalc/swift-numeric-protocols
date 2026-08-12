// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that supports percentage decreases.
public protocol Decreasable {
    /// Returns this value decreased by the specified percentage.
    ///
    /// - Parameter percentage: The percentage to decrease this value by.
    /// - Returns: The decreased value.
    func decreasing(by percentage: Self) -> Self
}

extension Decreasable {
    /// Decreases this value by the specified percentage.
    ///
    /// ```swift
    /// var value: Double = 10
    /// value.decrease(by: 10)
    /// print(value)
    /// // Prints "9"
    /// ```
    ///
    /// - Parameter percentage: The percentage to decrease this value by.
    public mutating func decrease(by percentage: Self) {
        self = self.decreasing(by: percentage)
    }
}
