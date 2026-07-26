// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int Subtractable Tests")
internal struct IntSubtractableTests {
    private static let subtractionArguments: [(Int, Int, Int)] = [
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
        minuend: Int,
        subtrahend: Int,
        difference: Int
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
        arguments: Self.subtractionArguments
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
            3,
            5,
            -3,
            -5
        ]
    )
    internal func subtractingZeroPreservesMinuend(minuend: Int) {
        #expect(minuend - 0 == minuend)
    }

    @Test(
        "Subtracting self returns zero",
        arguments: [
            3,
            5,
            -3,
            -5
        ]
    )
    internal func subtractingSelfReturnsZero(value: Int) {
        #expect(value - value == 0)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: Int,
        subtrahend: Int,
        difference _: Int
    ) {
        #expect(minuend - subtrahend != subtrahend - minuend)
    }
}
