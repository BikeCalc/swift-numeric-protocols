// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that can be converted to a simplified equivalent representation.
package protocol Simplifiable {
    /// A boolean value indicating whether this value can be converted to its simplified representation.
    ///
    /// This property is `true` when simplification can be performed safely, including when the value is already
    /// simplified and the operation leaves it unchanged.
    var isSimplifiable: Bool { get }

    /// A boolean value indicating whether this value is in its simplified representation.
    var isSimplified: Bool { get }

    /// Returns the simplified representation of this value.
    func simplified() -> Self
}

extension Simplifiable {
    /// Replaces this value with its simplified representation.
    package mutating func simplify() {
        self = self.simplified()
    }
}
