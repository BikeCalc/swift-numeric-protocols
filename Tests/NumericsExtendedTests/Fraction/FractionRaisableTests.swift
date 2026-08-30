// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Raisable Tests")
internal struct FractionRaisableTests {
    private static let exponentiationArguments: [(Fraction<Int>, Fraction<Int>.Exponent, Fraction<Int>)] = [
        (Fraction<Int>(2, 3), 2, Fraction<Int>(4, 9)),
        (Fraction<Int>(2, 3), 3, Fraction<Int>(8, 27)),
        (Fraction<Int>(2, 3), -2, Fraction<Int>(9, 4)),
        (Fraction<Int>(2, 3), -3, Fraction<Int>(27, 8)),
        (Fraction<Int>(-2, 3), 2, Fraction<Int>(4, 9)),
        (Fraction<Int>(-2, 3), 3, Fraction<Int>(-8, 27)),
        (Fraction<Int>(-2, 3), -2, Fraction<Int>(9, 4)),
        (Fraction<Int>(-2, 3), -3, Fraction<Int>(27, -8)),
        (Fraction<Int>(1, 1), -2, Fraction<Int>(1, 1)),
        (Fraction<Int>(1, 1), -3, Fraction<Int>(1, 1)),
        (Fraction<Int>(-1, 1), -2, Fraction<Int>(1, 1)),
        (Fraction<Int>(-1, 1), -3, Fraction<Int>(1, -1))
    ]

    private static let squaringArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(2, 3), Fraction<Int>(4, 9)),
        (Fraction<Int>(3, 4), Fraction<Int>(9, 16)),
        (Fraction<Int>(-2, 3), Fraction<Int>(4, 9)),
        (Fraction<Int>(-3, 4), Fraction<Int>(9, 16))
    ]

    private static let cubingArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(2, 3), Fraction<Int>(8, 27)),
        (Fraction<Int>(3, 4), Fraction<Int>(27, 64)),
        (Fraction<Int>(-2, 3), Fraction<Int>(-8, 27)),
        (Fraction<Int>(-3, 4), Fraction<Int>(-27, 64))
    ]

    @Test(
        "Is power of",
        arguments: [
            (Fraction<Int>(4, 1), Fraction<Int>(2, 1), true),
            (Fraction<Int>(6, 1), Fraction<Int>(2, 1), false),
            (Fraction<Int>(8, 1), Fraction<Int>(2, 1), true),
            (Fraction<Int>(9, 1), Fraction<Int>(2, 1), false)
        ]
    )
    internal func isPowerOf(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Exponentiation succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func exponentiationSucceeds(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func exponentiationEqualSucceeds(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        var runningPower: Fraction<Int> = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func raisingToSucceeds(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func raiseToSucceeds(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        var runningPower: Fraction<Int> = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: Self.squaringArguments
    )
    internal func squaredSucceeds(
        base: Fraction<Int>,
        power: Fraction<Int>
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: Self.squaringArguments
    )
    internal func squareSucceeds(
        base: Fraction<Int>,
        power: Fraction<Int>
    ) {
        var runningPower: Fraction<Int> = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: Self.cubingArguments
    )
    internal func cubedSucceeds(
        base: Fraction<Int>,
        power: Fraction<Int>
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: Self.cubingArguments
    )
    internal func cubeSucceeds(
        base: Fraction<Int>,
        power: Fraction<Int>
    ) {
        var runningPower: Fraction<Int> = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension FractionRaisableTests {
    @Test(
        "Raising to zero returns one",
        arguments: [
            Fraction<Int>(0, 1),
            Fraction<Int>(0, -2),
            Fraction<Int>(1, 1),
            Fraction<Int>(-1, 1),
            Fraction<Int>(2, 1),
            Fraction<Int>(3, 1),
            Fraction<Int>(-2, 1),
            Fraction<Int>(-3, 1)
        ]
    )
    internal func raisingToZeroReturnsOne(base: Fraction<Int>) {
        #expect(base ** .zero == 1)
    }

    @Test(
        "Raising to one preserves base",
        arguments: [
            Fraction<Int>(0, 1),
            Fraction<Int>(0, -2),
            Fraction<Int>(1, 1),
            Fraction<Int>(-1, 1),
            Fraction<Int>(2, 1),
            Fraction<Int>(3, 1),
            Fraction<Int>(-2, 1),
            Fraction<Int>(-3, 1)
        ]
    )
    internal func raisingToOnePreservesBase(base: Fraction<Int>) {
        #expect(base ** 1 == base)
    }

    @Test(
        "One base exponentiation returns one",
        arguments: [
            0,
            1,
            2,
            3,
            -2,
            -3
        ]
    )
    internal func oneBaseExponentiationReturnsOne(exponent: Fraction<Int>.Exponent) {
        #expect(Fraction<Int>(1, 1) ** exponent == .one)
    }

    @Test(
        "One base power predicate follows identity rule",
        arguments: [
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(2, 1), false)
        ]
    )
    internal func oneBasePowerPredicateFollowsIdentityRule(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: .one) == result)
    }

    @Test(
        "Negative base exponentiation follows parity rule",
        arguments: [
            (Fraction<Int>(-2, 3), 1, Fraction<Int>(-2, 3)),
            (Fraction<Int>(-2, 3), 2, Fraction<Int>(4, 9)),
            (Fraction<Int>(-2, 3), 3, Fraction<Int>(-8, 27))
        ]
    )
    internal func negativeBaseExponentiationFollowsParityRule(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative one base exponentiation follows parity rule",
        arguments: [
            (0, Fraction<Int>(1, 1)),
            (1, Fraction<Int>(-1, 1)),
            (2, Fraction<Int>(1, 1)),
            (3, Fraction<Int>(-1, 1)),
            (-2, Fraction<Int>(1, 1)),
            (-3, Fraction<Int>(1, -1))
        ]
    )
    internal func negativeOneBaseExponentiationFollowsParityRule(
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(Fraction<Int>(-1, 1) ** exponent == power)
    }

    @Test(
        "Negative base power predicate follows signed rules",
        arguments: [
            (Fraction<Int>(4, 1), Fraction<Int>(-2, 1), true),
            (Fraction<Int>(-8, 1), Fraction<Int>(-2, 1), true),
            (Fraction<Int>(6, 1), Fraction<Int>(-2, 1), false)
        ]
    )
    internal func negativeBasePowerPredicateFollowsSignedRules(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Negative one base power predicate follows signed rules",
        arguments: [
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(-1, 1), true),
            (Fraction<Int>(2, 1), false)
        ]
    )
    internal func negativeOneBasePowerPredicateFollowsSignedRules(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: Fraction<Int>(-1, 1)) == result)
    }

    @Test(
        "Negative exponent returns reciprocal power",
        arguments: [
            (Fraction<Int>(2, 1), -1, Fraction<Int>(1, 2)),
            (Fraction<Int>(2, 1), -2, Fraction<Int>(1, 4)),
            (Fraction<Int>(2, 1), -3, Fraction<Int>(1, 8))
        ]
    )
    internal func negativeExponentReturnsReciprocalPower(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Reciprocal powers are recognized",
        arguments: [
            (Fraction<Int>(1, 4), Fraction<Int>(2, 1), true),
            (Fraction<Int>(4, 1), Fraction<Int>(1, 2), true),
            (Fraction<Int>(-1, 8), Fraction<Int>(-2, 1), true),
            (Fraction<Int>(1, 8), Fraction<Int>(-2, 1), false)
        ]
    )
    internal func reciprocalPowersAreRecognized(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Negative base with negative exponent follows reciprocal parity rule",
        arguments: [
            (Fraction<Int>(-2, 1), -1, Fraction<Int>(1, -2)),
            (Fraction<Int>(-2, 1), -2, Fraction<Int>(1, 4)),
            (Fraction<Int>(-2, 1), -3, Fraction<Int>(1, -8))
        ]
    )
    internal func negativeBaseWithNegativeExponentFollowsReciprocalParityRule(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (Fraction<Int>(2, 1), 3),
            (Fraction<Int>(3, 1), 2),
            (Fraction<Int>(-2, 1), 3),
            (Fraction<Int>(2, 1), -2)
        ]
    )
    internal func exponentiationIsNotCommutative(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent
    ) {
        let power: Fraction<Int> = base ** exponent
        let reversedPower: Fraction<Int> = Fraction<Int>(exponent, 1) ** base.numerator
        #expect(power != reversedPower)
    }
}

// MARK: - Fixed-Width Integer Rules

extension FractionRaisableTests {
    @Test("Int minimum exponent uses unsigned magnitude")
    internal func intMinimumExponentUsesUnsignedMagnitude() {
        #expect(Fraction<Int>(1, 1) ** Int.min == .one)
        #expect(Fraction<Int>(-1, 1) ** Int.min == .one)
    }
}

// MARK: - Rational Rules

extension FractionRaisableTests {
    @Test(
        "Positive zero base power predicate follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), true),
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(2, 1), false),
            (Fraction<Int>.infinity, true),
            (Fraction<Int>.negativeInfinity, false)
        ]
    )
    internal func positiveZeroBasePowerPredicateFollowsRationalRules(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: .zero) == result)
    }

    @Test(
        "Negative zero base power predicate follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), true),
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(2, 1), false),
            (Fraction<Int>.infinity, true),
            (Fraction<Int>.negativeInfinity, true)
        ]
    )
    internal func negativeZeroBasePowerPredicateFollowsRationalRules(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: Fraction<Int>(0, -1)) == result)
    }

    @Test(
        "Positive infinity base power predicate follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), true),
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(2, 1), false),
            (Fraction<Int>.infinity, true),
            (Fraction<Int>.negativeInfinity, false)
        ]
    )
    internal func positiveInfinityBasePowerPredicateFollowsRationalRules(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: .infinity) == result)
    }

    @Test(
        "Negative infinity base power predicate follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), true),
            (Fraction<Int>(1, 1), true),
            (Fraction<Int>(2, 1), false),
            (Fraction<Int>.infinity, true),
            (Fraction<Int>.negativeInfinity, true)
        ]
    )
    internal func negativeInfinityBasePowerPredicateFollowsRationalRules(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isPower(of: .negativeInfinity) == result)
    }

    @Test("NaN power predicate follows rational rules")
    internal func nanPowerPredicateFollowsRationalRules() {
        #expect(Fraction<Int>(1, 1).isPower(of: .nan) == true)
        #expect(Fraction<Int>(2, 1).isPower(of: .nan) == false)
        #expect(Fraction<Int>.nan.isPower(of: Fraction<Int>(2, 1)) == false)
    }

    @Test(
        "Positive zero base exponentiation follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), 0, Fraction<Int>(1, 1)),
            (Fraction<Int>(0, 1), 1, Fraction<Int>(0, 1)),
            (Fraction<Int>(0, 1), 2, Fraction<Int>(0, 1)),
            (Fraction<Int>(0, 1), -1, Fraction<Int>.infinity)
        ]
    )
    internal func positiveZeroBaseExponentiationFollowsRationalRules(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative zero exponentiation follows parity rule",
        arguments: [
            (Fraction<Int>(0, -1), 0, Fraction<Int>(1, 1)),
            (Fraction<Int>(0, -1), 1, Fraction<Int>(0, -1)),
            (Fraction<Int>(0, -1), 2, Fraction<Int>(0, 1)),
            (Fraction<Int>(0, -1), -1, Fraction<Int>.negativeInfinity),
            (Fraction<Int>(0, -1), -2, Fraction<Int>.infinity)
        ]
    )
    internal func negativeZeroExponentiationFollowsParityRule(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "NaN raised to nonzero exponent returns NaN",
        arguments: [
            (Fraction<Int>.nan, 1),
            (Fraction<Int>.nan, 2),
            (Fraction<Int>.nan, -1)
        ]
    )
    internal func nanRaisedToNonzeroExponentReturnsNaN(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent
    ) {
        #expect((base ** exponent).isNaN == true)
    }

    @Test("NaN raised to zero returns one")
    internal func nanRaisedToZeroReturnsOne() {
        let power: Fraction<Int> = .nan ** .zero

        #expect(power == .one)
    }

    @Test(
        "Positive infinity exponentiation follows reciprocal rules",
        arguments: [
            (Fraction<Int>.infinity, 0, Fraction<Int>(1, 1)),
            (Fraction<Int>.infinity, 1, Fraction<Int>.infinity),
            (Fraction<Int>.infinity, -1, Fraction<Int>(0, 1))
        ]
    )
    internal func positiveInfinityExponentiationFollowsReciprocalRules(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative infinity exponentiation follows parity rule",
        arguments: [
            (Fraction<Int>.negativeInfinity, 0, Fraction<Int>(1, 1)),
            (Fraction<Int>.negativeInfinity, 1, Fraction<Int>.negativeInfinity),
            (Fraction<Int>.negativeInfinity, 2, Fraction<Int>.infinity),
            (Fraction<Int>.negativeInfinity, -1, Fraction<Int>(0, -1)),
            (Fraction<Int>.negativeInfinity, -2, Fraction<Int>(0, 1))
        ]
    )
    internal func negativeInfinityExponentiationFollowsParityRule(
        base: Fraction<Int>,
        exponent: Fraction<Int>.Exponent,
        power: Fraction<Int>
    ) {
        #expect(base ** exponent == power)
    }
}
