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
    @Test("Positive zero sign predicates follow stored denominator rules")
    internal func positiveZeroSignPredicatesFollowStoredDenominatorRules() {
        let value: Fraction<Int> = .zero

        #expect(value.isNegative == false)
        #expect(value.isPositive == false)
        #expect(value.isSigned == true)
    }

    @Test("Negative zero sign predicates follow stored denominator rules")
    internal func negativeZeroSignPredicatesFollowStoredDenominatorRules() {
        let value: Fraction<Int> = .negativeZero

        #expect(value.isNegative == true)
        #expect(value.isPositive == false)
        #expect(value.isSigned == true)
    }

    @Test(
        "Positive zero opposite follows stored representation rules",
        arguments: [
            (Fraction<Int>.zero, true),
            (Fraction<Int>.negativeZero, false)
        ]
    )
    internal func positiveZeroOppositeFollowsStoredRepresentationRules(
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(Fraction<Int>.zero.isOpposite(of: other) == result)
    }

    @Test(
        "Negative zero opposite follows stored representation rules",
        arguments: [
            (Fraction<Int>.negativeZero, true),
            (Fraction<Int>.zero, false)
        ]
    )
    internal func negativeZeroOppositeFollowsStoredRepresentationRules(
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(Fraction<Int>.negativeZero.isOpposite(of: other) == result)
    }

    @Test(
        "Negating positive zero preserves stored representation",
        arguments: [
            Fraction<Int>.zero,
            Fraction<Int>(0, 2)
        ]
    )
    internal func negatingPositiveZeroPreservesStoredRepresentation(value: Fraction<Int>) {
        let operatorNegation: Fraction<Int> = -value
        let methodNegation: Fraction<Int> = value.negating()
        var mutatingNegation: Fraction<Int> = value
        mutatingNegation.negate()

        #expect(operatorNegation == value)
        #expect(methodNegation == value)
        #expect(mutatingNegation == value)
    }

    @Test(
        "Negating negative zero preserves stored representation",
        arguments: [
            Fraction<Int>.negativeZero,
            Fraction<Int>(0, -2)
        ]
    )
    internal func negatingNegativeZeroPreservesStoredRepresentation(value: Fraction<Int>) {
        let operatorNegation: Fraction<Int> = -value
        let methodNegation: Fraction<Int> = value.negating()
        var mutatingNegation: Fraction<Int> = value
        mutatingNegation.negate()

        #expect(operatorNegation == value)
        #expect(methodNegation == value)
        #expect(mutatingNegation == value)
    }

    @Test("Negating positive infinity follows rational rules")
    internal func negatingPositiveInfinityFollowsRationalRules() {
        let operatorNegation: Fraction<Int> = -Fraction<Int>.infinity
        let methodNegation: Fraction<Int> = Fraction<Int>.infinity.negating()
        var mutatingNegation: Fraction<Int> = Fraction<Int>.infinity
        mutatingNegation.negate()

        #expect(operatorNegation == .negativeInfinity)
        #expect(methodNegation == .negativeInfinity)
        #expect(mutatingNegation == .negativeInfinity)
    }

    @Test("Negating negative infinity follows rational rules")
    internal func negatingNegativeInfinityFollowsRationalRules() {
        let operatorNegation: Fraction<Int> = -Fraction<Int>.negativeInfinity
        let methodNegation: Fraction<Int> = Fraction<Int>.negativeInfinity.negating()
        var mutatingNegation: Fraction<Int> = Fraction<Int>.negativeInfinity
        mutatingNegation.negate()

        #expect(operatorNegation == .infinity)
        #expect(methodNegation == .infinity)
        #expect(mutatingNegation == .infinity)
    }

    @Test("Negating NaN returns NaN")
    internal func negatingNaNReturnsNaN() {
        let operatorNegation: Fraction<Int> = -Fraction<Int>.nan
        let methodNegation: Fraction<Int> = Fraction<Int>.nan.negating()
        var mutatingNegation: Fraction<Int> = Fraction<Int>.nan
        mutatingNegation.negate()

        #expect(operatorNegation.isNaN == true)
        #expect(methodNegation.isNaN == true)
        #expect(mutatingNegation.isNaN == true)
    }
}
