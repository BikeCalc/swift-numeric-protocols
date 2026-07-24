//
// Int4StrideableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Strideable Tests")
internal struct Int4StrideableTests {
    @Test(
        "Advanced by succeeds",
        arguments: [
            (1, 3, 4),
            (2, 3, 5),
            (4, -3, 1),
            (5, -3, 2),
            (-1, -3, -4),
            (-2, -3, -5),
            (-4, 3, -1)
        ] as Array<(Int4, Int4.Stride, Int4)>
    )
    internal func advancedBySucceeds(
        value: Int4,
        amount: Int4.Stride,
        result: Int4
    ) {
        #expect(value.advanced(by: amount) == result)
    }

    @Test(
        "Distance to succeeds",
        arguments: [
            (1, 4, 3),
            (2, 5, 3),
            (4, 1, -3),
            (5, 2, -3),
            (-4, -1, 3),
            (-5, -2, 3),
            (-1, -4, -3)
        ] as Array<(Int4, Int4, Int4.Stride)>
    )
    internal func distanceToSucceeds(
        value: Int4,
        other: Int4,
        result: Int4.Stride
    ) {
        #expect(value.distance(to: other) == result)
    }
}

// MARK: - Stride Rules

extension Int4StrideableTests {
    @Test(
        "Advancing by zero preserves value",
        arguments: [
            1,
            2,
            -1,
            -2
        ] as Array<Int4>
    )
    internal func advancingByZeroPreservesValue(value: Int4) {
        #expect(value.advanced(by: 0) == value)
    }

    @Test(
        "Distance to self returns zero",
        arguments: [
            1,
            2,
            -1,
            -2
        ] as Array<Int4>
    )
    internal func distanceToSelfReturnsZero(value: Int4) {
        #expect(value.distance(to: value) == 0)
    }
}
