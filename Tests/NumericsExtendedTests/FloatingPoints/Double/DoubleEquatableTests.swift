//
// DoubleEquatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Equatable Tests")
internal struct DoubleEquatableTests {
    @Test(
        "Equality predicates",
        arguments: [
            (0.0, 0.0, true),
            (1.0, 2.0, false),
            (1.0, 1.0, true),
            (-1.0, 1.0, false),
            (-1.0, -1.0, true),
            (-0.0, 0.0, true)
        ]
    )
    internal func equalityPredicates(
        lhs: Double,
        rhs: Double,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}

// MARK: - Rules

extension DoubleEquatableTests {
    @Test(
        "NaN equality follows floating-point rules",
        arguments: [
            (Double.nan, Double.nan),
            (Double.nan, 1.0),
            (1.0, Double.nan)
        ]
    )
    internal func nanEqualityFollowsFloatingPointRules(
        lhs: Double,
        rhs: Double
    ) {
        #expect((lhs == rhs) == false)
        #expect(lhs.isEqual(to: rhs) == false)
        #expect(lhs.isUnequal(to: rhs) == true)
    }
}
