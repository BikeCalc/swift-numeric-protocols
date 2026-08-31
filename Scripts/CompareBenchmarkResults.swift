// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Foundation

fileprivate enum ComparisonError {
    case duplicateBenchmark(String, URL)
    case incompatibleConfiguration(URL, URL)
    case incompatibleFormat(URL)
    case invalidArguments
}

extension ComparisonError: CustomStringConvertible {
    fileprivate var description: String {
        switch self {
        case .duplicateBenchmark(let name, let url):
            return "Duplicate benchmark '\(name)' in \(url.path)"
        case .incompatibleConfiguration(let currentURL, let targetURL):
            return "Benchmark configurations differ between \(currentURL.path) and \(targetURL.path)"
        case .incompatibleFormat(let url):
            return "Unsupported benchmark report format in \(url.path)"
        case .invalidArguments:
            return "Usage: CompareBenchmarkResults.swift --current <path> [--target <path>]"
        }
    }
}

extension ComparisonError: Error {}

fileprivate struct Arguments {
    fileprivate let currentURL: URL
    fileprivate let targetURL: URL?

    fileprivate init(_ arguments: Array<String>) throws {
        var currentURL: URL?
        var targetURL: URL?
        var index: Int = 0

        while index < arguments.count {
            guard index + 1 < arguments.count else {
                throw ComparisonError.invalidArguments
            }

            let url: URL = .init(fileURLWithPath: arguments[index + 1])

            switch arguments[index] {
            case "--current" where currentURL == nil:
                currentURL = url
            case "--target" where targetURL == nil:
                targetURL = url
            default:
                throw ComparisonError.invalidArguments
            }

            index += 2
        }

        guard let currentURL else {
            throw ComparisonError.invalidArguments
        }

        self.currentURL = currentURL
        self.targetURL = targetURL
    }
}

fileprivate struct BenchmarkReport {
    fileprivate let formatVersion: Int
    fileprivate let iterationsPerSample: Int
    fileprivate let measuredSamples: Int
    fileprivate let results: Array<BenchmarkResult>

    fileprivate init(
        formatVersion: Int,
        iterationsPerSample: Int,
        measuredSamples: Int,
        results: Array<BenchmarkResult>
    ) {
        self.formatVersion = formatVersion
        self.iterationsPerSample = iterationsPerSample
        self.measuredSamples = measuredSamples
        self.results = results
    }
}

extension BenchmarkReport: Decodable {}

fileprivate struct BenchmarkResult {
    fileprivate let name: String
    fileprivate let medianNanosecondsPerOperation: Double

    fileprivate init(
        name: String,
        medianNanosecondsPerOperation: Double
    ) {
        self.name = name
        self.medianNanosecondsPerOperation = medianNanosecondsPerOperation
    }
}

extension BenchmarkResult: Decodable {}

fileprivate struct BenchmarkComparator {
    private let current: Dictionary<String, Double>
    private let target: Dictionary<String, Double>?
    private let measuredSamples: Int

    fileprivate init(
        currentURL: URL,
        targetURL: URL?
    ) throws {
        let currentReport: BenchmarkReport = try Self.report(at: currentURL)

        self.current = try Self.results(
            in: currentReport,
            at: currentURL
        )
        self.measuredSamples = currentReport.measuredSamples

        if let targetURL {
            let targetReport: BenchmarkReport = try Self.report(at: targetURL)

            guard currentReport.iterationsPerSample == targetReport.iterationsPerSample
                && currentReport.measuredSamples == targetReport.measuredSamples
            else {
                throw ComparisonError.incompatibleConfiguration(currentURL, targetURL)
            }

            self.target = try Self.results(
                in: targetReport,
                at: targetURL
            )
        } else {
            self.target = nil
        }
    }

    fileprivate func print() {
        Swift.print("## Benchmark performance comparison")
        Swift.print()
        Swift.print(
            "Each value is the median duration per operation across \(self.measuredSamples) measured "
                + "\(self.measuredSamples == 1 ? "sample" : "samples")."
        )
        Swift.print()

        guard let target else {
            Swift.print("No comparable target measurement is available, so only the current revision is shown.")
            Swift.print()
            Swift.print("| Benchmark | Current |")
            Swift.print("|---|---:|")

            for name in self.current.keys.sorted() {
                guard let currentValue = self.current[name] else {
                    continue
                }

                Swift.print("| `\(name)` | \(String(format: "%.2f ns", currentValue)) |")
            }

            return
        }

        Swift.print("Positive changes are slower; negative changes are faster.")
        Swift.print()
        Swift.print("| Benchmark | Target | Current | Change |")
        Swift.print("|---|---:|---:|---:|")

        for name in Set(self.current.keys).union(target.keys).sorted() {
            let currentValue: Double? = self.current[name]
            let targetValue: Double? = target[name]

            switch (targetValue, currentValue) {
            case (.some(let targetValue), nil):
                Swift.print("| `\(name)` | \(String(format: "%.2f ns", targetValue)) | — | Removed |")
            case (nil, .some(let currentValue)):
                Swift.print("| `\(name)` | — | \(String(format: "%.2f ns", currentValue)) | Added |")
            case (.some(let targetValue), .some(let currentValue)):
                let difference: String

                if targetValue == 0 {
                    difference = "—"
                } else {
                    let percentage: Double = (currentValue - targetValue) / targetValue * 100
                    difference = String(format: "%+.2f%%", percentage)
                }

                Swift.print(
                    "| `\(name)` | \(String(format: "%.2f ns", targetValue)) | "
                        + "\(String(format: "%.2f ns", currentValue)) | \(difference) |"
                )
            case (nil, nil):
                continue
            }
        }
    }

    private static func report(at url: URL) throws -> BenchmarkReport {
        let data: Data = try .init(contentsOf: url)
        let decoder: JSONDecoder = .init()
        let report: BenchmarkReport = try decoder.decode(
            BenchmarkReport.self,
            from: data
        )

        guard report.formatVersion == 1 else {
            throw ComparisonError.incompatibleFormat(url)
        }

        return report
    }

    private static func results(
        in report: BenchmarkReport,
        at url: URL
    ) throws -> Dictionary<String, Double> {
        var results: Dictionary<String, Double> = [:]

        for result in report.results {
            guard results.updateValue(result.medianNanosecondsPerOperation, forKey: result.name) == nil else {
                throw ComparisonError.duplicateBenchmark(result.name, url)
            }
        }

        return results
    }
}

do {
    let arguments: Arguments = try .init(Array(CommandLine.arguments.dropFirst()))
    let comparator: BenchmarkComparator = try .init(
        currentURL: arguments.currentURL,
        targetURL: arguments.targetURL
    )

    comparator.print()
} catch let error {
    FileHandle.standardError.write(Data("\(error)\n".utf8))
    exit(EXIT_FAILURE)
}
