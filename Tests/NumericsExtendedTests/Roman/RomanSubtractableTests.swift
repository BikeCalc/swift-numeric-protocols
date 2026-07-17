//
// RomanSubtractableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Subtractable Tests")
internal struct RomanSubtractableTests {
    @Test(
        "Subtraction succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func subtractionSucceeds(
        minuend: Roman,
        subtrahend: Roman,
        difference: Roman
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func subtractionEqualSucceeds(
        minuend: Roman,
        subtrahend: Roman,
        difference: Roman
    ) {
        var runningDifference: Roman = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func subtractingSucceeds(
        minuend: Roman,
        subtrahend: Roman,
        difference: Roman
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: [
            (0, 0, 0),
            (6, 4, 2)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func subtractSucceeds(
        minuend: Roman,
        subtrahend: Roman,
        difference: Roman
    ) {
        var runningDifference: Roman = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension RomanSubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            (0, 0),
            (1, 1)
        ] as Array<(Roman, Roman)>
    )
    internal func subtractingZeroPreservesMinuend(
        minuend: Roman,
        difference: Roman
    ) {
        #expect(minuend - 0 == difference)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            0,
            1,
            5
        ] as Array<Roman>
    )
    internal func subtractingSelfReturnsZero(value: Roman) {
        #expect(value - value == 0)
    }
}
