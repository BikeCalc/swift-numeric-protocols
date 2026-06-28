//
// DoubleTruncatableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Truncatable Tests")
internal struct DoubleTruncatableTests {
    @Test(
        "Truncated to succeeds",
        arguments: [
            (0.0, UInt(0), 0.0),
            (1.0, UInt(0), 1.0),
            (1.2345, UInt(0), 1.0),
            (1.2345, UInt(1), 1.2),
            (1.2345, UInt(2), 1.23),
            (1.2399, UInt(2), 1.23),
            (-1.2345, UInt(2), -1.23),
            (-1.2399, UInt(2), -1.23)
        ]
    )
    internal func truncatedToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }
    
    @Test(
        "Truncate to succeeds",
        arguments: [
            (0.0, UInt(0), 0.0),
            (1.0, UInt(0), 1.0),
            (1.2345, UInt(0), 1.0),
            (1.2345, UInt(1), 1.2),
            (1.2345, UInt(2), 1.23),
            (1.2399, UInt(2), 1.23),
            (-1.2345, UInt(2), -1.23),
            (-1.2399, UInt(2), -1.23)
        ]
    )
    internal func truncateToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        var truncatedValue: Double = value
        truncatedValue.truncate(to: decimalPlace)
        #expect(truncatedValue == result)
    }
}

// MARK: - Rules

extension DoubleTruncatableTests {
    @Test(
        "Truncating follows toward-zero rule",
        arguments: [
            (1.9, UInt(0), 1.0),
            (-1.9, UInt(0), -1.0),
            (1.29, UInt(1), 1.2),
            (-1.29, UInt(1), -1.2)
        ]
    )
    internal func truncatingFollowsTowardZeroRule(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }
    
    @Test(
        "Truncating infinity follows floating-point rules",
        arguments: [
            (Double.infinity, UInt(0), Double.infinity),
            (Double.infinity, UInt(2), Double.infinity),
            (Double.negativeInfinity, UInt(0), Double.negativeInfinity),
            (Double.negativeInfinity, UInt(2), Double.negativeInfinity)
        ]
    )
    internal func truncatingInfinityFollowsFloatingPointRules(
        value: Double,
        decimalPlace: UInt,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }
    
    @Test(
        "Truncating NaN returns NaN",
        arguments: [
            (Double.nan, UInt(0)),
            (Double.nan, UInt(2))
        ]
    )
    internal func truncatingNaNReturnsNaN(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        #expect(value.truncated(to: decimalPlace).isNaN)
    }
    
    @Test(
        "Truncating zero preserves negative zero sign",
        arguments: [
            (-0.0, UInt(0)),
            (-0.0, UInt(2))
        ]
    )
    internal func truncatingZeroPreservesNegativeZeroSign(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        let truncatedValue: Double = value.truncated(to: decimalPlace)
        
        #expect(truncatedValue == 0.0)
        #expect(truncatedValue.sign == .minus)
    }
}
