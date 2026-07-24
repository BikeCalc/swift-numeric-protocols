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
    private static let comparisonArguments: Array<(lhs: Int, rhs: Int)> = [
        (1, 1),
        (-1, -1),
        (2, 3),
        (3, 2),
        (-2, 3),
        (-3, -2)
    ]

    private static let rangeArguments: Array<(value: Int, lowerBound: Int, upperBound: Int)> = [
        (1, 2, 4),
        (2, 2, 4),
        (3, 2, 4),
        (4, 2, 4),
        (5, 2, 4),
        (-5, -4, -2),
        (-4, -4, -2),
        (-3, -4, -2),
        (-2, -4, -2),
        (-1, -4, -2)
    ]

    @Test(
        "Is less than",
        arguments: Self.comparisonArguments
    )
    internal func isLessThan(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: Int,
        lowerBound: Int,
        upperBound: Int
    ) {
        let range: ClosedRange<Int> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: Int,
        lowerBound: Int,
        upperBound: Int
    ) {
        #expect(value.isWithin(lowerBound, through: upperBound) == (value >= lowerBound && value <= upperBound))
    }

    @Test(
        "Is between bounds",
        arguments: Self.rangeArguments
    )
    internal func isBetweenBounds(
        value: Int,
        lowerBound: Int,
        upperBound: Int
    ) {
        #expect(value.isBetween(lowerBound, and: upperBound) == (value > lowerBound && value < upperBound))
    }
}
