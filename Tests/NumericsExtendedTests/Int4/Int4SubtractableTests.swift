//
// Int4SubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Subtractable Tests")
internal struct Int4SubtractableTests {
    @Test(
        "Subtraction succeeds",
        arguments: [
            (6, 4, 2),
            (-6, -4, -2),
            (3, -2, 5)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func subtractionSucceeds(
        minuend: Int4,
        subtrahend: Int4,
        difference: Int4
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: [
            (6, 4, 2),
            (-6, -4, -2),
            (3, -2, 5)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func subtractionEqualSucceeds(
        minuend: Int4,
        subtrahend: Int4,
        difference: Int4
    ) {
        var runningDifference: Int4 = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: [
            (6, 4, 2),
            (-6, -4, -2),
            (3, -2, 5)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func subtractingSucceeds(
        minuend: Int4,
        subtrahend: Int4,
        difference: Int4
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: [
            (6, 4, 2),
            (-6, -4, -2),
            (3, -2, 5)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func subtractSucceeds(
        minuend: Int4,
        subtrahend: Int4,
        difference: Int4
    ) {
        var runningDifference: Int4 = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension Int4SubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            (0, 0),
            (1, 1),
            (-1, -1)
        ] as Array<(Int4, Int4)>
    )
    internal func subtractingZeroPreservesMinuend(
        minuend: Int4,
        difference: Int4
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
        ] as Array<Int4>
    )
    internal func subtractingSelfReturnsZero(value: Int4) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtracting negative value adds opposite",
        arguments: [
            (3, -2, 5),
            (-6, -4, -2),
            (0, -4, 4)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func subtractingNegativeValueAddsOpposite(
        minuend: Int4,
        subtrahend: Int4,
        difference: Int4
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: [
            (3, 2),
            (-3, 2),
            (3, -2)
        ] as Array<(Int4, Int4)>
    )
    internal func subtractionIsNotCommutative(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs - rhs != rhs - lhs)
    }
}
