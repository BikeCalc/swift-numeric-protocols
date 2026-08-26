// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Canonicalized Fraction Negateable Tests")
internal struct CanonicalizedFractionNegateableTests {
    private static let negationArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(-1, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, 2)),
        (Fraction<Int>(5, 2), Fraction<Int>(-5, 2)),
        (Fraction<Int>(-5, 2), Fraction<Int>(5, 2))
    ]

    @Test(
        "Negate canonicalizes result",
        arguments: Self.negationArguments
    )
    internal func negateCanonicalizesResult(
        value: Fraction<Int>,
        negation: Fraction<Int>
    ) {
        @Canonicalized var runningValue: Fraction<Int> = value
        runningValue.negate()
        #expect(runningValue == negation)
    }

    @Test("Negating zero canonicalizes result")
    internal func negatingZeroCanonicalizesResult() {
        @Canonicalized var value: Fraction<Int> = .init(.zero, -2)
        value.negate()

        #expect(value == .zero)
    }

    @Test("Negating positive infinity returns negative infinity")
    internal func negatingPositiveInfinityReturnsNegativeInfinity() {
        @Canonicalized var value: Fraction<Int> = .infinity
        value.negate()

        #expect(value == .negativeInfinity)
    }

    @Test("Negating negative infinity returns positive infinity")
    internal func negatingNegativeInfinityReturnsPositiveInfinity() {
        @Canonicalized var value: Fraction<Int> = .negativeInfinity
        value.negate()

        #expect(value == .infinity)
    }

    @Test("Negating NaN returns NaN")
    internal func negatingNaNReturnsNaN() {
        @Canonicalized var value: Fraction<Int> = .nan
        value.negate()

        #expect(value.isNaN == true)
    }
}
