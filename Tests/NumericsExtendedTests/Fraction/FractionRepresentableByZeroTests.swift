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
        "Is zero",
        arguments: [
            (Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), true),
            (Fraction<Int>(1, 1), false),
            (Fraction<Int>(-1, 1), false)
        ]
    )
    internal func isZero(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }

    @Test(
        "Stored zero representations are zero",
        arguments: [
            Fraction<Int>(0, 2),
            Fraction<Int>(0, -2)
        ]
    )
    internal func storedZeroRepresentationsAreZero(value: Fraction<Int>) {
        #expect(value.isZero)
    }
}
