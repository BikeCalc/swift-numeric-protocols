// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

internal struct Benchmark {
    internal let name: String
    internal let operation: @Sendable () -> Void

    internal init(
        name: String,
        operation: @escaping @Sendable () -> Void
    ) {
        self.name = name
        self.operation = operation
    }
}

// MARK: - Sendable

extension Benchmark: Sendable {}
