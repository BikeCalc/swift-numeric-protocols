// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that supports truncation to decimal precision.
public protocol Truncatable {
    /// The type used to describe the truncation precision.
    associatedtype DecimalPlace

    /// Returns this instance truncated to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation. Values that cannot be represented exactly in binary may produce results that differ from exact decimal arithmetic.
    ///
    /// - Parameter decimalPlace: The number of decimal places.
    /// - Returns: This instance truncated.
    func truncated(to decimalPlace: Self.DecimalPlace) -> Self
}

extension Truncatable {
    /// Truncates this instance to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation. Values that cannot be represented exactly in binary may produce results that differ from exact decimal arithmetic.
    ///
    /// ```swift
    /// var number: Float = 1.2345
    /// number.truncate(to: 2)
    /// print(number)
    /// // Prints "1.23"
    /// ```
    ///
    /// - Parameter decimalPlace: The number of decimal places.
    public mutating func truncate(to decimalPlace: Self.DecimalPlace) {
        self = self.truncated(to: decimalPlace)
    }
}
