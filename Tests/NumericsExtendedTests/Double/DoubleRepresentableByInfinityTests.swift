// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double RepresentableByInfinity Tests")
internal struct DoubleRepresentableByInfinityTests {
    @Test(
        "Finite values are finite",
        arguments: [
            1.0,
            -1.0,
            0.5,
            -0.5
        ]
    )
    internal func finiteValuesAreFinite(value: Double) {
        #expect(value.isFinite == true)
        #expect(value.isInfinite == false)
    }

    @Test("Zero is finite")
    internal func zeroIsFinite() {
        #expect(Double.zero.isFinite == true)
        #expect(Double.zero.isInfinite == false)
    }

    @Test("Negative zero is finite")
    internal func negativeZeroIsFinite() {
        #expect(Double.negativeZero.isFinite == true)
        #expect(Double.negativeZero.isInfinite == false)
    }

    @Test("Positive infinity is infinite")
    internal func positiveInfinityIsInfinite() {
        #expect(Double.infinity.isFinite == false)
        #expect(Double.infinity.isInfinite == true)
    }

    @Test("Negative infinity is infinite")
    internal func negativeInfinityIsInfinite() {
        #expect(Double.negativeInfinity.isFinite == false)
        #expect(Double.negativeInfinity.isInfinite == true)
    }

    @Test("NaN is neither finite nor infinite")
    internal func nanIsNeitherFiniteNorInfinite() {
        #expect(Double.nan.isFinite == false)
        #expect(Double.nan.isInfinite == false)
    }

    @Test("Negative infinity equals negated infinity")
    internal func negativeInfinityEqualsNegatedInfinity() {
        #expect(Double.negativeInfinity == -Double.infinity)
    }
}
