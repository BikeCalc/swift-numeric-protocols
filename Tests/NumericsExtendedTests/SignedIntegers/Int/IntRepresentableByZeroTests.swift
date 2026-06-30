//
// IntRepresentableByZeroTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int RepresentableByZero Tests")
internal struct IntRepresentableByZeroTests {
    @Test(
        "Is zero",
        arguments: [
            (0, true),
            (-0, true),
            (1, false),
            (-1, false)
        ]
    )
    internal func isZero(
        value: Int,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }
}
