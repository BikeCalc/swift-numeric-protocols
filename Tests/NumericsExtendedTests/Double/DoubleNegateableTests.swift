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
        #expect(value + value.negating() == Double.zero)
    }

    @Test("One and negative one are opposites")
    internal func oneAndNegativeOneAreOpposites() {
        #expect(1.0.isOpposite(of: -1.0) == true)
        #expect((-1.0).isOpposite(of: 1.0) == true)
        #expect(1.0.negating() == -1.0)
        #expect((-1.0).negating() == 1.0)
    }
}

// MARK: - Floating-Point Rules

extension DoubleNegateableTests {
    @Test("Positive zero sign predicates follow floating-point rules")
    internal func positiveZeroSignPredicatesFollowFloatingPointRules() {
        let value: Double = .zero

        #expect(value.isNegative == false)
        #expect(value.isPositive == false)
        #expect(value.isSigned == true)
    }

    @Test("Negative zero sign predicates follow floating-point rules")
    internal func negativeZeroSignPredicatesFollowFloatingPointRules() {
        let value: Double = -Double.zero

        #expect(value.isNegative == false)
        #expect(value.isPositive == false)
        #expect(value.isSigned == true)
    }

    @Test(
        "Positive zero opposite follows floating-point rules",
        arguments: [
            Double.zero,
            -Double.zero
        ]
    )
    internal func positiveZeroOppositeFollowsFloatingPointRules(other: Double) {
        #expect(Double.zero.isOpposite(of: other) == true)
    }

    @Test(
        "Negative zero opposite follows floating-point rules",
        arguments: [
            Double.zero,
            -Double.zero
        ]
    )
    internal func negativeZeroOppositeFollowsFloatingPointRules(other: Double) {
        #expect((-Double.zero).isOpposite(of: other) == true)
    }

    @Test("Negating positive zero follows floating-point rules")
    internal func negatingPositiveZeroFollowsFloatingPointRules() {
        let operatorNegation: Double = -Double.zero
        let methodNegation: Double = Double.zero.negating()
        var mutatingNegation: Double = Double.zero
        mutatingNegation.negate()

        #expect(operatorNegation == .zero)
        #expect(operatorNegation.sign == .minus)
        #expect(methodNegation == .zero)
        #expect(methodNegation.sign == .minus)
        #expect(mutatingNegation == .zero)
        #expect(mutatingNegation.sign == .minus)
    }

    @Test("Negating negative zero follows floating-point rules")
    internal func negatingNegativeZeroFollowsFloatingPointRules() {
        let operatorNegation: Double = -Double.negativeZero
        let methodNegation: Double = Double.negativeZero.negating()
        var mutatingNegation: Double = Double.negativeZero
        mutatingNegation.negate()

        #expect(operatorNegation == .zero)
        #expect(operatorNegation.sign == .plus)
        #expect(methodNegation == .zero)
        #expect(methodNegation.sign == .plus)
        #expect(mutatingNegation == .zero)
        #expect(mutatingNegation.sign == .plus)
    }

    @Test("Negating positive infinity follows floating-point rules")
    internal func negatingPositiveInfinityFollowsFloatingPointRules() {
        let operatorNegation: Double = -Double.infinity
        let methodNegation: Double = Double.infinity.negating()
        var mutatingNegation: Double = Double.infinity
        mutatingNegation.negate()

        #expect(operatorNegation == .negativeInfinity)
        #expect(methodNegation == .negativeInfinity)
        #expect(mutatingNegation == .negativeInfinity)
    }

    @Test("Negating negative infinity follows floating-point rules")
    internal func negatingNegativeInfinityFollowsFloatingPointRules() {
        let operatorNegation: Double = -Double.negativeInfinity
        let methodNegation: Double = Double.negativeInfinity.negating()
        var mutatingNegation: Double = Double.negativeInfinity
        mutatingNegation.negate()

        #expect(operatorNegation == .infinity)
        #expect(methodNegation == .infinity)
        #expect(mutatingNegation == .infinity)
    }

    @Test("Negating NaN returns NaN")
    internal func negatingNaNReturnsNaN() {
        let operatorNegation: Double = -Double.nan
        let methodNegation: Double = Double.nan.negating()
        var mutatingNegation: Double = Double.nan
        mutatingNegation.negate()

        #expect(operatorNegation.isNaN == true)
        #expect(methodNegation.isNaN == true)
        #expect(mutatingNegation.isNaN == true)
    }
}
