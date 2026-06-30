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
    @Test(
        "Equality predicates",
        arguments: [
            (0, 0, true),
            (1, 2, false),
            (1, 1, true),
            (-1, 1, false),
            (-1, -1, true),
            (-0, 0, true)
        ]
    )
    internal func equalityPredicates(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
    
    @Test(
        "Parity predicates",
        arguments: [
            (0, true),
            (1, false),
            (2, true),
            (-1, false),
            (-2, true)
        ]
    )
    internal func parityPredicates(
        value: Int,
        result: Bool
    ) {
        #expect(value.isEven == result)
        #expect(value.isOdd == !result)
    }
}
