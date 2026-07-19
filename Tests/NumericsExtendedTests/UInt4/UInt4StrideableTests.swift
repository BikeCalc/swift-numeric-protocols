//
// UInt4StrideableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Strideable Tests")
internal struct UInt4StrideableTests {
    @Test(
        "Advanced by succeeds",
        arguments: [
            (1, 3, 4),
            (4, -3, 1)
        ] as Array<(UInt4, UInt4.Stride, UInt4)>
    )
    internal func advancedBySucceeds(
        value: UInt4,
        amount: UInt4.Stride,
        result: UInt4
    ) {
        #expect(value.advanced(by: amount) == result)
    }

    @Test(
        "Distance to succeeds",
        arguments: [
            (1, 4, 3),
            (4, 1, -3)
        ] as Array<(UInt4, UInt4, UInt4.Stride)>
    )
    internal func distanceToSucceeds(
        value: UInt4,
        other: UInt4,
        result: UInt4.Stride
    ) {
        #expect(value.distance(to: other) == result)
    }
}
