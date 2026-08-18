// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import CoreNumericOperators
import CoreNumericProtocols

extension Numeric
where Self: Divisible {
    /// Returns this value halved.
    ///
    /// ```swift
    /// print(1.halved())
    /// // Prints "0.5"
    /// ```
    ///
    /// - Returns: The value halved.
    public func halved() -> Self {
        return self / 2
    }

    /// Halves this value.
    ///
    /// ```swift
    /// var number: Double = 1
    /// number.halve()
    /// print(number)
    /// // Prints "0.5"
    /// ```
    public mutating func halve() {
        self = self.halved()
    }
}

extension Numeric
where Self: Multipliable {
    /// Returns this value doubled.
    ///
    /// ```swift
    /// print(1.doubled())
    /// // Prints "2"
    /// ```
    ///
    ///  - Returns: The value doubled.
    public func doubled() -> Self {
        return self * 2
    }

    /// Doubles this value.
    ///
    /// ```swift
    /// var number: Double = 1
    /// number.double()
    /// print(number)
    /// // Prints "2"
    /// ```
    public mutating func double() {
        self = self.doubled()
    }
}

extension Numeric
where Self: Raisable {
    /// Returns the result of raising this value to its square.
    ///
    /// ```swift
    /// print(2.squared())
    /// // Prints "4"
    /// ```
    ///
    /// - Returns: The square.
    public func squared() -> Self
    where Self.Exponent: ExpressibleByIntegerLiteral {
        return self ** 2
    }

    /// Raises this value to its square.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.square()
    /// print(number)
    /// // Prints "4"
    /// ```
    public mutating func square()
    where Self.Exponent: ExpressibleByIntegerLiteral {
        self **= 2
    }

    /// Returns the result of raising this value to its cube.
    ///
    /// ```swift
    /// print(2.cubed())
    /// // Prints "8"
    /// ```
    ///
    /// - Returns: The cube.
    public func cubed() -> Self
    where Self.Exponent: ExpressibleByIntegerLiteral {
        return self ** 3
    }

    /// Raises this value to its cube.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.cube()
    /// print(number)
    /// // Prints "8"
    /// ```
    public mutating func cube()
    where Self.Exponent: ExpressibleByIntegerLiteral {
        self **= 3
    }
}
