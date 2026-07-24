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
            (10.0, 2.0, 9.8),
            (20.0, 3.0, 19.4),
            (-10.0, 2.0, -9.8),
            (-20.0, 3.0, -19.4),
            (0.5, 2.0, 0.49),
            (1.5, 3.0, 1.455),
            (-0.5, 2.0, -0.49),
            (-1.5, 3.0, -1.455)
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
            10.0,
            20.0,
            -10.0,
            -20.0,
            0.5,
            1.5,
            -0.5,
            -1.5
        ]
    )
    internal func decreasingByZeroPreservesValue(value: Double) {
        let decreasedValue: Double = value.decreasing(by: 0.0)
        #expect(decreasedValue == value)
    }

    @Test(
        "Decreasing zero returns zero",
        arguments: [
            2.0,
            3.0,
            -2.0,
            -3.0
        ]
    )
    internal func decreasingZeroReturnsZero(percentage: Double) {
        let decreasedValue: Double = 0.0.decreasing(by: percentage)
        #expect(decreasedValue == 0.0)
    }

    @Test(
        "Decreasing positive value by negative percentage increases value",
        arguments: [
            (10.0, -2.0, 10.2),
            (20.0, -3.0, 20.6)
        ]
    )
    internal func decreasingPositiveValueByNegativePercentageIncreasesValue(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let decreasedValue: Double = value.decreasing(by: percentage)
        #expect(decreasedValue == result)
        #expect(decreasedValue > value)
    }

    @Test(
        "Decreasing negative value by negative percentage decreases value",
        arguments: [
            (-10.0, -2.0, -10.2),
            (-20.0, -3.0, -20.6)
        ]
    )
    internal func decreasingNegativeValueByNegativePercentageDecreasesValue(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let decreasedValue: Double = value.decreasing(by: percentage)
        #expect(decreasedValue == result)
        #expect(decreasedValue < value)
    }
}
