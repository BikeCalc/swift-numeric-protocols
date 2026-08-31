// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
internal struct BenchmarkRunner {
    private let clock: ContinuousClock = .init()
    private let iterationsPerSample: Int
    private let measuredSamples: Int
    private let warmupSamples: Int

    internal init(
        iterationsPerSample: Int = 10_000,
        measuredSamples: Int = 10,
        warmupSamples: Int = 1
    ) {
        self.iterationsPerSample = iterationsPerSample
        self.measuredSamples = measuredSamples
        self.warmupSamples = warmupSamples
    }

    internal func run(_ benchmarks: Array<Benchmark>) -> BenchmarkReport {
        let results: Array<BenchmarkResult> = benchmarks.map(self.run)

        return .init(
            formatVersion: 1,
            iterationsPerSample: self.iterationsPerSample,
            measuredSamples: self.measuredSamples,
            results: results
        )
    }

    private func run(_ benchmark: Benchmark) -> BenchmarkResult {
        for _ in 0 ..< self.warmupSamples {
            self.perform(benchmark.operation)
        }

        let samples: Array<Double> = (0 ..< self.measuredSamples).map { _ in
            let duration: Duration = self.clock.measure {
                self.perform(benchmark.operation)
            }

            return duration.nanoseconds / Double(self.iterationsPerSample)
        }

        return .init(
            name: benchmark.name,
            medianNanosecondsPerOperation: self.median(samples),
            samplesNanosecondsPerOperation: samples
        )
    }

    private func perform(_ operation: @Sendable () -> Void) {
        for _ in 0 ..< self.iterationsPerSample {
            operation()
        }
    }

    private func median(_ values: Array<Double>) -> Double {
        let sortedValues: Array<Double> = values.sorted()
        let middleIndex: Int = sortedValues.count / 2

        if sortedValues.count.isMultiple(of: 2) {
            return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2
        }

        return sortedValues[middleIndex]
    }
}
