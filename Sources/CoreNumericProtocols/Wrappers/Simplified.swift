// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A property wrapper that keeps its value in a simplified representation.
@propertyWrapper
public struct Simplified<Value>
where Value: Simplifiable {
    /// The simplified stored value.
    private var value: Value

    /// Creates a wrapper containing the simplified representation of the specified value.
    ///
    /// - Parameter wrappedValue: The value to simplify and store.
    public init(wrappedValue: Value) {
        self.value = wrappedValue.simplified()
    }

    /// The wrapped value, simplified whenever it is assigned.
    public var wrappedValue: Value {
        get {
            return self.value
        }
        set (newValue) {
            self.value = newValue.simplified()
        }
    }
}

// MARK: - Decodable

extension Simplified: Decodable
where Value: Decodable {
    /// Creates a wrapper by decoding and simplifying a value.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: Any error thrown while decoding `Value`.
    public init(from decoder: any Decoder) throws {
        let value: Value = try .init(from: decoder)
        self.init(wrappedValue: value)
    }
}

// MARK: - Encodable

extension Simplified: Encodable
where Value: Encodable {
    /// Encodes the simplified wrapped value.
    ///
    /// - Parameter encoder: The encoder to write data to.
    /// - Throws: Any error thrown while encoding `Value`.
    public func encode(to encoder: any Encoder) throws {
        try self.wrappedValue.encode(to: encoder)
    }
}

// MARK: - Equatable

extension Simplified: Equatable
where Value: Equatable {}

// MARK: - Hashable

extension Simplified: Hashable
where Value: Hashable {}

// MARK: - Sendable

extension Simplified: Sendable
where Value: Sendable {}
