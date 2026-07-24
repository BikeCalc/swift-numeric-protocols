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
    private static let subtractionArguments: [(UInt4, UInt4, UInt4)] = [
        (3, 2, 1),
        (5, 3, 2)
    ]

    @Test(
        "Subtraction succeeds",
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
            3,
            5
        ] as Array<UInt4>
    )
    internal func subtractingZeroPreservesMinuend(minuend: UInt4) {
        #expect(minuend - 0 == minuend)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            3,
            5
        ] as Array<UInt4>
    )
    internal func subtractingSelfReturnsZero(value: UInt4) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: UInt4,
        subtrahend: UInt4,
        difference: UInt4
    ) {
        let reversedDifferenceReport: UInt4.Report = subtrahend.subtractingReportingOverflow(minuend)

        #expect(minuend - subtrahend == difference)
        #expect(reversedDifferenceReport.partialValue != difference)
        #expect(reversedDifferenceReport.overflow)
    }
}
