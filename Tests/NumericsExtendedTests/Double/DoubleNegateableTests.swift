// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Negateable Tests")
internal struct DoubleNegateableTests {
    private static let negationArguments: Array<(Double, Double)> = [
        (1.0, -1.0),
        (-1.0, 1.0),
        (5.0, -5.0),
        (-5.0, 5.0),
        (0.5, -0.5),
        (-0.5, 0.5),
        (1.5, -1.5),
        (-1.5, 1.5)
    ]

    private static let additiveInverseArguments: Array<Double> = [
        0.0,
        -0.0,
        1.0,
        -1.0,
        5.0,
        -5.0,
        0.5,
        -0.5,
        1.5,
        -1.5
    ]

    @Test(
        "Negation succeeds",
        arguments: Self.negationArguments
    )
    internal func negationSucceeds(
        value: Double,
        negation: Double
    ) {
        #expect(-value == negation)
    }

    @Test(
        "Negating succeeds",
        arguments: Self.negationArguments
    )
    internal func negatingSucceeds(
        value: Double,
        negation: Double
    ) {
        #expect(value.negating() == negation)
    }

    @Test(
        "Negate succeeds",
        arguments: Self.negationArguments
    )
    internal func negateSucceeds(
        value: Double,
        negation: Double
    ) {
        var runningValue: Double = value
        runningValue.negate()
        #expect(runningValue == negation)
    }

    @Test(
        "Is negative",
        arguments: [
            (1.0, false),
            (-1.0, true),
            (5.0, false),
            (-5.0, true),
            (0.5, false),
            (-0.5, true),
            (1.5, false),
            (-1.5, true)
        ]
    )
    internal func isNegative(
        value: Double,
        result: Bool
    ) {
        #expect(value.isNegative == result)
    }

    @Test(
        "Is positive",
        arguments: [
            (1.0, true),
            (-1.0, false),
            (5.0, true),
            (-5.0, false),
            (0.5, true),
            (-0.5, false),
            (1.5, true),
            (-1.5, false)
        ]
    )
    internal func isPositive(
        value: Double,
        result: Bool
    ) {
        #expect(value.isPositive == result)
    }

    @Test(
        "Is signed",
        arguments: [
            (1.0, true),
            (-1.0, true),
            (5.0, true),
            (-5.0, true),
            (0.5, true),
            (-0.5, true),
            (1.5, true),
            (-1.5, true)
        ]
    )
    internal func isSigned(
        value: Double,
        result: Bool
    ) {
        #expect(value.isSigned == result)
    }

    @Test(
        "Is opposite",
        arguments: [
            (1.0, 1.0, false),
            (-1.0, -1.0, false),
            (-1.0, 1.0, true),
            (1.0, -1.0, true),
            (0.5, 0.5, false),
            (-0.5, -0.5, false),
            (-0.5, 0.5, true),
            (0.5, -0.5, true)
        ]
    )
    internal func isOpposite(
        value: Double,
        other: Double,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }
}

// MARK: - Arithmetic Rules

extension DoubleNegateableTests {
    @Test(
        "Negating twice returns original value",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingTwiceReturnsOriginalValue(value: Double) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: Self.additiveInverseArguments
    )
    internal func negatingFollowsAdditiveInverseRule(value: Double) {
        #expect(value + value.negating() == 0.0)
    }

    @Test("One and negative one are opposites")
    internal func oneAndNegativeOneAreOpposites() {
        #expect(1.0.isOpposite(of: -1.0))
        #expect((-1.0).isOpposite(of: 1.0))
        #expect(1.0.negating() == -1.0)
        #expect((-1.0).negating() == 1.0)
    }
}

// MARK: - Floating-Point Rules

extension DoubleNegateableTests {
    @Test(
        "Zero sign predicates follow floating-point rules",
        arguments: [
            (0.0, false, false, true),
            (-0.0, false, false, true)
        ]
    )
    internal func zeroSignPredicatesFollowFloatingPointRules(
        value: Double,
        isNegative: Bool,
        isPositive: Bool,
        isSigned: Bool
    ) {
        #expect(value.isNegative == isNegative)
        #expect(value.isPositive == isPositive)
        #expect(value.isSigned == isSigned)
    }

    @Test(
        "Zero opposite follows floating-point rules",
        arguments: [
            (0.0, 0.0, true),
            (-0.0, 0.0, true),
            (0.0, -0.0, true),
            (-0.0, -0.0, true)
        ]
    )
    internal func zeroOppositeFollowsFloatingPointRules(
        value: Double,
        other: Double,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }

    @Test(
        "Negating zero follows floating-point rules",
        arguments: [
            (0.0, -0.0),
            (-0.0, 0.0)
        ]
    )
    internal func negatingZeroFollowsFloatingPointRules(
        value: Double,
        result: Double
    ) {
        #expect(value.negating() == result)
    }

    @Test(
        "Negating zero flips sign",
        arguments: [
            (0.0, FloatingPointSign.minus),
            (-0.0, FloatingPointSign.plus)
        ]
    )
    internal func negatingZeroFlipsSign(
        value: Double,
        sign: FloatingPointSign
    ) {
        let negatedValue: Double = value.negating()

        #expect(negatedValue == 0.0)
        #expect(negatedValue.sign == sign)
    }

    @Test(
        "Negating infinity follows floating-point rules",
        arguments: [
            (Double.infinity, Double.negativeInfinity),
            (Double.negativeInfinity, Double.infinity)
        ]
    )
    internal func negatingInfinityFollowsFloatingPointRules(
        value: Double,
        result: Double
    ) {
        #expect(value.negating() == result)
    }

    @Test("Negating NaN returns NaN")
    internal func negatingNaNReturnsNaN() {
        #expect(Double.nan.negating().isNaN)
    }
}
