// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Negateable Tests")
internal struct FractionNegateableTests {
    private static let negationArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(-1, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, 2)),
        (Fraction<Int>(5, 2), Fraction<Int>(-5, 2)),
        (Fraction<Int>(-5, 2), Fraction<Int>(5, 2))
    ]

    private static let additiveInverseArguments: [Fraction<Int>] = [
        Fraction<Int>(0, 1),
        Fraction<Int>(0, -2),
        Fraction<Int>(1, 2),
        Fraction<Int>(-1, 2),
        Fraction<Int>(5, 2),
        Fraction<Int>(-5, 2)
    ]

    @Test(
        "Negation succeeds",
        arguments: Self.negationArguments
    )
    internal func negationSucceeds(
        value: Fraction<Int>,
        negation: Fraction<Int>
    ) {
        #expect(-value == negation)
    }

    @Test(
        "Negating succeeds",
        arguments: Self.negationArguments
    )
    internal func negatingSucceeds(
        value: Fraction<Int>,
        negation: Fraction<Int>
    ) {
        #expect(value.negating() == negation)
    }

    @Test(
        "Negate succeeds",
        arguments: Self.negationArguments
    )
    internal func negateSucceeds(
        value: Fraction<Int>,
        negation: Fraction<Int>
    ) {
        var runningValue: Fraction<Int> = value
        runningValue.negate()
        #expect(runningValue == negation)
    }

    @Test(
        "Is negative",
        arguments: [
            (Fraction<Int>(1, 2), false),
            (Fraction<Int>(-1, 2), true),
            (Fraction<Int>(5, 2), false),
            (Fraction<Int>(-5, 2), true)
        ]
    )
    internal func isNegative(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isNegative == result)
    }

    @Test(
        "Is positive",
        arguments: [
            (Fraction<Int>(1, 2), true),
            (Fraction<Int>(-1, 2), false),
            (Fraction<Int>(5, 2), true),
            (Fraction<Int>(-5, 2), false)
        ]
    )
    internal func isPositive(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPositive == result)
    }

    @Test(
        "Is signed",
        arguments: [
            (Fraction<Int>(1, 2), true),
            (Fraction<Int>(-1, 2), true),
            (Fraction<Int>(5, 2), true),
            (Fraction<Int>(-5, 2), true)
        ]
    )
    internal func isSigned(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isSigned == result)
    }

    @Test(
        "Is opposite",
        arguments: [
            (Fraction<Int>(1, 2), Fraction<Int>(1, 2), false),
            (Fraction<Int>(-1, 2), Fraction<Int>(-1, 2), false),
            (Fraction<Int>(-1, 2), Fraction<Int>(1, 2), true),
            (Fraction<Int>(1, 2), Fraction<Int>(-1, 2), true),
            (Fraction<Int>(5, 2), Fraction<Int>(5, 2), false),
            (Fraction<Int>(-5, 2), Fraction<Int>(-5, 2), false),
            (Fraction<Int>(-5, 2), Fraction<Int>(5, 2), true),
            (Fraction<Int>(5, 2), Fraction<Int>(-5, 2), true)
        ]
    )
    internal func isOpposite(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }
}

// MARK: - Arithmetic Rules

extension FractionNegateableTests {
    @Test(
        "Negating twice returns original value",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingTwiceReturnsOriginalValue(value: Fraction<Int>) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingFollowsAdditiveInverseRule(value: Fraction<Int>) {
        #expect((value + value.negating()).isZero == true)
    }

    @Test("One and negative one are opposites")
    internal func oneAndNegativeOneAreOpposites() {
        #expect(Fraction<Int>(1, 1).isOpposite(of: -1) == true)
        #expect(Fraction<Int>(-1, 1).isOpposite(of: 1) == true)
        #expect(Fraction<Int>(1, 1).negating() == -1)
        #expect(Fraction<Int>(-1, 1).negating() == 1)
    }
}

// MARK: - Rational Rules

extension FractionNegateableTests {
    @Test(
        "Zero sign predicates follow stored denominator rules",
        arguments: [
            (Fraction<Int>.zero, false, false, true),
            (Fraction<Int>.negativeZero, true, false, true)
        ]
    )
    internal func zeroSignPredicatesFollowStoredDenominatorRules(
        value: Fraction<Int>,
        isNegative: Bool,
        isPositive: Bool,
        isSigned: Bool
    ) {
        #expect(value.isNegative == isNegative)
        #expect(value.isPositive == isPositive)
        #expect(value.isSigned == isSigned)
    }

    @Test(
        "Zero opposite follows stored representation rules",
        arguments: [
            (Fraction<Int>.zero, Fraction<Int>.zero, true),
            (Fraction<Int>.zero, Fraction<Int>.negativeZero, false),
            (Fraction<Int>.negativeZero, Fraction<Int>.zero, false),
            (Fraction<Int>.negativeZero, Fraction<Int>.negativeZero, true)
        ]
    )
    internal func zeroOppositeFollowsStoredRepresentationRules(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }

    @Test(
        "Negating zero preserves stored representation",
        arguments: [
            Fraction<Int>.zero,
            Fraction<Int>.negativeZero
        ]
    )
    internal func negatingZeroPreservesStoredRepresentation(value: Fraction<Int>) {
        #expect(value.negating() == value)
    }
}
