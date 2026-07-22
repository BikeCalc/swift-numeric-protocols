//
// Int4RepresentableByMinTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 RepresentableByMin Tests")
internal struct Int4RepresentableByMinTests {
    @Test(
        "Is min",
        arguments: [
            (-8, true),
            (7, false)
        ] as Array<(Int4, Bool)>
    )
    internal func isMin(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isMin == result)
    }

    @Test("Min returns min")
    internal func minReturnsMin() {
        #expect(Int4.min == -8)
    }
}
