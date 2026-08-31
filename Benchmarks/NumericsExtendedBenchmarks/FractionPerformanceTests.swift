// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import NumericsExtended
import XCTest

internal final class FractionPerformanceTests: XCTestCase {
    private let iterations: Int = 10_000

    internal func testAdditionPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(8_765, 4_321)

        self.measureOperation {
            lhs + rhs
        }
    }

    internal func testSubtractionPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(8_765, 4_321)

        self.measureOperation {
            lhs - rhs
        }
    }

    internal func testMultiplicationPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(8_765, 4_321)

        self.measureOperation {
            lhs * rhs
        }
    }

    internal func testDivisionPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(8_765, 4_321)

        self.measureOperation {
            lhs / rhs
        }
    }

    internal func testNegationPerformance() {
        let value: Fraction<Int> = .init(1_234, 5_679)

        self.measureOperation {
            -value
        }
    }

    internal func testExponentiationPerformance() {
        let value: Fraction<Int> = .init(12, 17)

        self.measureOperation {
            value ** 5
        }
    }

    internal func testEqualityPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(1_234, 5_679)

        self.measureOperation {
            lhs == rhs
        }
    }

    internal func testLessThanComparisonPerformance() {
        let lhs: Fraction<Int> = .init(1_234, 5_679)
        let rhs: Fraction<Int> = .init(8_765, 4_321)

        self.measureOperation {
            lhs < rhs
        }
    }

    internal func testCanonicalizationPerformance() {
        let value: Fraction<Int> = .init(123_456, -789_012)

        self.measureOperation {
            value.canonicalized()
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
