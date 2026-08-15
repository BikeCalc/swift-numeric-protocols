// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A type that can be reduced to a simpler equivalent representation.
public protocol Simplifiable {
    /// A boolean value indicating whether this value can be simplified further.
    var isSimplifiable: Bool { get }

    /// Returns a simpler equivalent representation of this value.
    func simplified() -> Self
}

extension Simplifiable {
    /// A boolean value indicating whether this value is already simplified.
    public var isSimplified: Bool {
        return self.isSimplifiable == false
    }

    /// Replaces this value with its simplified representation.
    public mutating func simplify() {
        self = self.simplified()
    }
}
