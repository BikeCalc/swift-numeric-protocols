//
// DoubleComparableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Comparable")
internal struct DoubleComparableTests {
    @Test(
        "Is less than",
        arguments: [
            (0.0, 1.0, true),
            (1.0, 1.0, false),
            (2.0, 1.0, false),
            (1.0, 2.0, true),
            (-1.0, 1.0, true)
        ]
    )
    internal func isLessThan(lhs: Double, rhs: Double, result: Bool) {
        #expect(lhs.isLess(than: rhs) == result)
    }
    
    @Test(
        "Is less than or equal",
        arguments: [
            (0.0, 0.0, true),
            (2.0, 1.0, false),
            (1.0, 1.0, true),
            (1.0, 2.0, true),
            (-1.0, 1.0, true)
        ]
    )
    internal func isLessThanOrEqualTo(lhs: Double, rhs: Double, result: Bool) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == result)
    }
    
    @Test(
        "Is greater than",
        arguments: [
            (0.0, -1.0, true),
            (1.0, 1.0, false),
            (1.0, 2.0, false),
            (2.0, 1.0, true),
            (1.0, -1.0, true)
        ]
    )
    internal func isGreaterThan(lhs: Double, rhs: Double, result: Bool) {
        #expect(lhs.isGreater(than: rhs) == result)
    }
    
    @Test(
        "Is greater than or equal",
        arguments: [
            (0.0, 0.0, true),
            (1.0, 2.0, false),
            (1.0, 1.0, true),
            (2.0, 1.0, true),
            (1.0, -1.0, true)
        ]
    )
    internal func isGreaterThanOrEqualTo(lhs: Double, rhs: Double, result: Bool) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == result)
    }
    
    @Test(
        "Is within closed range",
        arguments: [
            (0.0, 1.0...3.0, false),
            (1.0, 1.0...3.0, true),
            (2.0, 1.0...3.0, true),
            (3.0, 1.0...3.0, true),
            (4.0, 1.0...3.0, false),
            (-1.0, -2.0...2.0, true)
        ]
    )
    internal func isWithinClosedRange(value: Double, range: ClosedRange<Double>, result: Bool) {
        #expect(value.isWithin(range) == result)
    }
    
    @Test(
        "Is within bounds",
        arguments: [
            (0.0, 1.0, 3.0, false),
            (1.0, 1.0, 3.0, true),
            (2.0, 1.0, 3.0, true),
            (3.0, 1.0, 3.0, true),
            (4.0, 1.0, 3.0, false),
            (-1.0, -2.0, 2.0, true)
        ]
    )
    internal func isWithinBounds(value: Double, lowerBound: Double, upperBound: Double, result: Bool) {
        #expect(value.isWithin(lowerBound, through: upperBound) == result)
    }
    
    @Test(
        "Is between bounds",
        arguments: [
            (0.0, 1.0, 3.0, false),
            (1.0, 1.0, 3.0, false),
            (2.0, 1.0, 3.0, true),
            (3.0, 1.0, 3.0, false),
            (4.0, 1.0, 3.0, false),
            (-1.0, -2.0, 2.0, true)
        ]
    )
    internal func isBetweenBounds(value: Double, lowerBound: Double, upperBound: Double, result: Bool) {
        #expect(value.isBetween(lowerBound, and: upperBound) == result)
    }
}

// MARK: - Rules

extension DoubleComparableTests {
    @Test(
        "NaN equality follows floating-point rules",
        arguments: [
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.nan)
        ]
    )
    internal func nanEqualityFollowsFloatingPointRules(lhs: Double, rhs: Double) {
        #expect(lhs.isLess(than: rhs) == false)
        #expect(lhs.isLessThanOrEqual(to: rhs) == false)
        #expect(lhs.isGreater(than: rhs) == false)
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == false)
    }
}
