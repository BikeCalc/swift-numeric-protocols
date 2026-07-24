//
// Int4RepresentableByZeroTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 RepresentableByZero Tests")
internal struct Int4RepresentableByZeroTests {
    @Test(
        "Is zero",
        arguments: [
            (0, true),
            (-0, true),
            (1, false),
            (-1, false)
        ] as Array<(Int4, Bool)>
    )
    internal func isZero(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isZero == result)
    }
}
