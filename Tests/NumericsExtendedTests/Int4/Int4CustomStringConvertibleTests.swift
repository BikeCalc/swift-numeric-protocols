// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int4 CustomStringConvertible Tests")
internal struct Int4CustomStringConvertibleTests {
    @Test(
        "Description succeeds",
        arguments: [
            (-8, "-8"),
            (-1, "-1"),
            (0, "0"),
            (1, "1"),
            (7, "7")
        ] as Array<(Int4, String)>
    )
    internal func descriptionSucceeds(
        value: Int4,
        description: String
    ) {
        #expect(value.description == description)
    }
}
