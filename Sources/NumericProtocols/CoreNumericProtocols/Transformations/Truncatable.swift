//
// Truncatable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be truncated.
public protocol Truncatable {
    /// The type used to describe the truncation precision.
    associatedtype DecimalPlace
    
    /// Returns this instance truncated to the specified decimal place.
    ///
    /// - parameter countPlaces: The number of decimals places.
    /// - returns: This instance truncated.
    func truncated(to decimalPlace: Self.DecimalPlace) -> Self
}

extension Truncatable {
    /// Truncates this instance to the specified decimal place.
    ///
    /// ```swift
    /// var number: Float = 1.2345
    /// number.truncate(to: 2)
    /// print(number)
    /// // Prints "1.23"
    /// ```
    ///
    /// - parameter countPlaces: The number of decimals places.
    public mutating func truncate(to decimalPlace: Self.DecimalPlace) {
        self = self.truncated(to: decimalPlace)
    }
}
