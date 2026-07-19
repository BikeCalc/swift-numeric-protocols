//
// RomanRepresentableByMinTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman RepresentableByMin Tests")
internal struct RomanRepresentableByMinTests {
    @Test(
        "Is min",
        arguments: [
            (0, true),
            (3999, false)
        ] as Array<(Roman, Bool)>
    )
    internal func isMin(
        value: Roman,
        result: Bool
    ) {
        #expect(value.isMin == result)
    }

    @Test("Min returns min")
    internal func minReturnsMin() {
        #expect(Roman.min == 0)
    }
}
