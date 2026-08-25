// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Comparable Tests")
internal struct DoubleComparableTests {
    private static let comparisonArguments: Array<(Double, Double)> = [
        (1.0, 1.0),
        (-1.0, -1.0),
        (2.0, 3.0),
        (3.0, 2.0),
        (-2.0, 3.0),
        (-3.0, -2.0),
        (0.5, 1.5),
        (1.5, 0.5),
        (-0.5, 1.5),
        (-1.5, -0.5)
    ]

    private static let rangeArguments: Array<(Double, Double, Double)> = [
        (1.0, 2.0, 4.0),
        (2.0, 2.0, 4.0),
        (3.0, 2.0, 4.0),
        (4.0, 2.0, 4.0),
        (5.0, 2.0, 4.0),
        (-5.0, -4.0, -2.0),
        (-4.0, -4.0, -2.0),
        (-3.0, -4.0, -2.0),
        (-2.0, -4.0, -2.0),
        (-1.0, -4.0, -2.0),
        (0.5, 1.0, 2.0),
        (1.0, 1.0, 2.0),
        (1.5, 1.0, 2.0),
        (2.0, 1.0, 2.0),
        (2.5, 1.0, 2.0),
        (-2.5, -2.0, -1.0),
        (-2.0, -2.0, -1.0),
        (-1.5, -2.0, -1.0),
        (-1.0, -2.0, -1.0),
        (-0.5, -2.0, -1.0)
    ]

    @Test(
        "Is less than",
        arguments: Self.comparisonArguments
    )
    internal func isLessThan(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: Double,
        lowerBound: Double,
        upperBound: Double
    ) {
        let range: ClosedRange<Double> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: Double,
        lowerBound: Double,
        upperBound: Double
    ) {
        let isWithin: Bool = value.isWithin(
            lowerBound,
            through: upperBound
        ) == true
        #expect(isWithin == (value >= lowerBound && value <= upperBound))
    }

    @Test(
        "Is between bounds",
        arguments: Self.rangeArguments
    )
    internal func isBetweenBounds(
        value: Double,
        lowerBound: Double,
        upperBound: Double
    ) {
        let isBetween: Bool = value.isBetween(
            lowerBound,
            and: upperBound
        ) == true
        #expect(isBetween == (value > lowerBound && value < upperBound))
    }
}

// MARK: - Floating-Point Rules

extension DoubleComparableTests {
    @Test(
        "NaN equality follows floating-point rules",
        arguments: [
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.nan)
        ]
    )
    internal func nanEqualityFollowsFloatingPointRules(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs.isLess(than: rhs) == false)
        #expect(lhs.isLessThanOrEqual(to: rhs) == false)
        #expect(lhs.isGreater(than: rhs) == false)
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == false)
    }
}
