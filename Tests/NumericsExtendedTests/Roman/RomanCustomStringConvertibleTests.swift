//
// RomanCustomStringConvertibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman CustomStringConvertible Tests")
internal struct RomanCustomStringConvertibleTests {
    @Test(
        "Description succeeds",
        arguments: [
            (0, "N"),
            (00, "N"),
            (01, "I"),
            (1, "I"),
            (3, "III"),
            (4, "IV"),
            (9, "IX"),
            (16, "XVI"),
            (44, "XLIV"),
            (90, "XC"),
            (400, "CD"),
            (900, "CM"),
            (3999, "MMMCMXCIX")
        ] as Array<(Roman, String)>
    )
    internal func descriptionSucceeds(
        value: Roman,
        description: String
    ) {
        #expect(value.description == description)
    }
}
