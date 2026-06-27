//
// Roundable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be rounded.
public protocol Roundable {
    /// The type used to describe the rounding precision.
    associatedtype DecimalPlace
    
    /// Returns this instance rounded to the specified decimal place.
    ///
    /// - parameter decimalPlace: The number of decimals places.
    /// - returns: This instance rounded.
    func rounded(to decimalPlace: Self.DecimalPlace) -> Self
}

extension Roundable {
    /// Rounds this instance to the specified decimal place.
    ///
    /// ```swift
    /// var number: Float = 1.2345
    /// number.round(to: 2)
    /// print(number)
    /// // Prints "1.23"
    /// ```
    ///
    /// ```swift
    /// var number: Float = 1.5678
    /// number.round(to: 2)
    /// print(number)
    /// // Prints "1.57"
    /// ```
    ///
    /// - parameter decimalPlace: The number of decimals places.
    public mutating func round(to decimalPlace: Self.DecimalPlace) {
        self = self.rounded(to: decimalPlace)
    }
}
