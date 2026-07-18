//
// RomanNumericTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Numeric Tests")
internal struct RomanNumericTests {
    @Test(
        "Magnitude succeeds",
        arguments: [
            (0, 0),
            (4, 4),
            (3999, 3999)
        ] as Array<(Roman, Roman.Magnitude)>
    )
    internal func magnitudeSucceeds(
        value: Roman,
        magnitude: Roman.Magnitude
    ) {
        #expect(value.magnitude == magnitude)
    }

    @Test(
        "Initialized exactly succeeds",
        arguments: [
            (0, 0),
            (4, 4),
            (3999, 3999)
        ] as Array<(Int, Roman)>
    )
    internal func initializedExactlySucceeds(
        source: Int,
        value: Roman
    ) {
        #expect(Roman(exactly: source) == value)
    }

    @Test(
        "Initialized exactly fails",
        arguments: [
            -1,
            Int.max,
            4000
        ]
    )
    internal func initializedExactlyFails(source: Int) {
        #expect(Roman(exactly: source) == nil)
    }

    @Test("Max returns max")
    internal func maxReturnsMax() {
        #expect(Roman.max == 3999)
    }

    @Test("Min returns min")
    internal func minReturnsMin() {
        #expect(Roman.min == 0)
    }
}
