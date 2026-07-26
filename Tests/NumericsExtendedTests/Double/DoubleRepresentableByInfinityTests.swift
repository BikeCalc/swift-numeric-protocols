// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double RepresentableByInfinity Tests")
internal struct DoubleRepresentableByInfinityTests {
    @Test(
        "Finite and infinite predicates",
        arguments: [
            (Double.infinity, false, true),
            (Double.negativeInfinity, false, true),
            (0.0, true, false),
            (Double.nan, false, false)
        ]
    )
    internal func finiteAndInfinitePredicates(
        value: Double,
        isFinite: Bool,
        isInfinite: Bool
    ) {
        #expect(value.isFinite == isFinite)
        #expect(value.isInfinite == isInfinite)
    }

    @Test("Negative infinity equals negated infinity")
    internal func negativeInfinityEqualsNegatedInfinity() {
        #expect(Double.negativeInfinity == -Double.infinity)
    }
}
