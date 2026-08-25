// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that can represent zero.
public protocol RepresentableByZero {
    /// The value representing zero.
    static var zero: Self { get }
}

extension RepresentableByZero
where Self: Equatable {
    /// A boolean value indicating whether this instance is zero.
    public var isZero: Bool {
        return self == Self.zero
    }
}

extension RepresentableByZero
where Self: Negateable {
    /// The value produced by negating zero.
    ///
    /// This value is not necessarily represented differently from zero. Types that support signed zero may preserve a
    /// distinct negative-zero representation, while other types may represent both values identically.
    public static var negativeZero: Self {
        return Self.zero.negating()
    }
}
