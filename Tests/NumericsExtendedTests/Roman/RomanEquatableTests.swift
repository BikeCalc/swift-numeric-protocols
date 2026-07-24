//
// RomanEquatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Equatable Tests")
internal struct RomanEquatableTests {
    private static let equalityArguments: Array<(lhs: Roman, rhs: Roman)> = [
        (1, 1),
        (1, 2)
    ]

    @Test(
        "Equality predicates",
        arguments: Self.equalityArguments
    )
    internal func equalityPredicates(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs.isEqual(to: rhs) == (lhs == rhs))
        #expect(lhs.isUnequal(to: rhs) == (lhs != rhs))
    }
}

// MARK: - Integer Rules

extension RomanEquatableTests {
    @Test(
        "Zero equality follows integer rules",
        arguments: [
            (0, 0, true),
            (0, 1, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func zeroEqualityFollowsIntegerRules(
        lhs: Roman,
        rhs: Roman,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
