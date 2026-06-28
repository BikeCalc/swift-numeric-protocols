//
// DoubleRoundableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Roundable Tests")
internal struct DoubleRoundableTests {
    @Test(
        "Rounded to succeeds",
        arguments: [
            (0.0, UInt(0), 0.0),
            (1.0, UInt(0), 1.0),
            (1.2345, UInt(0), 1.0),
            (1.2345, UInt(1), 1.2),
            (1.2345, UInt(2), 1.23),
            (1.2355, UInt(2), 1.24),
            (-1.2345, UInt(2), -1.23),
            (-1.2355, UInt(2), -1.24)
        ]
    )
    internal func roundedToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.rounded(to: decimalPlace) == result)
    }
    
    @Test(
        "Round to succeeds",
        arguments: [
            (0.0, UInt(0), 0.0),
            (1.0, UInt(0), 1.0),
            (1.2345, UInt(0), 1.0),
            (1.2345, UInt(1), 1.2),
            (1.2345, UInt(2), 1.23),
            (1.2355, UInt(2), 1.24),
            (-1.2345, UInt(2), -1.23),
            (-1.2355, UInt(2), -1.24)
        ]
    )
    internal func roundToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        var roundedValue: Double = value
        roundedValue.round(to: decimalPlace)
        #expect(roundedValue == result)
    }
}

// MARK: - Rules

extension DoubleRoundableTests {
    @Test(
        "Rounding midpoint follows away-from-zero rule",
        arguments: [
            (1.5, UInt(0), 2.0),
            (-1.5, UInt(0), -2.0),
            (1.25, UInt(1), 1.3),
            (-1.25, UInt(1), -1.3)
        ]
    )
    internal func roundingMidpointFollowsAwayFromZeroRule(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.rounded(to: decimalPlace) == result)
    }
    
    @Test(
        "Rounding infinity follows floating-point rules",
        arguments: [
            (Double.infinity, UInt(0), Double.infinity),
            (Double.infinity, UInt(2), Double.infinity),
            (Double.negativeInfinity, UInt(0), Double.negativeInfinity),
            (Double.negativeInfinity, UInt(2), Double.negativeInfinity)
        ]
    )
    internal func roundingInfinityFollowsFloatingPointRules(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.rounded(to: decimalPlace) == result)
    }
    
    @Test(
        "Rounding NaN returns NaN",
        arguments: [
            (Double.nan, UInt(0)),
            (Double.nan, UInt(2))
        ]
    )
    internal func roundingNaNReturnsNaN(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        #expect(value.rounded(to: decimalPlace).isNaN)
    }
    
    @Test(
        "Rounding zero preserves negative zero sign",
        arguments: [
            (-0.0, UInt(0)),
            (-0.0, UInt(2))
        ]
    )
    internal func roundingZeroPreservesNegativeZeroSign(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        let roundedValue: Double = value.rounded(to: decimalPlace)
        
        #expect(roundedValue == 0.0)
        #expect(roundedValue.sign == .minus)
    }
}
