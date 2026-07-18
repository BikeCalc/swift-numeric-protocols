//
// DoubleRepresentableByZeroTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
            (-1.0, false)
        ]
    )
    internal func isZero(
        value: Double,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }
}
