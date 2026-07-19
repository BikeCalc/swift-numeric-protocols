//
// UInt4EquatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Equatable Tests")
internal struct UInt4EquatableTests {
    @Test(
        "Equality predicates",
        arguments: [
            (1, 2, false),
            (1, 1, true)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func equalityPredicates(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}

// MARK: - Integer Rules

extension UInt4EquatableTests {
    @Test(
        "Zero equality follows integer rules",
        arguments: [
            (0, 0, true),
            (0, 1, false)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func zeroEqualityFollowsIntegerRules(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
