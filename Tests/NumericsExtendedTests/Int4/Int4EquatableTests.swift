//
// Int4EquatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Equatable Tests")
internal struct Int4EquatableTests {
    private static let equalityArguments: Array<(lhs: Int4, rhs: Int4)> = [
        (1, 1),
        (1, 2),
        (-1, -1),
        (-1, 1)
    ]

    @Test(
        "Equality predicates",
        arguments: Self.equalityArguments
    )
    internal func equalityPredicates(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs.isEqual(to: rhs) == (lhs == rhs))
        #expect(lhs.isUnequal(to: rhs) == (lhs != rhs))
    }
}

// MARK: - Integer Rules

extension Int4EquatableTests {
    @Test(
        "Zero equality follows integer rules",
        arguments: [
            (0, 0, true),
            (-0, 0, true),
            (0, 1, false),
            (-0, 1, false)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func zeroEqualityFollowsIntegerRules(
        lhs: Int4,
        rhs: Int4,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
