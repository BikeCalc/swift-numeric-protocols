// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import NumericsExtended
import XCTest

internal final class CanonicalizedFractionPerformanceTests: XCTestCase {
    private let iterations: Int = 10_000

    internal func testAdditionPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(1_234, 5_679)
            result += .init(8_765, 4_321)
            return result
        }
    }

    internal func testSubtractionPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(1_234, 5_679)
            result -= .init(8_765, 4_321)
            return result
        }
    }

    internal func testMultiplicationPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(1_234, 5_679)
            result *= .init(8_765, 4_321)
            return result
        }
    }

    internal func testDivisionPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(1_234, 5_679)
            result /= .init(8_765, 4_321)
            return result
        }
    }

    internal func testNegationPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(1_234, 5_679)
            result.negate()
            return result
        }
    }

    internal func testExponentiationPerformance() {
        self.measureOperation {
            @Canonicalized var result: Fraction<Int> = .init(12, 17)
            result **= 5
            return result
        }
    }

    internal func testEqualityPerformance() {
        let lhs: Canonicalized<Fraction<Int>> = .init(wrappedValue: .init(1_234, 5_679))
        let rhs: Canonicalized<Fraction<Int>> = .init(wrappedValue: .init(1_234, 5_679))

        self.measureOperation {
            lhs == rhs
        }
    }

    internal func testLessThanComparisonPerformance() {
        let lhs: Canonicalized<Fraction<Int>> = .init(wrappedValue: .init(1_234, 5_679))
        let rhs: Canonicalized<Fraction<Int>> = .init(wrappedValue: .init(8_765, 4_321))

        self.measureOperation {
            lhs < rhs
        }
    }

    private func measureOperation<Result>(_ operation: () -> Result) {
        let options: XCTMeasureOptions = .init()
        options.iterationCount = 10

        self.measure(
            metrics: [
                XCTClockMetric()
            ],
            options: options
        ) {
            for _ in 0 ..< self.iterations {
                withExtendedLifetime(operation()) {}
            }
        }
    }
}
