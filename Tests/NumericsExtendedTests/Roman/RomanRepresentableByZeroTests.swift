//
// RomanRepresentableByZeroTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman RepresentableByZero Tests")
internal struct RomanRepresentableByZeroTests {
    @Test(
        "Is zero",
        arguments: [
            (0, true),
            (1, false)
        ] as Array<(Roman, Bool)>
    )
    internal func isZero(
        value: Roman,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }
}
