//
// RomanStrideableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Strideable Tests")
internal struct RomanStrideableTests {
    @Test(
        "Advanced by succeeds",
        arguments: [
            (0, 0, 0),
            (1, 3, 4),
            (4, -3, 1)
        ] as Array<(Roman, Roman.Stride, Roman)>
    )
    internal func advancedBySucceeds(
        value: Roman,
        amount: Roman.Stride,
        result: Roman
    ) {
        #expect(value.advanced(by: amount) == result)
    }

    @Test(
        "Distance to succeeds",
        arguments: [
            (0, 0, 0),
            (1, 4, 3),
            (4, 1, -3)
        ] as Array<(Roman, Roman, Roman.Stride)>
    )
    internal func distanceToSucceeds(
        value: Roman,
        other: Roman,
        result: Roman.Stride
    ) {
        #expect(value.distance(to: other) == result)
    }
}
