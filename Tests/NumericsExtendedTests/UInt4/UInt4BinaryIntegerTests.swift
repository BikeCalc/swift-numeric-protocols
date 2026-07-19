//
// UInt4BinaryIntegerTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 BinaryInteger Tests")
internal struct UInt4BinaryIntegerTests {
    @Test(
        "Words succeeds",
        arguments: [
            (0, 0),
            (7, 7),
            (15, 15)
        ] as Array<(UInt4, UInt)>
    )
    internal func wordsSucceeds(
        value: UInt4,
        word: UInt
    ) {
        #expect(value.words.count == 1)
        #expect(value.words.startIndex == 0)
        #expect(value.words.endIndex == 1)
        #expect(value.words[value.words.startIndex] == word)
        #expect(Array(value.words) == [word])
    }

    @Test(
        "Trailing zero bit count succeeds",
        arguments: [
            (0, 4),
            (1, 0),
            (4, 2),
            (8, 3)
        ] as Array<(UInt4, Int)>
    )
    internal func trailingZeroBitCountSucceeds(
        value: UInt4,
        count: Int
    ) {
        #expect(value.trailingZeroBitCount == count)
    }

    @Test(
        "Bitwise and equal succeeds",
        arguments: [
            (0b1010, 0b1100, 0b1000),
            (0b1111, 0b0101, 0b0101)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func bitwiseAndEqualSucceeds(
        value: UInt4,
        mask: UInt4,
        result: UInt4
    ) {
        var maskedValue: UInt4 = value
        maskedValue &= mask
        #expect(maskedValue == result)
    }

    @Test(
        "Bitwise or equal succeeds",
        arguments: [
            (0b1010, 0b0101, 0b1111),
            (0b1000, 0b0011, 0b1011)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func bitwiseOrEqualSucceeds(
        value: UInt4,
        mask: UInt4,
        result: UInt4
    ) {
        var maskedValue: UInt4 = value
        maskedValue |= mask
        #expect(maskedValue == result)
    }

    @Test(
        "Bitwise xor equal succeeds",
        arguments: [
            (0b1010, 0b1100, 0b0110),
            (0b1111, 0b0101, 0b1010)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func bitwiseXorEqualSucceeds(
        value: UInt4,
        mask: UInt4,
        result: UInt4
    ) {
        var maskedValue: UInt4 = value
        maskedValue ^= mask
        #expect(maskedValue == result)
    }

    @Test(
        "Quotient and remainder succeeds",
        arguments: [
            (7, 2, 3, 1),
            (15, 4, 3, 3)
        ] as Array<(UInt4, UInt4, UInt4, UInt4)>
    )
    internal func quotientAndRemainderSucceeds(
        dividend: UInt4,
        divisor: UInt4,
        quotient: UInt4,
        remainder: UInt4
    ) {
        let result = dividend.quotientAndRemainder(dividingBy: divisor)

        #expect(result.quotient == quotient)
        #expect(result.remainder == remainder)
    }
}
