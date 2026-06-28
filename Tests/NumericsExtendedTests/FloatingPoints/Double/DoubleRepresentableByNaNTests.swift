//
// DoubleRepresentableByNaNTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
    internal func isNaN(value: Double, result: Bool) {
        #expect(value.isNaN == result)
    }
}
