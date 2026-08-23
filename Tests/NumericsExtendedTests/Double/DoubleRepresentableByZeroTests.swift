// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double RepresentableByZero Tests")
internal struct DoubleRepresentableByZeroTests {
    @Test(
        "Is zero",
        arguments: [
            (0.0, true),
            (-0.0, true),
            (1.0, false),
            (-1.0, false),
            (0.5, false),
            (-0.5, false)
        ]
    )
    internal func isZero(
        value: Double,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }

    @Test("Negative zero is zero")
    internal func negativeZeroIsZero() {
        #expect(Double.negativeZero.isZero)
    }
}
