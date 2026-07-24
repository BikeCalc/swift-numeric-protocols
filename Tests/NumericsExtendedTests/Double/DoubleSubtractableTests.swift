//
// DoubleSubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Subtractable Tests")
internal struct DoubleSubtractableTests {
    private static let subtractionArguments: [(Double, Double, Double)] = [
        (3.0, 2.0, 1.0),
        (5.0, 3.0, 2.0),
        (-3.0, 2.0, -5.0),
        (-5.0, -3.0, -2.0),
        (1.5, 0.5, 1.0),
        (3.5, 1.5, 2.0),
        (-1.5, 0.5, -2.0),
        (-3.5, -1.5, -2.0)
    ]

    @Test(
        "Subtraction succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractionSucceeds(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractionEqualSucceeds(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        var runningDifference: Double = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractingSucceeds(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractSucceeds(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        var runningDifference: Double = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension DoubleSubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            3.0,
            5.0,
            -3.0,
            -5.0,
            1.5,
            3.5,
            -1.5,
            -3.5
        ]
    )
    internal func subtractingZeroPreservesMinuend(minuend: Double) {
        #expect(minuend - 0.0 == minuend)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            3.0,
            5.0,
            -3.0,
            -5.0,
            1.5,
            3.5,
            -1.5,
            -3.5
        ]
    )
    internal func subtractingSelfReturnsZero(value: Double) {
        #expect(value - value == 0.0)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: Double,
        subtrahend: Double,
        difference _: Double
    ) {
        #expect(minuend - subtrahend != subtrahend - minuend)
    }
}

// MARK: - Floating-Point Rules

extension DoubleSubtractableTests {
    @Test(
        "Subtracting zero follows floating-point rules",
        arguments: [
            (0.0, 0.0, 0.0),
            (-0.0, 0.0, -0.0),
            (0.0, -0.0, 0.0),
            (-0.0, -0.0, 0.0),
            (2.0, 0.0, 2.0),
            (-2.0, 0.0, -2.0),
            (0.5, 0.0, 0.5),
            (-0.5, 0.0, -0.5)
        ]
    )
    internal func subtractingZeroFollowsFloatingPointRules(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtracting infinity follows floating-point rules",
        arguments: [
            (Double.infinity, Double.negativeInfinity, Double.infinity),
            (Double.negativeInfinity, Double.infinity, Double.negativeInfinity),
            (Double.infinity, 1.0, Double.infinity),
            (Double.negativeInfinity, 1.0, Double.negativeInfinity),
            (1.0, Double.infinity, Double.negativeInfinity),
            (1.0, Double.negativeInfinity, Double.infinity)
        ]
    )
    internal func subtractingInfinityFollowsFloatingPointRules(
        minuend: Double,
        subtrahend: Double,
        difference: Double
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtracting matching infinities returns NaN",
        arguments: [
            (Double.infinity, Double.infinity),
            (Double.negativeInfinity, Double.negativeInfinity)
        ]
    )
    internal func subtractingMatchingInfinitiesReturnsNaN(
        minuend: Double,
        subtrahend: Double
    ) {
        #expect((minuend - subtrahend).isNaN)
    }

    @Test(
        "Subtracting NaN returns NaN",
        arguments: [
            (Double.nan, Double.nan),
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.infinity)
        ]
    )
    internal func subtractingNaNReturnsNaN(
        minuend: Double,
        subtrahend: Double
    ) {
        #expect((minuend - subtrahend).isNaN)
    }
}
