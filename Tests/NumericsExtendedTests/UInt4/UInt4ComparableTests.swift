//
// UInt4ComparableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Comparable Tests")
internal struct UInt4ComparableTests {
    @Test(
        "Is less than",
        arguments: [
            (1, 1, false),
            (2, 1, false),
            (1, 2, true)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isLessThan(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isLess(than: rhs) == result)
    }

    @Test(
        "Is less than or equal",
        arguments: [
            (2, 1, false),
            (1, 1, true),
            (1, 2, true)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isLessThanOrEqualTo(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isLessThanOrEqual(to: rhs) == result)
    }

    @Test(
        "Is greater than",
        arguments: [
            (1, 1, false),
            (1, 2, false),
            (2, 1, true)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isGreaterThan(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isGreater(than: rhs) == result)
    }

    @Test(
        "Is greater than or equal",
        arguments: [
            (1, 2, false),
            (1, 1, true),
            (2, 1, true)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isGreaterThanOrEqualTo(
        lhs: UInt4,
        rhs: UInt4,
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
            (4, 1...3, false)
        ] as Array<(UInt4, ClosedRange<UInt4>, Bool)>
    )
    internal func isWithinClosedRange(
        value: UInt4,
        range: ClosedRange<UInt4>,
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
            (4, 1, 3, false)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func isWithinBounds(
        value: UInt4,
        lowerBound: UInt4,
        upperBound: UInt4,
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
            (4, 1, 3, false)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func isBetweenBounds(
        value: UInt4,
        lowerBound: UInt4,
        upperBound: UInt4,
        result: Bool
    ) {
        #expect(value.isBetween(lowerBound, and: upperBound) == result)
    }
}
