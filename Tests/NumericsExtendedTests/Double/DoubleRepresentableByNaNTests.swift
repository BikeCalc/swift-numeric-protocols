// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double RepresentableByNaN Tests")
internal struct DoubleRepresentableByNaNTests {
    @Test(
        "Is NaN",
        arguments: [
            (Double.nan, true),
            (0.0, false),
            (Double.infinity, false)
        ]
    )
    internal func isNaN(
        value: Double,
        result: Bool
    ) {
        #expect(value.isNaN == result)
    }
}
