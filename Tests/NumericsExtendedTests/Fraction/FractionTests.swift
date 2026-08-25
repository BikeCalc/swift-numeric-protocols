// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Tests")
internal struct FractionTests {
    @Test(
        "Initialization preserves finite terms",
        arguments: [
            (1, 2),
            (-1, 2),
            (-1, -2),
            (1, -2)
        ]
    )
    internal func initializationPreservesFiniteTerms(
        numerator: Int,
        denominator: Int
    ) {
        let value: Fraction<Int> = .init(numerator, denominator)

        #expect(value.numerator == numerator)
        #expect(value.denominator == denominator)
    }

    @Test(
        "Initialization preserves unsimplified terms",
        arguments: [
            (2, 4),
            (-2, 4),
            (-2, -4),
            (2, -4)
        ]
    )
    internal func initializationPreservesUnsimplifiedTerms(
        numerator: Int,
        denominator: Int
    ) {
        let value: Fraction<Int> = .init(numerator, denominator)

        #expect(value.numerator == numerator)
        #expect(value.denominator == denominator)
    }
}

// MARK: - Rational Rules

extension FractionTests {
    @Test(
        "Zero initialization preserves terms",
        arguments: [
            1,
            2,
            -2
        ]
    )
    internal func zeroInitializationPreservesTerms(denominator: Int) {
        let value: Fraction<Int> = .init(0, denominator)

        #expect(value.numerator == 0)
        #expect(value.denominator == denominator)
    }

    @Test(
        "Positive infinity initialization canonicalizes terms",
        arguments: [
            2,
            Int.max
        ]
    )
    internal func positiveInfinityInitializationCanonicalizesTerms(numerator: Int) {
        let value: Fraction<Int> = .init(numerator, 0)

        #expect(value.numerator == 1)
        #expect(value.denominator == 0)
    }

    @Test(
        "Negative infinity initialization canonicalizes terms",
        arguments: [
            -2,
            Int.min
        ]
    )
    internal func negativeInfinityInitializationCanonicalizesTerms(numerator: Int) {
        let value: Fraction<Int> = .init(numerator, 0)

        #expect(value.numerator == -1)
        #expect(value.denominator == 0)
    }

    @Test("NaN initialization preserves terms")
    internal func nanInitializationPreservesTerms() {
        let value: Fraction<Int> = .nan

        #expect(value.numerator == 0)
        #expect(value.denominator == 0)
    }
}
