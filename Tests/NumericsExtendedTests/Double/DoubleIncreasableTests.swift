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

// MARK: - Arithmetic Rules

extension DoubleIncreasableTests {
    @Test(
        "Increasing by zero preserves value",
        arguments: [
            (10.0, 10.0),
            (-10.0, -10.0)
        ]
    )
    internal func increasingByZeroPreservesValue(
        value: Double,
        result: Double
    ) {
        let increasedValue: Double = value.increasing(by: 0.0)
        #expect(increasedValue == result)
    }

    @Test(
        "Increasing zero returns zero",
        arguments: [
            10.0,
            -10.0
        ]
    )
    internal func increasingZeroReturnsZero(percentage: Double) {
        let increasedValue: Double = 0.0.increasing(by: percentage)
        #expect(increasedValue == 0.0)
    }
}
