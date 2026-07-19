//
// UInt4NumericTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Numeric Tests")
internal struct UInt4NumericTests {
    @Test(
        "Magnitude succeeds",
        arguments: [
            (4, 4),
            (8, 8)
        ] as Array<(UInt4, UInt4.Magnitude)>
    )
    internal func magnitudeSucceeds(
        value: UInt4,
        magnitude: UInt4.Magnitude
    ) {
        #expect(value.magnitude == magnitude)
    }

    @Test(
        "Initialized exactly succeeds",
        arguments: [
            (4, 4),
            (8, 8)
        ] as Array<(Int, UInt4)>
    )
    internal func initializedExactlySucceeds(
        source: Int,
        value: UInt4
    ) {
        #expect(UInt4(exactly: source) == value)
    }

    @Test(
        "Initialized exactly fails",
        arguments: [
            -1,
            16
        ]
    )
    internal func initializedExactlyFails(source: Int) {
        #expect(UInt4(exactly: source) == nil)
    }
}
