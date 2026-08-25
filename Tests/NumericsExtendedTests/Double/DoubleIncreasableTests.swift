// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Increasable Tests")
internal struct DoubleIncreasableTests {
    @Test(
        "Increasing by succeeds",
        arguments: [
            (10.0, 2.0, 10.2),
            (20.0, 3.0, 20.6),
            (-10.0, 2.0, -10.2),
            (-20.0, 3.0, -20.6),
            (0.5, 2.0, 0.51),
            (1.5, 3.0, 1.545),
            (-0.5, 2.0, -0.51),
            (-1.5, 3.0, -1.545)
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
    internal func increasingByZeroPreservesValue(value: Double) {
        let increasedValue: Double = value.increasing(by: Double.zero)
        #expect(increasedValue == value)
    }

    @Test(
        "Increasing zero returns zero",
        arguments: [
            2.0,
            3.0,
            -2.0,
            -3.0
        ]
    )
    internal func increasingZeroReturnsZero(percentage: Double) {
        let increasedValue: Double = Double.zero.increasing(by: percentage)
        #expect(increasedValue == Double.zero)
    }

    @Test(
        "Increasing positive value by negative percentage decreases value",
        arguments: [
            (10.0, -2.0, 9.8),
            (20.0, -3.0, 19.4)
        ]
    )
    internal func increasingPositiveValueByNegativePercentageDecreasesValue(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let increasedValue: Double = value.increasing(by: percentage)
        #expect(increasedValue == result)
        #expect(increasedValue < value)
    }

    @Test(
        "Increasing negative value by negative percentage increases value",
        arguments: [
            (-10.0, -2.0, -9.8),
            (-20.0, -3.0, -19.4)
        ]
    )
    internal func increasingNegativeValueByNegativePercentageIncreasesValue(
        value: Double,
        percentage: Double,
        result: Double
    ) {
        let increasedValue: Double = value.increasing(by: percentage)
        #expect(increasedValue == result)
        #expect(increasedValue > value)
    }
}
