//
// DoubleRaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Raisable Tests")
internal struct DoubleRaisableTests {
    private static let exponentiationArguments: [(Double, Double.Exponent, Double)] = [
        (2.0, 2, 4.0),
        (2.0, 3, 8.0),
        (-2.0, 2, 4.0),
        (-2.0, 3, -8.0),
        (0.5, 2, 0.25),
        (0.5, 3, 0.125),
        (-0.5, 2, 0.25),
        (-0.5, 3, -0.125)
    ]

    private static let squaringArguments: [(Double, Double)] = [
        (2.0, 4.0),
        (3.0, 9.0),
        (-2.0, 4.0),
        (-3.0, 9.0),
        (0.5, 0.25),
        (1.5, 2.25),
        (-0.5, 0.25),
        (-1.5, 2.25)
    ]

    private static let cubingArguments: [(Double, Double)] = [
        (2.0, 8.0),
        (3.0, 27.0),
        (-2.0, -8.0),
        (-3.0, -27.0),
        (0.5, 0.125),
        (1.5, 3.375),
        (-0.5, -0.125),
        (-1.5, -3.375)
    ]

    @Test(
        "Is power of",
        arguments: [
            (4.0, 2.0, true),
            (6.0, 2.0, false),
            (8.0, 2.0, true),
            (9.0, 2.0, false)
        ]
    )
    internal func isPowerOf(
        value: Double,
        other: Double,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Exponentiation succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func exponentiationSucceeds(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func exponentiationEqualSucceeds(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        var runningPower: Double = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func raisingToSucceeds(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: Self.exponentiationArguments
    )
    internal func raiseToSucceeds(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        var runningPower: Double = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: Self.squaringArguments
    )
    internal func squaredSucceeds(
        base: Double,
        power: Double
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: Self.squaringArguments
    )
    internal func squareSucceeds(
        base: Double,
        power: Double
    ) {
        var runningPower: Double = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: Self.cubingArguments
    )
    internal func cubedSucceeds(
        base: Double,
        power: Double
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: Self.cubingArguments
    )
    internal func cubeSucceeds(
        base: Double,
        power: Double
    ) {
        var runningPower: Double = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension DoubleRaisableTests {
    @Test(
        "Raising to one preserves base",
        arguments: [
            2.0,
            3.0,
            -2.0,
            -3.0,
            0.5,
            1.5,
            -0.5,
            -1.5
        ]
    )
    internal func raisingToOnePreservesBase(base: Double) {
        #expect(base ** 1 == base)
    }

    @Test(
        "One base exponentiation returns one",
        arguments: [
            0,
            1,
            2,
            3
        ]
    )
    internal func oneBaseExponentiationReturnsOne(exponent: Double.Exponent) {
        #expect(1.0 ** exponent == 1.0)
    }

    @Test(
        "One base power predicate follows identity rule",
        arguments: [
            (1.0, true),
            (2.0, false)
        ]
    )
    internal func oneBasePowerPredicateFollowsIdentityRule(
        value: Double,
        result: Bool
    ) {
        #expect(value.isPower(of: 1.0) == result)
    }

    @Test(
        "Negative base exponentiation follows parity rule",
        arguments: [
            (-2.0, 1, -2.0),
            (-2.0, 2, 4.0),
            (-2.0, 3, -8.0)
        ]
    )
    internal func negativeBaseExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative one base exponentiation follows parity rule",
        arguments: [
            (0, 1.0),
            (1, -1.0),
            (2, 1.0),
            (3, -1.0)
        ]
    )
    internal func negativeOneBaseExponentiationFollowsParityRule(
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect((-1.0) ** exponent == power)
    }

    @Test(
        "Negative base power predicate follows signed rules",
        arguments: [
            (4.0, -2.0, true),
            (-8.0, -2.0, true),
            (6.0, -2.0, false)
        ]
    )
    internal func negativeBasePowerPredicateFollowsSignedRules(
        value: Double,
        other: Double,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Negative one base power predicate follows signed rules",
        arguments: [
            (1.0, true),
            (-1.0, true),
            (2.0, false)
        ]
    )
    internal func negativeOneBasePowerPredicateFollowsSignedRules(
        value: Double,
        result: Bool
    ) {
        #expect(value.isPower(of: -1.0) == result)
    }

    @Test(
        "Negative exponent returns reciprocal power",
        arguments: [
            (2.0, -1, 0.5),
            (2.0, -2, 0.25),
            (2.0, -3, 0.125)
        ]
    )
    internal func negativeExponentReturnsReciprocalPower(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative base with negative exponent follows reciprocal parity rule",
        arguments: [
            (-2.0, -1, -0.5),
            (-2.0, -2, 0.25),
            (-2.0, -3, -0.125)
        ]
    )
    internal func negativeBaseWithNegativeExponentFollowsReciprocalParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (2.0, 3),
            (3.0, 2),
            (0.5, 2),
            (2.0, -2)
        ]
    )
    internal func exponentiationIsNotCommutative(
        base: Double,
        exponent: Double.Exponent
    ) {
        let power: Double = base ** exponent
        let reversedPower: Double = Double(exponent) ** Double.Exponent(base)
        #expect(power != reversedPower)
    }
}

// MARK: - Floating-Point Rules

extension DoubleRaisableTests {
    @Test(
        "Zero base power predicate follows floating-point rules",
        arguments: [
            (0.0, true),
            (-0.0, true),
            (1.0, false),
            (2.0, false)
        ]
    )
    internal func zeroBasePowerPredicateFollowsFloatingPointRules(
        value: Double,
        result: Bool
    ) {
        #expect(value.isPower(of: 0.0) == result)
    }

    @Test(
        "Zero base exponentiation follows floating-point rules",
        arguments: [
            (0.0, 0, 1.0),
            (0.0, 1, 0.0),
            (0.0, -1, Double.infinity)
        ]
    )
    internal func zeroBaseExponentiationFollowsFloatingPointRules(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative zero exponentiation follows parity rule",
        arguments: [
            (-0.0, 0, 1.0),
            (-0.0, 1, -0.0),
            (-0.0, 2, 0.0),
            (-0.0, -1, -Double.infinity),
            (-0.0, -2, Double.infinity)
        ]
    )
    internal func negativeZeroExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative zero exponentiation preserves negative zero sign",
        arguments: [
            (-0.0, 1),
            (-0.0, 3)
        ]
    )
    internal func negativeZeroExponentiationPreservesNegativeZeroSign(
        base: Double,
        exponent: Double.Exponent
    ) {
        let power: Double = base ** exponent

        #expect(power == 0.0)
        #expect(power.sign == .minus)
    }

    @Test(
        "NaN raised to nonzero exponent returns NaN",
        arguments: [
            (Double.nan, -1),
            (Double.nan, 1),
            (Double.nan, 2)
        ]
    )
    internal func nanRaisedToNonzeroExponentReturnsNaN(
        base: Double,
        exponent: Double.Exponent
    ) {
        #expect((base ** exponent).isNaN)
    }

    @Test("NaN raised to zero returns one")
    internal func nanRaisedToZeroReturnsOne() {
        let power: Double = Double.nan ** 0

        #expect(power == 1.0)
    }

    @Test(
        "Positive infinity exponentiation follows reciprocal rules",
        arguments: [
            (Double.infinity, 0, 1.0),
            (Double.infinity, 1, Double.infinity),
            (Double.infinity, -1, 0.0)
        ]
    )
    internal func positiveInfinityExponentiationFollowsReciprocalRules(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative infinity exponentiation follows parity rule",
        arguments: [
            (Double.negativeInfinity, 0, 1.0),
            (Double.negativeInfinity, 1, Double.negativeInfinity),
            (Double.negativeInfinity, 2, Double.infinity),
            (Double.negativeInfinity, -1, -0.0),
            (Double.negativeInfinity, -2, 0.0)
        ]
    )
    internal func negativeInfinityExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative infinity exponentiation preserves negative zero sign",
        arguments: [
            (Double.negativeInfinity, -1),
            (Double.negativeInfinity, -3)
        ]
    )
    internal func negativeInfinityExponentiationPreservesNegativeZeroSign(
        base: Double,
        exponent: Double.Exponent
    ) {
        let power: Double = base ** exponent

        #expect(power == 0.0)
        #expect(power.sign == .minus)
    }
}
