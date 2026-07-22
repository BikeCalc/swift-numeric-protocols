//
// Int4NegateableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Negateable Tests")
internal struct Int4NegateableTests {
    @Test(
        "Negation succeeds",
        arguments: [
            (1, -1),
            (-1, 1),
            (5, -5)
        ] as Array<(Int4, Int4)>
    )
    internal func negationSucceeds(
        value: Int4,
        negation: Int4
    ) {
        #expect(-value == negation)
    }

    @Test(
        "Negating succeeds",
        arguments: [
            (1, -1),
            (-1, 1),
            (5, -5)
        ] as Array<(Int4, Int4)>
    )
    internal func negatingSucceeds(
        value: Int4,
        negation: Int4
    ) {
        #expect(value.negating() == negation)
    }

    @Test(
        "Negate succeeds",
        arguments: [
            (1, -1),
            (-1, 1),
            (5, -5)
        ] as Array<(Int4, Int4)>
    )
    internal func negateSucceeds(
        value: Int4,
        negation: Int4
    ) {
        var runningValue: Int4 = value
        runningValue.negate()
        #expect(runningValue == negation)
    }

    @Test(
        "Is negative",
        arguments: [
            (1, false),
            (-1, true)
        ] as Array<(Int4, Bool)>
    )
    internal func isNegative(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isNegative == result)
    }

    @Test(
        "Is positive",
        arguments: [
            (-1, false),
            (1, true)
        ] as Array<(Int4, Bool)>
    )
    internal func isPositive(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isPositive == result)
    }

    @Test(
        "Is signed",
        arguments: [
            (-1, true),
            (1, true)
        ] as Array<(Int4, Bool)>
    )
    internal func isSigned(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isSigned == result)
    }

    @Test(
        "Is opposite",
        arguments: [
            (1, 1, false),
            (-1, 1, true),
            (1, -1, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isOpposite(
        value: Int4,
        other: Int4,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }
}

// MARK: - Integer Rules

extension Int4NegateableTests {
    @Test(
        "Zero sign predicates follow integer rules",
        arguments: [
            (0, false, false, true),
            (-0, false, false, true)
        ] as Array<(Int4, Bool, Bool, Bool)>
    )
    internal func zeroSignPredicatesFollowIntegerRules(
        value: Int4,
        isNegative: Bool,
        isPositive: Bool,
        isSigned: Bool
    ) {
        #expect(value.isNegative == isNegative)
        #expect(value.isPositive == isPositive)
        #expect(value.isSigned == isSigned)
    }

    @Test(
        "Zero opposite follows integer rules",
        arguments: [
            (0, 0, true),
            (-0, 0, true),
            (0, -0, true),
            (-0, -0, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func zeroOppositeFollowsIntegerRules(
        value: Int4,
        other: Int4,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }

    @Test(
        "Negating zero returns zero",
        arguments: [
            0,
            -0
        ] as Array<Int4>
    )
    internal func negatingZeroReturnsZero(value: Int4) {
        #expect(value.negating() == 0)
    }

    @Test(
        "Negating twice returns original value",
        arguments: [
            0,
            1,
            -1,
            5,
            -5
        ] as Array<Int4>
    )
    internal func negatingTwiceReturnsOriginalValue(value: Int4) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: [
            0,
            1,
            -1,
            5,
            -5
        ] as Array<Int4>
    )
    internal func negatingFollowsAdditiveInverseRule(value: Int4) {
        #expect(value + value.negating() == 0)
    }
}
