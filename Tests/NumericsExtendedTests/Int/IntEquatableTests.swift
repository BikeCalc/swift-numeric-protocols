//
// IntEquatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Equatable Tests")
internal struct IntEquatableTests {
    private static let equalityArguments: Array<(lhs: Int, rhs: Int)> = [
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
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs.isEqual(to: rhs) == (lhs == rhs))
        #expect(lhs.isUnequal(to: rhs) == (lhs != rhs))
    }
}

// MARK: - Integer Rules

extension IntEquatableTests {
    @Test(
        "Zero equality follows integer rules",
        arguments: [
            (0, 0, true),
            (-0, 0, true),
            (0, 1, false),
            (-0, 1, false)
        ]
    )
    internal func zeroEqualityFollowsIntegerRules(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
