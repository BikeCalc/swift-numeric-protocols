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

@Suite("Canonicalized Fraction Encodable Tests")
internal struct CanonicalizedFractionEncodableTests {
    @Test(
        "Encode to JSON succeeds",
        arguments: [
            (Fraction<Int>(1, 2), #"{"den":2,"num":1}"#),
            (Fraction<Int>(2, 4), #"{"den":2,"num":1}"#),
            (Fraction<Int>(2, -4), #"{"den":2,"num":-1}"#)
        ]
    )
    internal func encodeToJSONSucceeds(
        value: Fraction<Int>,
        json: String
    ) throws {
        @Canonicalized var canonicalizedValue: Fraction<Int> = value
        let encoder: JSONEncoder = .init()
        encoder.outputFormatting = .sortedKeys

        let result: Data = try encoder.encode(_canonicalizedValue)
        let expected: Data = try #require(json.data(using: .utf8))

        #expect(result == expected)
    }

    @Test("Zero encodes to JSON")
    internal func zeroEncodesToJSON() throws {
        @Canonicalized var value: Fraction<Int> = .init(0, -2)
        let encoder: JSONEncoder = .init()
        encoder.outputFormatting = .sortedKeys

        let result: Data = try encoder.encode(_value)
        let expected: Data = try #require(#"{"den":1,"num":0}"#.data(using: .utf8))

        #expect(result == expected)
    }

    @Test("Positive infinity encodes to JSON")
    internal func positiveInfinityEncodesToJSON() throws {
        @Canonicalized var value: Fraction<Int> = .infinity
        let encoder: JSONEncoder = .init()
        encoder.outputFormatting = .sortedKeys

        let result: Data = try encoder.encode(_value)
        let expected: Data = try #require(#"{"den":0,"num":1}"#.data(using: .utf8))

        #expect(result == expected)
    }

    @Test("Negative infinity encodes to JSON")
    internal func negativeInfinityEncodesToJSON() throws {
        @Canonicalized var value: Fraction<Int> = .negativeInfinity
        let encoder: JSONEncoder = .init()
        encoder.outputFormatting = .sortedKeys

        let result: Data = try encoder.encode(_value)
        let expected: Data = try #require(#"{"den":0,"num":-1}"#.data(using: .utf8))

        #expect(result == expected)
    }

    @Test("NaN encodes to JSON")
    internal func nanEncodesToJSON() throws {
        @Canonicalized var value: Fraction<Int> = .nan
        let encoder: JSONEncoder = .init()
        encoder.outputFormatting = .sortedKeys

        let result: Data = try encoder.encode(_value)
        let expected: Data = try #require(#"{"den":0,"num":0}"#.data(using: .utf8))

        #expect(result == expected)
    }
}
#endif
