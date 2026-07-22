//
// Int4CodableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(Foundation)
import Foundation
import Testing
@testable import NumericsExtended

@Suite("Int4 Codable Tests")
internal struct Int4CodableTests {
    @Test(
        "Encode to JSON succeeds",
        arguments: [
            (-8, "-8"),
            (-1, "-1"),
            (0, "0"),
            (7, "7")
        ] as Array<(Int4, String)>
    )
    internal func encodeToJSONSucceeds(
        value: Int4,
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
            ("-8", -8),
            ("-1", -1),
            ("0", 0),
            ("7", 7)
        ] as Array<(String, Int4)>
    )
    internal func decodeFromJSONSucceeds(
        json: String,
        value: Int4
    ) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()
        let result: Int4 = try decoder.decode(Int4.self, from: data)

        #expect(result == value)
    }

    @Test(
        "Decode from JSON throws",
        arguments: [
            "-9",
            "8",
            "\"1\"",
            "true"
        ]
    )
    internal func decodeFromJSONThrows(json: String) throws {
        let data: Data = try #require(json.data(using: .utf8))
        let decoder: JSONDecoder = .init()

        #expect(throws: DecodingError.self) {
            try decoder.decode(Int4.self, from: data)
        }
    }
}
#endif
