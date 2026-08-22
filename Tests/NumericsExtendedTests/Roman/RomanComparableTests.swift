// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Roman Comparable Tests")
internal struct RomanComparableTests {
    private static let comparisonArguments: Array<(Roman, Roman)> = [
        (1, 1),
        (2, 3),
        (3, 2)
    ]

    private static let rangeArguments: Array<(Roman, Roman, Roman)> = [
        (1, 2, 4),
        (2, 2, 4),
        (3, 2, 4),
        (4, 2, 4),
        (5, 2, 4)
    ]

    @Test(
        "Is less than",
        arguments: Self.comparisonArguments
    )
    internal func isLessThan(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: Roman,
        lowerBound: Roman,
        upperBound: Roman
    ) {
        let range: ClosedRange<Roman> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: Roman,
        lowerBound: Roman,
        upperBound: Roman
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
        value: Roman,
        lowerBound: Roman,
        upperBound: Roman
    ) {
        let isBetween: Bool = value.isBetween(
            lowerBound,
            and: upperBound
        )
        #expect(isBetween == (value > lowerBound && value < upperBound))
    }
}
