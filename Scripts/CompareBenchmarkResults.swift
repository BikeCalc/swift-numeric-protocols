#!/usr/bin/env swift

// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Foundation

private let operationsPerSample: Double = 10_000
private let measurementPattern: NSRegularExpression = try .init(
    pattern: #"Test Case '-\[([^]]+)]' measured \[Clock Monotonic Time, s] .*?values: \[([^]]+)]"#
)

private enum ComparisonError: Error, CustomStringConvertible {
    case invalidArguments
    case missingMeasurements(URL)

    var description: String {
        switch self {
        case .invalidArguments:
            return "Usage: CompareBenchmarkResults.swift --current <path> [--target <path>]"
        case .missingMeasurements(let url):
            return "No XCTest wall-clock measurements found in \(url.path)"
        }
    }
}

private struct Arguments {
    let currentURL: URL
    let targetURL: URL?

    init(_ arguments: [String]) throws {
        var currentURL: URL?
        var targetURL: URL?
        var index: Int = 0

        while index < arguments.count {
            guard index + 1 < arguments.count else {
                throw ComparisonError.invalidArguments
            }

            let url: URL = .init(fileURLWithPath: arguments[index + 1])

            switch arguments[index] {
            case "--current":
                currentURL = url
            case "--target":
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

private func measurements(at url: URL) throws -> [String: Double] {
    let contents: String = try .init(contentsOf: url, encoding: .utf8)
    let range: NSRange = .init(contents.startIndex..., in: contents)
    var measurements: [String: Double] = [:]

    measurementPattern.enumerateMatches(
        in: contents,
        range: range
    ) { match, _, _ in
        guard
            let match,
            let identifierRange = Range(match.range(at: 1), in: contents),
            let valuesRange = Range(match.range(at: 2), in: contents)
        else {
            return
        }

        let identifier: Substring = contents[identifierRange]
        let components: [Substring] = identifier.split(
            separator: " ",
            maxSplits: 1
        )

        guard components.count == 2 else {
            return
        }

        let owner: Substring = components[0]
        let suite: Substring = owner.split(separator: ".").last ?? owner
        let values: [Double] = contents[valuesRange]
            .split(separator: ",")
            .compactMap { value in
                Double(value.trimmingCharacters(in: .whitespaces))
            }

        guard values.isEmpty == false else {
            return
        }

        measurements["\(suite).\(components[1])"] = values.reduce(0, +) / Double(values.count)
    }

    guard measurements.isEmpty == false else {
        throw ComparisonError.missingMeasurements(url)
    }

    return measurements
}

private func nanosecondsPerOperation(_ seconds: Double) -> Double {
    return seconds * 1_000_000_000 / operationsPerSample
}

private func formattedNanoseconds(_ seconds: Double) -> String {
    return String(
        format: "%.2f ns",
        nanosecondsPerOperation(seconds)
    )
}

private func printSummary(
    current: [String: Double],
    target: [String: Double]?
) {
    print("## Benchmark performance comparison")
    print()
    print("Each value is the mean duration per operation across ten measured samples.")
    print()

    guard let target else {
        print("No comparable target measurement is available, so only the current revision is shown.")
        print()
        print("| Benchmark | Current |")
        print("|---|---:|")

        for name in current.keys.sorted() {
            guard let currentValue = current[name] else {
                continue
            }

            print("| `\(name)` | \(formattedNanoseconds(currentValue)) |")
        }

        return
    }

    print("Positive changes are slower; negative changes are faster.")
    print()
    print("| Benchmark | Target | Current | Change |")
    print("|---|---:|---:|---:|")

    for name in Set(current.keys).union(target.keys).sorted() {
        let currentValue: Double? = current[name]
        let targetValue: Double? = target[name]

        switch (targetValue, currentValue) {
        case (.some(let targetValue), nil):
            print("| `\(name)` | \(formattedNanoseconds(targetValue)) | — | Removed |")
        case (nil, .some(let currentValue)):
            print("| `\(name)` | — | \(formattedNanoseconds(currentValue)) | Added |")
        case (.some(let targetValue), .some(let currentValue)):
            let difference: String

            if targetValue == 0 {
                difference = "—"
            } else {
                let percentage: Double = (currentValue - targetValue) / targetValue * 100
                difference = String(format: "%+.2f%%", percentage)
            }

            print(
                "| `\(name)` | \(formattedNanoseconds(targetValue)) | "
                    + "\(formattedNanoseconds(currentValue)) | \(difference) |"
            )
        case (nil, nil):
            continue
        }
    }
}

do {
    let arguments: Arguments = try .init(Array(CommandLine.arguments.dropFirst()))
    let current: [String: Double] = try measurements(at: arguments.currentURL)
    let target: [String: Double]? = try arguments.targetURL.map(measurements(at:))

    printSummary(
        current: current,
        target: target
    )
} catch {
    FileHandle.standardError.write(Data("\(error)\n".utf8))
    exit(EXIT_FAILURE)
}
