// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that supports percentage increases.
public protocol Increasable {
    /// Returns this value increased by the specified percentage.
    ///
    /// - Parameter percentage: The percentage to increase this value by.
    /// - Returns: The increased value.
    func increasing(by percentage: Self) -> Self
}

extension Increasable {
    /// Increases this value by the specified percentage.
    ///
    /// ```swift
    /// var value: Double = 10
    /// value.increase(by: 10)
    /// print(value)
    /// // Prints "11"
    /// ```
    ///
    /// - Parameter percentage: The percentage to increase this value by.
    public mutating func increase(by percentage: Self) {
        self = self.increasing(by: percentage)
    }
}
