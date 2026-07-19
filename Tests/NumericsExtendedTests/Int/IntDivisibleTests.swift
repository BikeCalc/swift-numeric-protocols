//
// IntDivisibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Divisible Tests")
internal struct IntDivisibleTests {
    @Test(
        "Parity predicates",
        arguments: [
            (1, false),
            (2, true),
            (-1, false),
            (-2, true)
        ]
    )
    internal func parityPredicates(
        value: Int,
        result: Bool
    ) {
        #expect(value.isEven == result)
        #expect(value.isOdd == !result)
    }

    @Test(
        "Reciprocal",
        arguments: [
            (1, 1),
            (-1, -1),
            (2, nil),
            (-2, nil)
        ]
    )
    internal func reciprocal(
        dividend: Int,
        result: Int?
    ) {
        #expect(dividend.reciprocal == result)
    }

    @Test(
        "Is invertible",
        arguments: [
            (1, true),
            (-1, true),
            (2, false),
            (-2, false)
        ]
    )
    internal func isInvertible(
        dividend: Int,
        result: Bool
    ) {
        #expect(dividend.isInvertible == result)
    }

    @Test(
        "Is divisible by",
        arguments: [
            (3, 1, true),
            (6, 2, true),
            (7, 2, false),
            (-6, 2, true),
            (6, -2, true)
        ]
    )
    internal func isDivisibleBy(
        dividend: Int,
        divisor: Int,
        result: Bool
    ) {
        #expect(dividend.isDivisible(by: divisor) == result)
    }

    @Test(
        "Is factor of",
        arguments: [
            (1, 2, true),
            (2, 6, true),
            (2, 7, false),
            (-2, 6, true),
            (2, -6, true)
        ]
    )
    internal func isFactorOf(
        factor: Int,
        value: Int,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: [
            (6, 2, 3),
            (-6, 2, -3),
            (6, -2, -3),
            (-6, -2, 3)
        ]
    )
    internal func divisionSucceeds(
        dividend: Int,
        divisor: Int,
        quotient: Int
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: [
            (6, 2, 3),
            (-6, 2, -3),
            (6, -2, -3),
            (-6, -2, 3)
        ]
    )
    internal func divisionEqualSucceeds(
        dividend: Int,
        divisor: Int,
        quotient: Int
    ) {
        var runningQuotient: Int = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Dividing by succeeds",
        arguments: [
            (6, 2, 3),
            (-6, 2, -3),
            (6, -2, -3),
            (-6, -2, 3)
        ]
    )
    internal func dividingBySucceeds(
        dividend: Int,
        divisor: Int,
        quotient: Int
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: [
            (6, 2, 3),
            (-6, 2, -3),
            (6, -2, -3),
            (-6, -2, 3)
        ]
    )
    internal func divideBySucceeds(
        dividend: Int,
        divisor: Int,
        quotient: Int
    ) {
        var runningQuotient: Int = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Halved succeeds",
        arguments: [
            (2, 1),
            (-2, -1),
            (4, 2),
            (-4, -2)
        ]
    )
    internal func halvedSucceeds(
        dividend: Int,
        quotient: Int
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: [
            (2, 1),
            (-2, -1),
            (4, 2),
            (-4, -2)
        ]
    )
    internal func halveSucceeds(
        dividend: Int,
        quotient: Int
    ) {
        var runningQuotient: Int = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension IntDivisibleTests {
    @Test(
        "Halving odd values truncates toward zero",
        arguments: [
            (1, 0),
            (-1, 0),
            (3, 1),
            (-3, -1),
            (5, 2),
            (-5, -2)
        ]
    )
    internal func halvingOddValuesTruncatesTowardZero(
        dividend: Int,
        quotient: Int
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            1,
            -1,
            3
        ]
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Int) {
        #expect(0 / divisor == 0)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            (0, 0),
            (1, 1),
            (-1, -1),
            (5, 5),
            (-5, -5)
        ]
    )
    internal func dividingByOnePreservesDividend(
        dividend: Int,
        quotient: Int
    ) {
        #expect(dividend / 1 == quotient)
    }
    
    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (7, 2, 1),
            (-7, 2, -1),
            (7, -2, 1),
            (-7, -2, -1)
        ]
    )
    internal func remainderFollowsDividendSign(
        dividend: Int,
        divisor: Int,
        remainder: Int
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Division is not commutative",
        arguments: [
            (6, 2),
            (-6, 2),
            (6, -2)
        ]
    )
    internal func divisionIsNotCommutative(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs / rhs != rhs / lhs)
    }
}

// MARK: - Integer Rules

extension IntDivisibleTests {
    @Test(
        "Integer division truncates toward zero",
        arguments: [
            (7, 2, 3),
            (-7, 2, -3),
            (7, -2, -3),
            (-7, -2, 3)
        ]
    )
    internal func integerDivisionTruncatesTowardZero(
        dividend: Int,
        divisor: Int,
        quotient: Int
    ) {
        #expect(dividend / divisor == quotient)
    }
}
