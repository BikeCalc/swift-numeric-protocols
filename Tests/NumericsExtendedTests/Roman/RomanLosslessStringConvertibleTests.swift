//
// RomanLosslessStringConvertibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman LosslessStringConvertible Tests")
internal struct RomanLosslessStringConvertibleTests {
    @Test(
        "Initialized with string succeeds",
        arguments: [
            ("0", 0),
            ("1", 1),
            ("4", 4),
            ("16", 16),
            ("3999", 3999),
            ("N", 0),
            ("I", 1),
            ("III", 3),
            ("IV", 4),
            ("IX", 9),
            ("XVI", 16),
            ("XLIV", 44),
            ("XC", 90),
            ("CD", 400),
            ("CM", 900),
            ("MMMCMXCIX", 3999)
        ] as Array<(String, Roman)>
    )
    internal func initializedWithStringSucceeds(
        description: String,
        value: Roman
    ) {
        #expect(Roman(description) == value)
    }

    @Test(
        "Initialized with string fails",
        arguments: [
            "",
            "-1",
            "4000",
            "IN",
            "NI",
            "NN",
            "IIII",
            "VV",
            "LL",
            "DD",
            "IVIV",
            "IIV",
            "IXI",
            "VIIII",
            "VX",
            "IC",
            "IL",
            "XXXX",
            "XD",
            "XM",
            "MCMC",
            "MMMM",
            "ABC",
            "iv"
        ]
    )
    internal func initializedWithStringFails(description: String) {
        #expect(Roman(description) == nil)
    }
}
