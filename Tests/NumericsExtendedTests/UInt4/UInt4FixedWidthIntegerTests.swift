//
// UInt4FixedWidthIntegerTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 FixedWidthInteger Tests")
internal struct UInt4FixedWidthIntegerTests {
    @Test("Has four bits")
    internal func hasFourBits() {
        #expect(UInt4.bitWidth == 4)
    }

    @Test("Is unsigned")
    internal func isUnsigned() {
        #expect(UInt4.isSigned == false)
    }

    @Test(
        "Nonzero bit count succeeds",
        arguments: [
            (0b0000, 0),
            (0b1010, 2),
            (0b1111, 4)
        ] as Array<(UInt4, Int)>
    )
    internal func nonzeroBitCountSucceeds(
        value: UInt4,
        count: Int
    ) {
        #expect(value.nonzeroBitCount == count)
    }

    @Test(
        "Leading zero bit count succeeds",
        arguments: [
            (0b0000, 4),
            (0b0001, 3),
            (0b0100, 1),
            (0b1000, 0)
        ] as Array<(UInt4, Int)>
    )
    internal func leadingZeroBitCountSucceeds(
        value: UInt4,
        count: Int
    ) {
        #expect(value.leadingZeroBitCount == count)
    }

    @Test(
        "Byte swapped succeeds",
        arguments: [
            0,
            5,
            15
        ] as Array<UInt4>
    )
    internal func byteSwappedSucceeds(value: UInt4) {
        #expect(value.byteSwapped == value)
    }

    @Test(
        "Initialized truncating if needed succeeds",
        arguments: [
            (-1, 15),
            (15, 15),
            (16, 0),
            (31, 15)
        ] as Array<(Int, UInt4)>
    )
    internal func initializedTruncatingIfNeededSucceeds(
        source: Int,
        value: UInt4
    ) {
        #expect(UInt4(truncatingIfNeeded: source) == value)
    }

    @Test(
        "Initialized clamping succeeds",
        arguments: [
            (-1, 0),
            (7, 7),
            (16, 15)
        ] as Array<(Int, UInt4)>
    )
    internal func initializedClampingSucceeds(
        source: Int,
        value: UInt4
    ) {
        #expect(UInt4(clamping: source) == value)
    }

    @Test(
        "Multiplied full width succeeds",
        arguments: [
            (3, 5, 0, 15),
            (15, 15, 14, 1)
        ] as Array<(UInt4, UInt4, UInt4, UInt4)>
    )
    internal func multipliedFullWidthSucceeds(
        lhs: UInt4,
        rhs: UInt4,
        high: UInt4,
        low: UInt4
    ) {
        let result = lhs.multipliedFullWidth(by: rhs)

        #expect(result.high == high)
        #expect(result.low == low)
    }

    @Test(
        "Dividing full width succeeds",
        arguments: [
            (12, 10, 11, 14, 3),
            (15, 14, 1, 15, 0)
        ] as Array<(UInt4, UInt4, UInt4, UInt4, UInt4)>
    )
    internal func dividingFullWidthSucceeds(
        divisor: UInt4,
        high: UInt4,
        low: UInt4,
        quotient: UInt4,
        remainder: UInt4
    ) {
        let result = divisor.dividingFullWidth((high: high, low: low))

        #expect(result.quotient == quotient)
        #expect(result.remainder == remainder)
    }
}
