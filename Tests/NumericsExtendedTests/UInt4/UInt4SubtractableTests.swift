//
// UInt4SubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Subtractable Tests")
internal struct UInt4SubtractableTests {
    @Test(
        "Subtraction succeeds",
        arguments: [
            (6, 4, 2),
            (9, 3, 6)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func subtractionSucceeds(
        minuend: UInt4,
        subtrahend: UInt4,
        difference: UInt4
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: [
            (6, 4, 2),
            (9, 3, 6)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func subtractionEqualSucceeds(
        minuend: UInt4,
        subtrahend: UInt4,
        difference: UInt4
    ) {
        var runningDifference: UInt4 = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: [
            (6, 4, 2),
            (9, 3, 6)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func subtractingSucceeds(
        minuend: UInt4,
        subtrahend: UInt4,
        difference: UInt4
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: [
            (6, 4, 2),
            (9, 3, 6)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func subtractSucceeds(
        minuend: UInt4,
        subtrahend: UInt4,
        difference: UInt4
    ) {
        var runningDifference: UInt4 = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension UInt4SubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            (0, 0),
            (1, 1)
        ] as Array<(UInt4, UInt4)>
    )
    internal func subtractingZeroPreservesMinuend(
        minuend: UInt4,
        difference: UInt4
    ) {
        #expect(minuend - 0 == difference)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            0,
            1
        ] as Array<UInt4>
    )
    internal func subtractingSelfReturnsZero(value: UInt4) {
        #expect(value - value == 0)
    }
}
