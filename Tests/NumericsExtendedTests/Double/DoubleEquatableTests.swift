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
    private static let equalityArguments: Array<(lhs: Double, rhs: Double)> = [
        (1.0, 1.0),
        (1.0, 2.0),
        (-1.0, -1.0),
        (-1.0, 1.0),
        (0.5, 0.5),
        (0.5, 1.5),
        (-0.5, -0.5),
        (-0.5, 0.5)
    ]

    @Test(
        "Equality predicates",
        arguments: Self.equalityArguments
    )
    internal func equalityPredicates(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isEqual(to: rhs) == (lhs == rhs))
        #expect(lhs.isUnequal(to: rhs) == (lhs != rhs))
    }
}

// MARK: - Floating-Point Rules

extension DoubleEquatableTests {
    @Test(
        "Zero equality follows floating-point rules",
        arguments: [
            (0.0, 0.0, true),
            (-0.0, 0.0, true),
            (0.0, 1.0, false),
            (-0.0, 1.0, false)
        ]
    )
    internal func zeroEqualityFollowsFloatingPointRules(
        lhs: Double,
        rhs: Double,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }

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
