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
    private static let subtractionArguments: [(Int4, Int4, Int4)] = [
        (3, 2, 1),
        (5, 3, 2),
        (-3, 2, -5),
        (-5, -3, -2)
    ]

    @Test(
        "Subtraction succeeds",
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
            3,
            5,
            -3,
            -5
        ] as Array<Int4>
    )
    internal func subtractingZeroPreservesMinuend(minuend: Int4) {
        #expect(minuend - 0 == minuend)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            3,
            5,
            -3,
            -5
        ] as Array<Int4>
    )
    internal func subtractingSelfReturnsZero(value: Int4) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: Int4,
        subtrahend: Int4,
        difference _: Int4
    ) {
        #expect(minuend - subtrahend != subtrahend - minuend)
    }
}
