// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Comparable Tests")
internal struct FractionComparableTests {
    private static let comparisonArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-1, 2)),
        (Fraction<Int>(2, 2), Fraction<Int>(3, 2)),
        (Fraction<Int>(3, 2), Fraction<Int>(2, 2)),
        (Fraction<Int>(-2, 2), Fraction<Int>(3, 2)),
        (Fraction<Int>(-3, 2), Fraction<Int>(-2, 2))
    ]

    private static let rangeArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(2, 2), Fraction<Int>(4, 2)),
        (Fraction<Int>(2, 2), Fraction<Int>(2, 2), Fraction<Int>(4, 2)),
        (Fraction<Int>(3, 2), Fraction<Int>(2, 2), Fraction<Int>(4, 2)),
        (Fraction<Int>(4, 2), Fraction<Int>(2, 2), Fraction<Int>(4, 2)),
        (Fraction<Int>(5, 2), Fraction<Int>(2, 2), Fraction<Int>(4, 2)),
        (Fraction<Int>(-5, 2), Fraction<Int>(-4, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-4, 2), Fraction<Int>(-4, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-3, 2), Fraction<Int>(-4, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-2, 2), Fraction<Int>(-4, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-4, 2), Fraction<Int>(-2, 2))
    ]

    @Test(
        "Is less than",
        arguments: Self.comparisonArguments
    )
    internal func isLessThan(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: Fraction<Int>,
        lowerBound: Fraction<Int>,
        upperBound: Fraction<Int>
    ) {
        let range: ClosedRange<Fraction<Int>> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: Fraction<Int>,
        lowerBound: Fraction<Int>,
        upperBound: Fraction<Int>
    ) {
        let isWithin: Bool = value.isWithin(
            lowerBound,
            through: upperBound
        )

        #expect(isWithin == (value >= lowerBound && value <= upperBound))
    }

    @Test(
        "Is between bounds",
        arguments: Self.rangeArguments
    )
    internal func isBetweenBounds(
        value: Fraction<Int>,
        lowerBound: Fraction<Int>,
        upperBound: Fraction<Int>
    ) {
        let isBetween: Bool = value.isBetween(
            lowerBound,
            and: upperBound
        )

        #expect(isBetween == (value > lowerBound && value < upperBound))
    }
}

