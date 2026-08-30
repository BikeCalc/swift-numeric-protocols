// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction CustomStringConvertible Tests")
internal struct FractionCustomStringConvertibleTests {
    @Test(
        "Description succeeds",
        arguments: [
            (Fraction<Int>(-0, 1), "0/1"),
            (Fraction<Int>(-00, 1), "0/1"),
            (Fraction<Int>(-01, 1), "-1/1"),
            (Fraction<Int>(-1, 1), "-1/1"),
            (Fraction<Int>(0, 1), "0/1"),
            (Fraction<Int>(00, 1), "0/1"),
            (Fraction<Int>(01, 1), "1/1"),
            (Fraction<Int>(1, 1), "1/1")
        ]
    )
    internal func descriptionSucceeds(
        value: Fraction<Int>,
        result: String
    ) {
        #expect(value.description == result)
    }

    @Test("Positive infinity description")
    internal func positiveInfinityDescription() {
        #expect(Fraction<Int>.infinity.description == "inf")
    }

    @Test("Negative infinity description")
    internal func negativeInfinityDescription() {
        #expect(Fraction<Int>.negativeInfinity.description == "-inf")
    }

    @Test("NaN description")
    internal func nanDescription() {
        #expect(Fraction<Int>.nan.description == "nan")
    }
}
