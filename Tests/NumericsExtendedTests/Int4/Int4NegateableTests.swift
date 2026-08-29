// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int4 Negateable Tests")
internal struct Int4NegateableTests {
    private static let negationArguments: Array<(Int4, Int4)> = [
        (1, -1),
        (-1, 1),
        (5, -5),
        (-5, 5)
    ]

    private static let additiveInverseArguments: Array<Int4> = [
        0,
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
        value: Int4,
        negation: Int4
    ) {
        #expect(-value == negation)
    }

    @Test(
        "Negating succeeds",
        arguments: Self.negationArguments
    )
    internal func negatingSucceeds(
        value: Int4,
        negation: Int4
    ) {
        #expect(value.negating() == negation)
    }

    @Test(
        "Negate succeeds",
        arguments: Self.negationArguments
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
            (-1, true),
            (5, false),
            (-5, true)
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
            (1, true),
            (-1, false),
            (5, true),
            (-5, false)
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
            (1, true),
            (-1, true),
            (5, true),
            (-5, true)
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
            (-1, -1, false),
            (-1, 1, true),
            (1, -1, true),
            (5, 5, false),
            (-5, -5, false),
            (-5, 5, true),
            (5, -5, true)
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

// MARK: - Arithmetic Rules

extension Int4NegateableTests {
    @Test(
        "Negating twice returns original value",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingTwiceReturnsOriginalValue(value: Int4) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingFollowsAdditiveInverseRule(value: Int4) {
        #expect(value + value.negating() == Int4.zero)
    }

    @Test("One and negative one are opposites")
    internal func oneAndNegativeOneAreOpposites() {
        #expect(Int4(1).isOpposite(of: -1) == true)
        #expect(Int4(-1).isOpposite(of: 1) == true)
        #expect(Int4(1).negating() == -1)
        #expect(Int4(-1).negating() == 1)
    }
}

// MARK: - Integer Rules

extension Int4NegateableTests {
    @Test("Zero sign predicates follow integer rules")
    internal func zeroSignPredicatesFollowIntegerRules() {
        #expect(Int4.zero.isNegative == false)
        #expect(Int4.zero.isPositive == false)
        #expect(Int4.zero.isSigned == true)
    }

    @Test("Zero opposite follows integer rules")
    internal func zeroOppositeFollowsIntegerRules() {
        #expect(Int4.zero.isOpposite(of: .zero) == true)
    }

    @Test("Negating zero returns zero")
    internal func negatingZeroReturnsZero() {
        let operatorNegation: Int4 = -Int4.zero
        let methodNegation: Int4 = Int4.zero.negating()
        var mutatingNegation: Int4 = Int4.zero
        mutatingNegation.negate()

        #expect(operatorNegation == .zero)
        #expect(methodNegation == .zero)
        #expect(mutatingNegation == .zero)
    }
}
