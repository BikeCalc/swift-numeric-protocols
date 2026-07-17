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
    @Test(
        "Equality predicates",
        arguments: [
            (0, 0, true),
            (1, 2, false),
            (1, 1, true)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func equalityPredicates(
        lhs: Roman,
        rhs: Roman,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
