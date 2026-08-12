// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be represented by infinity.
public protocol RepresentableByInfinity: Equatable {
    /// A boolean value indicating whether this instance is finite.
    var isFinite: Bool { get }

    /// A boolean value indicating whether this instance is infinite.
    var isInfinite: Bool { get }

    /// The value representing positive infinity.
    static var infinity: Self { get }
}

extension RepresentableByInfinity
where Self: Negateable {
    /// The value representing negative infinity.
    public static var negativeInfinity: Self {
        return .infinity.negating()
    }
}
