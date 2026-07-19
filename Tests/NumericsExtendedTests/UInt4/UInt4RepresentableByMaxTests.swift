//
// UInt4RepresentableByMaxTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 RepresentableByMax Tests")
internal struct UInt4RepresentableByMaxTests {
    @Test(
        "Is max",
        arguments: [
            (0, false),
            (15, true)
        ] as Array<(UInt4, Bool)>
    )
    internal func isMax(
        value: UInt4,
        result: Bool
    ) {
        #expect(value.isMax == result)
    }

    @Test("Max returns max")
    internal func maxReturnsMax() {
        #expect(UInt4.max == 15)
    }
}
