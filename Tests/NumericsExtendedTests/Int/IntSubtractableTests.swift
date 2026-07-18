//
// IntSubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Subtractable Tests")
internal struct IntSubtractableTests {
    @Test(
        "Subtraction succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2),
            (-6, 4, -10),
            (6, -4, 10)
        ]
    )
    internal func subtractionSucceeds(
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2),
            (-6, 4, -10),
            (6, -4, 10)
        ]
    )
    internal func subtractionEqualSucceeds(
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        var runningDifference: Int = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2),
            (-6, 4, -10),
            (6, -4, 10)
        ]
    )
    internal func subtractingSucceeds(
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2),
            (-6, 4, -10),
            (6, -4, 10)
        ]
    )
    internal func subtractSucceeds(
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        var runningDifference: Int = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension IntSubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            (0, 0),
            (1, 1),
            (-1, -1)
        ]
    )
    internal func subtractingZeroPreservesMinuend(
        minuend: Int,
        difference: Int
    ) {
        #expect(minuend - 0 == difference)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            0,
            1,
            -1,
            5,
            -5
        ]
    )
    internal func subtractingSelfReturnsZero(value: Int) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtracting negative value adds opposite",
        arguments: [
            (6, -4, 10),
            (-6, -4, -2),
            (0, -4, 4)
        ]
    )
    internal func subtractingNegativeValueAddsOpposite(
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        #expect(minuend - subtrahend == difference)
    }
}
