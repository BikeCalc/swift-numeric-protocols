//
// UInt4CustomStringConvertibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 CustomStringConvertible Tests")
internal struct UInt4CustomStringConvertibleTests {
    @Test(
        "Description succeeds",
        arguments: [
            (0, "0"),
            (1, "1"),
            (9, "9"),
            (10, "10"),
            (15, "15")
        ] as Array<(UInt4, String)>
    )
    internal func descriptionSucceeds(
        value: UInt4,
        description: String
    ) {
        #expect(value.description == description)
    }
}
