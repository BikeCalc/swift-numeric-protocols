//
// Int4RepresentableByMaxTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 RepresentableByMax Tests")
internal struct Int4RepresentableByMaxTests {
    @Test(
        "Is max",
        arguments: [
            (-8, false),
            (7, true)
        ] as Array<(Int4, Bool)>
    )
    internal func isMax(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isMax == result)
    }

    @Test("Max returns max")
    internal func maxReturnsMax() {
        #expect(Int4.max == 7)
    }
}
