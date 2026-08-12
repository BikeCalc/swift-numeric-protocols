// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that can represent a minimum value.
public protocol RepresentableByMin {
    /// The minimum representable value.
    static var min: Self { get }
}

extension RepresentableByMin
where Self: Equatable {
    /// A boolean value indicating whether this instance is the minimum.
    public var isMin: Bool {
        return self == .min
    }
}
