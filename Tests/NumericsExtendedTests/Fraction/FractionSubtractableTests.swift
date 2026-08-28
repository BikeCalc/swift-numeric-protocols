// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Subtractable Tests")
internal struct FractionSubtractableTests {
    private static let subtractionArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(2, 3), Fraction<Int>(1, 2), Fraction<Int>(1, 6)),
        (Fraction<Int>(3, 4), Fraction<Int>(1, 2), Fraction<Int>(2, 8)),
        (Fraction<Int>(-2, 3), Fraction<Int>(1, 2), Fraction<Int>(-7, 6)),
        (Fraction<Int>(-3, 4), Fraction<Int>(-1, 2), Fraction<Int>(-2, 8))
    ]

    @Test(
        "Subtraction succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractionSucceeds(
        minuend: Fraction<Int>,
        subtrahend: Fraction<Int>,
        difference: Fraction<Int>
    ) {
        #expect(minuend - subtrahend == difference)
    }

    @Test(
        "Subtraction equal succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractionEqualSucceeds(
        minuend: Fraction<Int>,
        subtrahend: Fraction<Int>,
        difference: Fraction<Int>
    ) {
        var runningDifference: Fraction<Int> = minuend
        runningDifference -= subtrahend
        #expect(runningDifference == difference)
    }

    @Test(
        "Subtracting succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractingSucceeds(
        minuend: Fraction<Int>,
        subtrahend: Fraction<Int>,
        difference: Fraction<Int>
    ) {
        #expect(minuend.subtracting(subtrahend) == difference)
    }

    @Test(
        "Subtract succeeds",
        arguments: Self.subtractionArguments
    )
    internal func subtractSucceeds(
        minuend: Fraction<Int>,
        subtrahend: Fraction<Int>,
        difference: Fraction<Int>
    ) {
        var runningDifference: Fraction<Int> = minuend
        runningDifference.subtract(subtrahend)
        #expect(runningDifference == difference)
    }
}

// MARK: - Arithmetic Rules

extension FractionSubtractableTests {
    @Test(
        "Subtracting zero preserves minuend",
        arguments: [
            Fraction<Int>(2, 3),
            Fraction<Int>(3, 4),
            Fraction<Int>(-2, 3),
            Fraction<Int>(-3, 4)
        ]
    )
    internal func subtractingZeroPreservesMinuend(minuend: Fraction<Int>) {
        #expect(minuend - .zero == minuend)
    }

    @Test(
        "Subtracting self returns represented zero",
        arguments: [
            Fraction<Int>(2, 3),
            Fraction<Int>(3, 4),
            Fraction<Int>(-2, 3),
            Fraction<Int>(-3, 4)
        ]
    )
    internal func subtractingSelfReturnsRepresentedZero(value: Fraction<Int>) {
        #expect((value - value).isZero == true)
    }

    @Test(
        "Subtraction is not commutative",
        arguments: Self.subtractionArguments
    )
    internal func subtractionIsNotCommutative(
        minuend: Fraction<Int>,
        subtrahend: Fraction<Int>,
        difference _: Fraction<Int>
    ) {
        #expect(minuend - subtrahend != subtrahend - minuend)
    }
}

// MARK: - Rational Rules

extension FractionSubtractableTests {
    // TODO:
}
