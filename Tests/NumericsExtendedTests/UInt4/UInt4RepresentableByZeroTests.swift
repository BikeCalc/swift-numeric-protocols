//
// UInt4RepresentableByZeroTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 RepresentableByZero Tests")
internal struct UInt4RepresentableByZeroTests {
    @Test(
        "Is zero",
        arguments: [
            (0, true),
            (1, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func isZero(
        value: UInt4,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }
}
