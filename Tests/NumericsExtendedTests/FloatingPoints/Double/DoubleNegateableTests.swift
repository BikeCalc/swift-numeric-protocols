//
// DoubleNegateableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Negateable Tests")
internal struct DoubleNegateableTests {
    @Test(
        "Is negative",
        arguments: [
            (1.0, false),
            (-0.0, false),
            (0.0, false),
            (-1.0, true)
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
            (-1.0, false),
            (-0.0, false),
            (0.0, false),
            (1.0, true)
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
            (-1.0, true),
            (-0.0, true),
            (0.0, true),
            (1.0, true)
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
            (0.0, 0.0, true),
            (-0.0, 0.0, true),
            (0.0, -0.0, true),
            (-0.0, -0.0, true),
            (-1.0, 1.0, true),
            (1.0, -1.0, true)
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
        arguments: [
            0.0,
            1.0,
            -1.0,
            5.0,
            -5.0
        ]
    )
    internal func negatingTwiceReturnsOriginalValue(value: Double) {
        #expect(value.negating().negating() == value)
    }

    @Test(
        "Negating follows additive inverse rule",
        arguments: [
            0.0,
            1.0,
            -1.0,
            5.0,
            -5.0
        ]
    )
    internal func negatingFollowsAdditiveInverseRule(value: Double) {
        #expect(value + value.negating() == 0.0)
    }
}

// MARK: - Floating-Point Rules

extension DoubleNegateableTests {
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
