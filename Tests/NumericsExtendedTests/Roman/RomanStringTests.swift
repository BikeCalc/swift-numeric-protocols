//
// RomanStringTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman String Tests")
internal struct RomanStringTests {
    @Test(
        "Is Roman symbol",
        arguments: [
            ("", false),
            ("N", true),
            ("I", true),
            ("IV", true),
            ("V", true),
            ("IX", true),
            ("X", true),
            ("XL", true),
            ("L", true),
            ("XC", true),
            ("C", true),
            ("CD", true),
            ("D", true),
            ("CM", true),
            ("M", true),
            ("II", false),
            ("VI", false),
            ("MMM", false),
            ("A", false),
            ("z", false)
        ]
    )
    internal func isRomanSymbol(
        string: String,
        result: Bool
    ) {
        #expect(string.isRomanSymbol == result)
    }

    @Test(
        "Is Roman numeral",
        arguments: [
            ("", false),
            ("N", true),
            ("I", true),
            ("II", true),
            ("III", true),
            ("IV", true),
            ("V", true),
            ("VI", true),
            ("VIII", true),
            ("IX", true),
            ("X", true),
            ("XIV", true),
            ("XVI", true),
            ("XL", true),
            ("XLIV", true),
            ("XC", true),
            ("CD", true),
            ("CM", true),
            ("MMMCMXCIX", true),
            ("IN", false),
            ("NI", false),
            ("NN", false),
            ("IIII", false),
            ("VV", false),
            ("LL", false),
            ("DD", false),
            ("IVIV", false),
            ("IIV", false),
            ("IXI", false),
            ("VIIII", false),
            ("VX", false),
            ("IC", false),
            ("IL", false),
            ("XXXX", false),
            ("XD", false),
            ("XM", false),
            ("MCMC", false),
            ("MMMM", false),
            ("ABC", false),
            ("iv", false)
        ]
    )
    internal func isRomanNumeral(
        string: String,
        result: Bool
    ) {
        #expect(string.isRomanNumeral == result)
    }
}
