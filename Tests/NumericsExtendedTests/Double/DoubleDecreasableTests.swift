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
            (10.0, 10.0, 9.0),
            (10.0, -10.0, 11.0)
        ]
    )
    internal func decreasingBySucceeds(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let decreasedValue: Double = value.decreasing(by: percentage)
        #expect(decreasedValue == result)
    }
}

// MARK: - Arithmetic Rules

extension DoubleDecreasableTests {
    @Test(
        "Decreasing by zero preserves value",
        arguments: [
            (10.0, 10.0),
            (-10.0, -10.0)
        ]
    )
    internal func decreasingByZeroPreservesValue(
        value: Double,
        result: Double
    ) {
        let decreasedValue: Double = value.decreasing(by: 0.0)
        #expect(decreasedValue == result)
    }

    @Test(
        "Decreasing zero returns zero",
        arguments: [
            10.0,
            -10.0
        ]
    )
    internal func decreasingZeroReturnsZero(percentage: Double) {
        let decreasedValue: Double = 0.0.decreasing(by: percentage)
        #expect(decreasedValue == 0.0)
    }
}
