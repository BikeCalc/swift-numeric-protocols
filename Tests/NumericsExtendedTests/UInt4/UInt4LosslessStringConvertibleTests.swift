//
// UInt4LosslessStringConvertibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 LosslessStringConvertible Tests")
internal struct UInt4LosslessStringConvertibleTests {
    @Test(
        "Initialized with string succeeds",
        arguments: [
            ("0", 0),
            ("1", 1),
            ("15", 15)
        ] as Array<(String, UInt4)>
    )
    internal func initializedWithStringSucceeds(
        description: String,
        value: UInt4
    ) {
        #expect(UInt4(description) == value)
    }

    @Test(
        "Initialized with string fails",
        arguments: [
            "",
            "-1",
            "16",
            "abc",
            "1.0"
        ]
    )
    internal func initializedWithStringFails(description: String) {
        #expect(UInt4(description) == nil)
    }
}
