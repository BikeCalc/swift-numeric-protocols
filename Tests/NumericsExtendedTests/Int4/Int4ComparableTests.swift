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
    @Test(
        "Is less than",
        arguments: [
            (1, 1, false),
            (2, 1, false),
            (1, 2, true),
            (-1, 1, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isLessThan(
        lhs: Int4,
        rhs: Int4,
        result: Bool
    ) {
        #expect(lhs.isLess(than: rhs) == result)
    }

    @Test(
        "Is less than or equal",
        arguments: [
            (2, 1, false),
            (1, 1, true),
            (1, 2, true),
            (-1, 1, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isLessThanOrEqualTo(
        lhs: Int4,
        rhs: Int4,
        result: Bool
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == result)
    }

    @Test(
        "Is greater than",
        arguments: [
            (1, 1, false),
            (1, 2, false),
            (2, 1, true),
            (1, -1, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isGreaterThan(
        lhs: Int4,
        rhs: Int4,
        result: Bool
    ) {
        #expect(lhs.isGreater(than: rhs) == result)
    }

    @Test(
        "Is greater than or equal",
        arguments: [
            (1, 2, false),
            (1, 1, true),
            (2, 1, true),
            (1, -1, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isGreaterThanOrEqualTo(
        lhs: Int4,
        rhs: Int4,
        result: Bool
    ) {
        #expect(lhs.isGreaterThanOrEqual(to: rhs) == result)
    }

    @Test(
        "Is within closed range",
        arguments: [
            (1, 1...3, true),
            (2, 1...3, true),
            (3, 1...3, true),
            (4, 1...3, false),
            (-1, -2...2, true)
        ] as Array<(Int4, ClosedRange<Int4>, Bool)>
    )
    internal func isWithinClosedRange(
        value: Int4,
        range: ClosedRange<Int4>,
        result: Bool
    ) {
        #expect(value.isWithin(range) == result)
    }

    @Test(
        "Is within bounds",
        arguments: [
            (1, 1, 3, true),
            (2, 1, 3, true),
            (3, 1, 3, true),
            (4, 1, 3, false),
            (-1, -2, 2, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func isWithinBounds(
        value: Int4,
        lowerBound: Int4,
        upperBound: Int4,
        result: Bool
    ) {
        #expect(value.isWithin(lowerBound, through: upperBound) == result)
    }

    @Test(
        "Is between bounds",
        arguments: [
            (1, 1, 3, false),
            (2, 1, 3, true),
            (3, 1, 3, false),
            (4, 1, 3, false),
            (-1, -2, 2, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func isBetweenBounds(
        value: Int4,
        lowerBound: Int4,
        upperBound: Int4,
        result: Bool
    ) {
        #expect(value.isBetween(lowerBound, and: upperBound) == result)
    }
}
