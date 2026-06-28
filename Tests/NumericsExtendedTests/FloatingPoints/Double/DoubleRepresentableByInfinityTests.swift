//
// DoubleRepresentableByInfinityTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double RepresentableByInfinity")
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
    internal func finiteAndInfinitePredicates(value: Double, isFinite: Bool, isInfinite: Bool) {
        #expect(value.isFinite == isFinite)
        #expect(value.isInfinite == isInfinite)
    }
    
    @Test("Negative infinity equals negated infinity")
    internal func negativeInfinityEqualsNegatedInfinity() {
        #expect(Double.negativeInfinity == -Double.infinity)
    }
}
