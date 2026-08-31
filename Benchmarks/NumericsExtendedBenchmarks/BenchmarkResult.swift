// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

internal struct BenchmarkResult {
    internal let name: String
    internal let medianNanosecondsPerOperation: Double
    internal let samplesNanosecondsPerOperation: Array<Double>

    internal init(
        name: String,
        medianNanosecondsPerOperation: Double,
        samplesNanosecondsPerOperation: Array<Double>
    ) {
        self.name = name
        self.medianNanosecondsPerOperation = medianNanosecondsPerOperation
        self.samplesNanosecondsPerOperation = samplesNanosecondsPerOperation
    }
}

// MARK: - Codable

extension BenchmarkResult: Codable {}
