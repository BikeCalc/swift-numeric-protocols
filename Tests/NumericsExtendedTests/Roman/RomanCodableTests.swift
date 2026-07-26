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

@Suite("Roman Codable Tests")
internal struct RomanCodableTests {
    @Test(
        "Encode to JSON succeeds",
        arguments: [
            (0, "\"N\""),
            (1, "\"I\""),
            (4, "\"IV\""),
            (16, "\"XVI\""),
            (3999, "\"MMMCMXCIX\"")
        ] as Array<(Roman, String)>
    )
    internal func encodeToJSONSucceeds(
        value: Roman,
        json: String
    ) throws {
        let encoder: JSONEncoder = .init()
        let result: Data = try encoder.encode(value)
        let data: Data? = json.data(using: .utf8)

        #expect(result == data)
    }

    @Test(
        "Decode from JSON string succeeds",
        arguments: [
            ("\"N\"", 0),
            ("\"I\"", 1),
            ("\"IV\"", 4),
            ("\"XVI\"", 16),
            ("\"MMMCMXCIX\"", 3999)
        ] as Array<(String, Roman)>
    )
    internal func decodeFromJSONStringSucceeds(
        json: String,
        value: Roman
    ) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()
        let result: Roman = try decoder.decode(Roman.self, from: data)

        #expect(result == value)
    }

    @Test(
        "Decode from JSON integer succeeds",
        arguments: [
            ("0", 0),
            ("1", 1),
            ("4", 4),
            ("16", 16),
            ("3999", 3999)
        ] as Array<(String, Roman)>
    )
    internal func decodeFromJSONIntegerSucceeds(
        json: String,
        value: Roman
    ) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()
        let result: Roman = try decoder.decode(Roman.self, from: data)

        #expect(result == value)
    }

    @Test(
        "Decode from JSON throws",
        arguments: [
            "\"\"",
            "\"-1\"",
            "\"4000\"",
            "\"IIII\"",
            "\"IXI\"",
            "\"ABC\"",
            "-1",
            "4000",
            "true"
        ]
    )
    internal func decodeFromJSONThrows(json: String) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()

        #expect(throws: DecodingError.self) {
            try decoder.decode(Roman.self, from: data)
        }
    }
}
#endif
