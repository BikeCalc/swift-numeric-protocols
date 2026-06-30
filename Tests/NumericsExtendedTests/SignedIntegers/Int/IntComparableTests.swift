//
// IntComparableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Comparable Tests")
internal struct IntComparableTests {
    @Test(
        "Is less than",
        arguments: [
            (0, 1, true),
            (1, 1, false),
            (2, 1, false),
            (1, 2, true),
            (-1, 1, true)
        ]
    )
    internal func isLessThan(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isLess(than: rhs) == result)
    }
    
    @Test(
        "Is less than or equal",
        arguments: [
            (0, 0, true),
            (2, 1, false),
            (1, 1, true),
            (1, 2, true),
            (-1, 1, true)
        ]
    )
    internal func isLessThanOrEqualTo(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == result)
    }
    
    @Test(
        "Is greater than",
        arguments: [
            (0, -1, true),
            (1, 1, false),
            (1, 2, false),
            (2, 1, true),
            (1, -1, true)
        ]
    )
    internal func isGreaterThan(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isGreater(than: rhs) == result)
    }
    
    @Test(
        "Is greater than or equal",
        arguments: [
            (0, 0, true),
            (1, 2, false),
            (1, 1, true),
            (2, 1, true),
            (1, -1, true)
        ]
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Int,
        rhs: Int,
        result: Bool
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == result)
    }
    
    @Test(
        "Is within closed range",
        arguments: [
            (0, 1...3, false),
            (1, 1...3, true),
            (2, 1...3, true),
            (3, 1...3, true),
            (4, 1...3, false),
            (-1, -2...2, true)
        ]
    )
    internal func isWithinClosedRange(
        value: Int,
        range: ClosedRange<Int>,
        result: Bool
    ) {
        #expect(value.isWithin(range) == result)
    }
    
    @Test(
        "Is within bounds",
        arguments: [
            (0, 1, 3, false),
            (1, 1, 3, true),
            (2, 1, 3, true),
            (3, 1, 3, true),
            (4, 1, 3, false),
            (-1, -2, 2, true)
        ]
    )
    internal func isWithinBounds(
        value: Int,
        lowerBound: Int,
        upperBound: Int,
        result: Bool
    ) {
        #expect(value.isWithin(lowerBound, through: upperBound) == result)
    }
    
    @Test(
        "Is between bounds",
        arguments: [
            (0, 1, 3, false),
            (1, 1, 3, false),
            (2, 1, 3, true),
            (3, 1, 3, false),
            (4, 1, 3, false),
            (-1, -2, 2, true)
        ]
    )
    internal func isBetweenBounds(
        value: Int,
        lowerBound: Int,
        upperBound: Int,
        result: Bool
    ) {
        #expect(value.isBetween(lowerBound, and: upperBound) == result)
    }
}
