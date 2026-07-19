//
// UInt4CodableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
            (9, "9"),
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
            ("9", 9),
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
