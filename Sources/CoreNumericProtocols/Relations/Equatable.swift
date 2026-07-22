//
// Equatable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Equatable {
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
