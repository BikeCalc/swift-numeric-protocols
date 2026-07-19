//
// RomanRepresentableByMaxTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman RepresentableByMax Tests")
internal struct RomanRepresentableByMaxTests {
    @Test(
        "Is max",
        arguments: [
            (0, false),
            (3999, true)
        ] as Array<(Roman, Bool)>
    )
    internal func isMax(
        value: Roman,
        result: Bool
    ) {
        #expect(value.isMax == result)
    }

    @Test("Max returns max")
    internal func maxReturnsMax() {
        #expect(Roman.max == 3999)
    }
}
