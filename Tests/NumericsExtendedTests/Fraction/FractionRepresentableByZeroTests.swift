// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction RepresentableByZero Tests")
internal struct FractionRepresentableByZeroTests {
    @Test(
        "Nonzero values are not zero",
        arguments: [
            Fraction<Int>(1, 1),
            Fraction<Int>(-1, 1)
        ]
    )
    internal func nonzeroValuesAreNotZero(value: Fraction<Int>) {
        #expect(value.isZero == false)
    }

    @Test("Positive zero is zero")
    internal func positiveZeroIsZero() {
        #expect(Fraction<Int>.zero.numerator == 0)
        #expect(Fraction<Int>.zero.denominator == 1)
        #expect(Fraction<Int>.zero.isZero == true)
    }

    @Test("Negative zero is zero")
    internal func negativeZeroIsZero() {
        #expect(Fraction<Int>.negativeZero.numerator == 0)
        #expect(Fraction<Int>.negativeZero.denominator == -1)
        #expect(Fraction<Int>.negativeZero.isZero == true)
        #expect(Fraction<Int>.negativeZero != .zero)
    }

    @Test(
        "Stored zero representations are zero",
        arguments: [
            Fraction<Int>(0, 2),
            Fraction<Int>(0, -2)
        ]
    )
    internal func storedZeroRepresentationsAreZero(value: Fraction<Int>) {
        #expect(value.isZero == true)
    }
}
