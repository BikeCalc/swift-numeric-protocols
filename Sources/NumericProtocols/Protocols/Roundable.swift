//
// Roundable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be rounded.
public protocol Roundable: BinaryFloatingPoint {}

extension Roundable {
    /// Returns this instance rounded to the specified decimal place.
    ///
    /// ```swift
    /// print(1.2345.rounded(to: 2))
    /// // Prints "1.23"
    /// ```
    ///
    /// ```swift
    /// print(1.5678.rounded(to: 2))
    /// // Prints "1.57"
    /// ```
    ///
    /// - parameter decimalPlace: The number of decimals places.
    /// - returns: This instance rounded.
    public func rounded(to decimalPlace: UInt = 0) -> Self {
        let divisor: Double = 10 ** decimalPlace
        return (self * .init(divisor)).rounded(.toNearestOrAwayFromZero) / .init(divisor)
    }

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
    public mutating func round(to decimalPlace: UInt = 0) {
        self = self.rounded(to: decimalPlace)
    }
}
