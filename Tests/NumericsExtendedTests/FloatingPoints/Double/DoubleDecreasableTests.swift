//
// DoubleDecreasableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Decreasable Tests")
internal struct DoubleDecreasableTests {
    @Test(
        "Decreasing by succeeds",
        arguments: [
            (0.0, 10.0, 0.0),
            (10.0, 0.0, 10.0),
            (10.0, 10.0, 9.0),
            (10.0, -10.0, 11.0)
        ]
    )
    internal func decreasingBySucceeds(value: Double, percentage: Double, result: Double) {
        let decreasedValue: Double = value.decreasing(by: percentage)
        #expect(decreasedValue == result)
    }
}
