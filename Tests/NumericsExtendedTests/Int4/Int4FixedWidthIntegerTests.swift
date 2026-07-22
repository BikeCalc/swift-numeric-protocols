//
// Int4FixedWidthIntegerTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 FixedWidthInteger Tests")
internal struct Int4FixedWidthIntegerTests {
    @Test("Has four bits")
    internal func hasFourBits() {
        #expect(Int4.bitWidth == 4)
    }

    @Test("Is signed")
    internal func isSigned() {
        #expect(Int4.isSigned == true)
    }

    @Test(
        "Nonzero bit count succeeds",
        arguments: [
            (0, 0),
            (5, 2),
            (-1, 4),
            (-8, 1)
        ] as Array<(Int4, Int)>
    )
    internal func nonzeroBitCountSucceeds(
        value: Int4,
        count: Int
    ) {
        #expect(value.nonzeroBitCount == count)
    }

    @Test(
        "Leading zero bit count succeeds",
        arguments: [
            (0, 4),
            (1, 3),
            (4, 1),
            (7, 1),
            (-1, 0),
            (-8, 0)
        ] as Array<(Int4, Int)>
    )
    internal func leadingZeroBitCountSucceeds(
        value: Int4,
        count: Int
    ) {
        #expect(value.leadingZeroBitCount == count)
    }

    @Test(
        "Byte swapped succeeds",
        arguments: [
            -8,
            0,
            7
        ] as Array<Int4>
    )
    internal func byteSwappedSucceeds(value: Int4) {
        #expect(value.byteSwapped == value)
    }

    @Test(
        "Initialized truncating if needed succeeds",
        arguments: [
            (-9, 7),
            (-8, -8),
            (-1, -1),
            (7, 7),
            (8, -8),
            (15, -1),
            (16, 0)
        ] as Array<(Int, Int4)>
    )
    internal func initializedTruncatingIfNeededSucceeds(
        source: Int,
        value: Int4
    ) {
        #expect(Int4(truncatingIfNeeded: source) == value)
    }

    @Test(
        "Initialized clamping succeeds",
        arguments: [
            (-9, -8),
            (-8, -8),
            (0, 0),
            (7, 7),
            (8, 7)
        ] as Array<(Int, Int4)>
    )
    internal func initializedClampingSucceeds(
        source: Int,
        value: Int4
    ) {
        #expect(Int4(clamping: source) == value)
    }

    @Test(
        "Multiplied full width succeeds",
        arguments: [
            (3, 2, 0, 6),
            (-8, 7, -4, 8),
            (-8, -8, 4, 0)
        ] as Array<(Int4, Int4, Int4, UInt4)>
    )
    internal func multipliedFullWidthSucceeds(
        lhs: Int4,
        rhs: Int4,
        high: Int4,
        low: UInt4
    ) {
        let result = lhs.multipliedFullWidth(by: rhs)

        #expect(result.high == high)
        #expect(result.low == low)
    }

    @Test(
        "Dividing full width succeeds",
        arguments: [
            (3, 1, 0, 5, 1),
            (-3, -1, 0, 5, -1)
        ] as Array<(Int4, Int4, UInt4, Int4, Int4)>
    )
    internal func dividingFullWidthSucceeds(
        divisor: Int4,
        high: Int4,
        low: UInt4,
        quotient: Int4,
        remainder: Int4
    ) {
        let result = divisor.dividingFullWidth((high: high, low: low))

        #expect(result.quotient == quotient)
        #expect(result.remainder == remainder)
    }
}
