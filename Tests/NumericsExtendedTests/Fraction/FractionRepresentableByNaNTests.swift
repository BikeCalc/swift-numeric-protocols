// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction RepresentableByNaN Tests")
internal struct FractionRepresentableByNaNTests {
    @Test("NaN is NaN")
    internal func nanIsNaN() {
        #expect(Fraction<Int>.nan.isNaN == true)
        #expect(Fraction<Int>(0, 0).isNaN == true)
    }

    @Test("Zero is not NaN")
    internal func zeroIsNotNaN() {
        #expect(Fraction<Int>.zero.isNaN == false)
    }

    @Test("Positive infinity is not NaN")
    internal func positiveInfinityIsNotNaN() {
        #expect(Fraction<Int>.infinity.isNaN == false)
    }

    @Test("Negative infinity is not NaN")
    internal func negativeInfinityIsNotNaN() {
        #expect(Fraction<Int>.negativeInfinity.isNaN == false)
    }
}
