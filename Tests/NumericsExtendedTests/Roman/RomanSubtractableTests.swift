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
    private static let subtractionArguments: [(Roman, Roman, Roman)] = [
        (3, 2, 1),
        (5, 3, 2)
    ]

    @Test(
        "Subtraction succeeds",
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
            3,
            5
        ] as Array<Roman>
    )
    internal func subtractingZeroPreservesMinuend(minuend: Roman) {
        #expect(minuend - 0 == minuend)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            3,
            5
        ] as Array<Roman>
    )
    internal func subtractingSelfReturnsZero(value: Roman) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: Roman,
        subtrahend: Roman,
        difference: Roman
    ) {
        let reversedDifferenceReport: Roman.Report = subtrahend.subtractingReportingOverflow(minuend)

        #expect(minuend - subtrahend == difference)
        #expect(reversedDifferenceReport.partialValue != difference)
        #expect(reversedDifferenceReport.overflow)
    }
}
