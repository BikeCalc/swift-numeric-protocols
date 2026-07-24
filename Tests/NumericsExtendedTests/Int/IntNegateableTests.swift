//
// IntNegateableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Negateable Tests")
internal struct IntNegateableTests {
    private static let negationArguments: Array<(value: Int, negation: Int)> = [
        (1, -1),
        (-1, 1),
        (5, -5),
        (-5, 5)
    ]

    private static let additiveInverseArguments: Array<Int> = [
        0,
        -0,
        1,
        -1,
        5,
        -5
    ]

    @Test(
        "Negation succeeds",
        arguments: Self.negationArguments
    )
    internal func negationSucceeds(
        value: Int,
        negation: Int
    ) {
        #expect(-value == negation)
    }

    @Test(
        "Negating succeeds",
        arguments: Self.negationArguments
    )
    internal func negatingSucceeds(
        value: Int,
        negation: Int
    ) {
        #expect(value.negating() == negation)
    }

    @Test(
        "Negate succeeds",
        arguments: Self.negationArguments
    )
    internal func negateSucceeds(
        value: Int,
        negation: Int
    ) {
        var runningValue: Int = value
        runningValue.negate()
        #expect(runningValue == negation)
    }

    @Test(
        "Is negative",
        arguments: [
            (1, false),
            (-1, true),
            (5, false),
            (-5, true)
        ]
    )
    internal func isNegative(
        value: Int,
        result: Bool
    ) {
        #expect(value.isNegative == result)
    }

    @Test(
        "Is positive",
        arguments: [
            (1, true),
            (-1, false),
            (5, true),
            (-5, false)
        ]
    )
    internal func isPositive(
        value: Int,
        result: Bool
    ) {
        #expect(value.isPositive == result)
    }

    @Test(
        "Is signed",
        arguments: [
            (1, true),
            (-1, true),
            (5, true),
            (-5, true)
        ]
    )
    internal func isSigned(
        value: Int,
        result: Bool
    ) {
        #expect(value.isSigned == result)
    }

    @Test(
        "Is opposite",
        arguments: [
            (1, 1, false),
            (-1, -1, false),
            (-1, 1, true),
            (1, -1, true),
            (5, 5, false),
            (-5, -5, false),
            (-5, 5, true),
            (5, -5, true)
        ]
    )
    internal func isOpposite(
        value: Int,
        other: Int,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }
}

// MARK: - Arithmetic Rules

extension IntNegateableTests {
    @Test(
        "Negating twice returns original value",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingTwiceReturnsOriginalValue(value: Int) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingFollowsAdditiveInverseRule(value: Int) {
        #expect(value + value.negating() == 0)
    }

    @Test("One and negative one are opposites")
    internal func oneAndNegativeOneAreOpposites() {
        #expect(1.isOpposite(of: -1))
        #expect((-1).isOpposite(of: 1))
        #expect(1.negating() == -1)
        #expect((-1).negating() == 1)
    }
}

// MARK: - Integer Rules

extension IntNegateableTests {
    @Test(
        "Zero sign predicates follow integer rules",
        arguments: [
            (0, false, false, true),
            (-0, false, false, true)
        ]
    )
    internal func zeroSignPredicatesFollowIntegerRules(
        value: Int,
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
        ]
    )
    internal func zeroOppositeFollowsIntegerRules(
        value: Int,
        other: Int,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }

    @Test(
        "Negating zero returns zero",
        arguments: [
            0,
            -0
        ]
    )
    internal func negatingZeroReturnsZero(value: Int) {
        #expect(value.negating() == 0)
    }
}
