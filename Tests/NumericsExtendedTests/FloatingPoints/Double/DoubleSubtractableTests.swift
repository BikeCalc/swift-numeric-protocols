//
// DoubleSubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Subtractable")
internal struct DoubleSubtractableTests {
    @Test(
        "Subtraction succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (6.0, 4.0, 2.0),
            (-6.0, 4.0, -10.0),
            (6.0, -4.0, 10.0)
        ]
    )
    internal func subtractionSucceeds(minuend: Double, subtrahend: Double, difference: Double) {
        #expect(minuend - subtrahend == difference)
    }
    
    @Test(
        "Subtraction equal succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (6.0, 4.0, 2.0),
            (-6.0, 4.0, -10.0),
            (6.0, -4.0, 10.0)
        ]
    )
    internal func subtractionEqualSucceeds(minuend: Double, subtrahend: Double, difference: Double) {
        var runningDifference: Double = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }
    
    @Test(
        "Subtracting succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (6.0, 4.0, 2.0),
            (-6.0, 4.0, -10.0),
            (6.0, -4.0, 10.0)
        ]
    )
    internal func subtractingSucceeds(minuend: Double, subtrahend: Double, difference: Double) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }
    
    @Test(
        "Subtract succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (6.0, 4.0, 2.0),
            (-6.0, 4.0, -10.0),
            (6.0, -4.0, 10.0)
        ]
    )
    internal func subtractSucceeds(minuend: Double, subtrahend: Double, difference: Double) {
        var runningDifference: Double = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Rules

extension DoubleSubtractableTests {
    @Test(
        "Subtracting zero follows floating-point rules",
        arguments: [
            (0.0, 0.0, 0.0),
            (-0.0, 0.0, -0.0),
            (1.0, 0.0, 1.0),
            (-1.0, 0.0, -1.0)
        ]
    )
    internal func subtractingZeroFollowsFloatingPointRules(minuend: Double, subtrahend: Double, difference: Double) {
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
    internal func subtractingMatchingInfinitiesReturnsNaN(minuend: Double, subtrahend: Double) {
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
    internal func subtractingNaNReturnsNaN(minuend: Double, subtrahend: Double) {
        #expect((minuend - subtrahend).isNaN)
    }
}
