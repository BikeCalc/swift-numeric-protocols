// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that can be converted to a normalized equivalent representation.
package protocol Normalizable {
    /// A boolean value indicating whether this value can be normalized.
    var isNormalizable: Bool { get }

    /// A boolean value indicating whether this value is normalized.
    var isNormalized: Bool { get }

    /// Returns a normalized equivalent representation of this value.
    func normalized() -> Self
}

extension Normalizable {
    /// Replaces this value with its normalized representation.
    package mutating func normalize() {
        self = self.normalized()
    }
}
