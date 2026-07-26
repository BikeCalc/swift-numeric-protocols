// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

#if canImport(Foundation)
import Foundation
import Testing
@testable import NumericsExtended

@Suite("UInt4 Codable Tests")
internal struct UInt4CodableTests {
    @Test(
        "Encode to JSON succeeds",
        arguments: [
            (0, "0"),
            (1, "1"),
            (15, "15")
        ] as Array<(UInt4, String)>
    )
    internal func encodeToJSONSucceeds(
        value: UInt4,
        json: String
    ) throws {
        let encoder: JSONEncoder = .init()
        let result: Data = try encoder.encode(value)
        let data: Data? = json.data(using: .utf8)

        #expect(result == data)
    }

    @Test(
        "Decode from JSON succeeds",
        arguments: [
            ("0", 0),
            ("1", 1),
            ("15", 15)
        ] as Array<(String, UInt4)>
    )
    internal func decodeFromJSONSucceeds(
        json: String,
        value: UInt4
    ) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()
        let result: UInt4 = try decoder.decode(UInt4.self, from: data)

        #expect(result == value)
    }

    @Test(
        "Decode from JSON throws",
        arguments: [
            "-1",
            "16",
            "\"1\"",
            "true"
        ]
    )
    internal func decodeFromJSONThrows(json: String) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()

        #expect(throws: DecodingError.self) {
            try decoder.decode(UInt4.self, from: data)
        }
    }
}
#endif
