// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be rounded.
public protocol Roundable {
    /// The type used to describe the rounding precision.
    associatedtype DecimalPlace

    /// Returns this instance rounded to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation.
    /// Values that cannot be represented exactly in binary may produce results that
    /// differ from exact decimal arithmetic.
    ///
    /// - Parameter decimalPlace: The number of decimals places.
    /// - Returns: This instance rounded.
    func rounded(to decimalPlace: Self.DecimalPlace) -> Self
}

extension Roundable {
    /// Rounds this instance to the specified approximate decimal precision.
    ///
    /// This operation uses the type's native binary floating-point representation.
    /// Values that cannot be represented exactly in binary may produce results that
    /// differ from exact decimal arithmetic.
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
    /// - Parameter decimalPlace: The number of decimals places.
    public mutating func round(to decimalPlace: Self.DecimalPlace) {
        self = self.rounded(to: decimalPlace)
    }
}
