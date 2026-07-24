//
// Int4ComparableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Comparable Tests")
internal struct Int4ComparableTests {
    private static let comparisonArguments: Array<(lhs: Int4, rhs: Int4)> = [
        (1, 1),
        (-1, -1),
        (2, 3),
        (3, 2),
        (-2, 3),
        (-3, -2)
    ]

    private static let rangeArguments: Array<(value: Int4, lowerBound: Int4, upperBound: Int4)> = [
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
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: Int4,
        lowerBound: Int4,
        upperBound: Int4
    ) {
        let range: ClosedRange<Int4> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: Int4,
        lowerBound: Int4,
        upperBound: Int4
    ) {
        #expect(value.isWithin(lowerBound, through: upperBound) == (value >= lowerBound && value <= upperBound))
    }

    @Test(
        "Is between bounds",
        arguments: Self.rangeArguments
    )
    internal func isBetweenBounds(
        value: Int4,
        lowerBound: Int4,
        upperBound: Int4
    ) {
        #expect(value.isBetween(lowerBound, and: upperBound) == (value > lowerBound && value < upperBound))
    }
}
