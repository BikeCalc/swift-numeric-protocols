//
// UInt4RepresentableByMinTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 RepresentableByMin Tests")
internal struct UInt4RepresentableByMinTests {
    @Test(
        "Is min",
        arguments: [
            (0, true),
            (15, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func isMin(
        value: UInt4,
        result: Bool
    ) {
        #expect(value.isMin == result)
    }

    @Test("Min returns min")
    internal func minReturnsMin() {
        #expect(UInt4.min == 0)
    }
}
