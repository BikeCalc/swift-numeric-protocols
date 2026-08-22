// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("UInt4 Comparable Tests")
internal struct UInt4ComparableTests {
    private static let comparisonArguments: Array<(UInt4, UInt4)> = [
        (1, 1),
        (2, 3),
        (3, 2)
    ]

    private static let rangeArguments: Array<(UInt4, UInt4, UInt4)> = [
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
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs.isLess(than: rhs) == (lhs < rhs))
    }

    @Test(
        "Is less than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isLessThanOrEqualTo(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == (lhs <= rhs))
    }

    @Test(
        "Is greater than",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThan(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs.isGreater(than: rhs) == (lhs > rhs))
    }

    @Test(
        "Is greater than or equal",
        arguments: Self.comparisonArguments
    )
    internal func isGreaterThanOrEqualTo(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == (lhs >= rhs))
    }

    @Test(
        "Is within closed range",
        arguments: Self.rangeArguments
    )
    internal func isWithinClosedRange(
        value: UInt4,
        lowerBound: UInt4,
        upperBound: UInt4
    ) {
        let range: ClosedRange<UInt4> = lowerBound...upperBound
        #expect(value.isWithin(range) == range.contains(value))
    }

    @Test(
        "Is within bounds",
        arguments: Self.rangeArguments
    )
    internal func isWithinBounds(
        value: UInt4,
        lowerBound: UInt4,
        upperBound: UInt4
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
        value: UInt4,
        lowerBound: UInt4,
        upperBound: UInt4
    ) {
        let isBetween: Bool = value.isBetween(
            lowerBound,
            and: upperBound
        )
        #expect(isBetween == (value > lowerBound && value < upperBound))
    }
}
