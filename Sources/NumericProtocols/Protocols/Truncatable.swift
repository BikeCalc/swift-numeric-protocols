//
// Truncatable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be truncated.
public protocol Truncatable: BinaryFloatingPoint {}

extension Truncatable {
    
    // MARK: - Truncating Values
    
    /// Returns this instance truncated to the specified decimal place.
    ///
    /// ```swift
    /// print(1.2345.truncated(to: 2))
    /// // Prints "1.23"
    /// ```
    ///
    /// - parameter countPlaces: The number of decimals places.
    /// - returns: This instance truncated.
    public func truncated(to decimalPlace: UInt) -> Self {
        let divisor: Double = 10 ** decimalPlace

        return (self * .init(divisor)).rounded(.towardZero) / .init(divisor)
    }

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
    public mutating func truncate(to decimalPlace: UInt) {
        self = self.truncated(to: decimalPlace)
    }
}
