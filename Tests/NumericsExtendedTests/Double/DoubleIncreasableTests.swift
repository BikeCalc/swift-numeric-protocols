//
// DoubleIncreasableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Increasable Tests")
internal struct DoubleIncreasableTests {
    @Test(
        "Increasing by succeeds",
        arguments: [
            (0.0, 10.0, 0.0),
            (10.0, 0.0, 10.0),
            (10.0, 10.0, 11.0),
            (10.0, -10.0, 9.0)
        ]
    )
    internal func increasingBySucceeds(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let increasedValue: Double = value.increasing(by: percentage)
        #expect(increasedValue == result)
    }
}
