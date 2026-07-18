//
// DoubleDivisibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Divisible Tests")
internal struct DoubleDivisibleTests {
    @Test(
        "Reciprocal",
        arguments: [
            (0.0, nil),
            (-0.0, nil),
            (1.0, 1.0),
            (-1.0, -1.0),
            (2.0, 0.5),
            (-2.0, -0.5)
        ]
    )
    internal func reciprocal(
        dividend: Double,
        result: Double?
    ) {
        #expect(dividend.reciprocal == result)
    }

    @Test(
        "Is invertible",
        arguments: [
            (0.0, false),
            (-0.0, false),
            (1.0, true),
            (-1.0, true),
            (2.0, true),
            (-2.0, true)
        ]
    )
    internal func isInvertible(
        dividend: Double,
        result: Bool
    ) {
        #expect(dividend.isInvertible == result)
    }

    @Test(
        "Is divisible by",
        arguments: [
            (0.0, 0.0, false),
            (0.0, 3.0, true),
            (3.0, 0.0, false),
            (3.0, 1.0, true),
            (6.0, 2.0, true),
            (7.0, 2.0, false),
            (-6.0, 2.0, true),
            (6.0, -2.0, true)
        ]
    )
    internal func isDivisibleBy(
        dividend: Double,
        divisor: Double,
        result: Bool
    ) {
        #expect(dividend.isDivisible(by: divisor) == result)
    }

    @Test(
        "Is factor of",
        arguments: [
            (0.0, 3.0, false),
            (1.0, 2.0, true),
            (2.0, 6.0, true),
            (2.0, 7.0, false),
            (-2.0, 6.0, true),
            (2.0, -6.0, true)
        ]
    )
    internal func isFactorOf(
        factor: Double,
        value: Double,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: [
            (0.0, 1.0, 0.0),
            (6.0, 2.0, 3.0),
            (-6.0, 2.0, -3.0),
            (6.0, -2.0, -3.0),
            (-6.0, -2.0, 3.0)
        ]
    )
    internal func divisionSucceeds(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: [
            (0.0, 1.0, 0.0),
            (6.0, 2.0, 3.0),
            (-6.0, 2.0, -3.0),
            (6.0, -2.0, -3.0),
            (-6.0, -2.0, 3.0)
        ]
    )
    internal func divisionEqualSucceeds(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        var runningQuotient: Double = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Dividing by succeeds",
        arguments: [
            (0.0, 1.0, 0.0),
            (6.0, 2.0, 3.0),
            (-6.0, 2.0, -3.0),
            (6.0, -2.0, -3.0),
            (-6.0, -2.0, 3.0)
        ]
    )
    internal func dividingBySucceeds(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: [
            (0.0, 1.0, 0.0),
            (6.0, 2.0, 3.0),
            (-6.0, 2.0, -3.0),
            (6.0, -2.0, -3.0),
            (-6.0, -2.0, 3.0)
        ]
    )
    internal func divideBySucceeds(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        var runningQuotient: Double = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Halved succeeds",
        arguments: [
            (0.0, 0.0),
            (1.0, 0.5),
            (-1.0, -0.5)
        ]
    )
    internal func halvedSucceeds(
        dividend: Double,
        quotient: Double
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: [
            (0.0, 0.0),
            (1.0, 0.5),
            (-1.0, -0.5)
        ]
    )
    internal func halveSucceeds(
        dividend: Double,
        quotient: Double
    ) {
        var runningQuotient: Double = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension DoubleDivisibleTests {
    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            1.0,
            -1.0,
            3.0
        ]
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Double) {
        #expect(0 / divisor == 0)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            (0.0, 0.0),
            (1.0, 1.0),
            (-1.0, -1.0),
            (5.0, 5.0),
            (-5.0, -5.0)
        ]
    )
    internal func dividingByOnePreservesDividend(
        dividend: Double,
        quotient: Double
    ) {
        #expect(dividend / 1.0 == quotient)
    }
    
    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (7.0, 2.0, 1.0),
            (-7.0, 2.0, -1.0),
            (7.0, -2.0, 1.0),
            (-7.0, -2.0, -1.0)
        ]
    )
    internal func remainderFollowsDividendSign(
        dividend: Double,
        divisor: Double,
        remainder: Double
    ) {
        #expect(dividend % divisor == remainder)
    }
}

// MARK: - Floating-Point Rules

extension DoubleDivisibleTests {
    @Test(
        "Reciprocal of infinity follows floating-point rules",
        arguments: [
            (Double.infinity, 0.0),
            (Double.negativeInfinity, -0.0)
        ]
    )
    internal func reciprocalOfInfinityFollowsFloatingPointRules(
        value: Double,
        result: Double?
    ) {
        #expect(value.reciprocal == result)
    }

    @Test("Reciprocal of negative infinity preserves negative zero sign")
    internal func reciprocalOfNegativeInfinityPreservesNegativeZeroSign() {
        let reciprocal: Double? = Double.negativeInfinity.reciprocal

        #expect(reciprocal == 0.0)
        #expect(reciprocal?.sign == .minus)
    }

    @Test(
        "Reciprocal of zero returns nil",
        arguments: [
            0.0,
            -0.0
        ]
    )
    internal func reciprocalOfZeroReturnsNil(value: Double) {
        #expect(value.reciprocal == nil)
    }

    @Test(
        "Invertibility follows floating-point rules",
        arguments: [
            (Double.infinity, true),
            (Double.negativeInfinity, true),
            (Double.nan, false)
        ]
    )
    internal func invertibilityFollowsFloatingPointRules(
        value: Double,
        result: Bool
    ) {
        #expect(value.isInvertible == result)
    }

    @Test(
        "Dividing zero follows floating-point rules",
        arguments: [
            (0.0, 1.0, 0.0),
            (-0.0, 1.0, -0.0),
            (0.0, -1.0, -0.0),
            (-0.0, -1.0, 0.0)
        ]
    )
    internal func dividingZeroFollowsFloatingPointRules(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Dividing zero preserves negative zero sign",
        arguments: [
            (-0.0, 1.0),
            (0.0, -1.0)
        ]
    )
    internal func dividingZeroPreservesNegativeZeroSign(
        dividend: Double,
        divisor: Double
    ) {
        let quotient: Double = dividend / divisor

        #expect(quotient == 0.0)
        #expect(quotient.sign == .minus)
    }

    @Test(
        "Dividing by zero follows floating-point rules",
        arguments: [
            (1.0, 0.0, Double.infinity),
            (-1.0, 0.0, Double.negativeInfinity),
            (1.0, -0.0, Double.negativeInfinity),
            (-1.0, -0.0, Double.infinity)
        ]
    )
    internal func dividingByZeroFollowsFloatingPointRules(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Dividing zero by zero returns NaN",
        arguments: [
            (0.0, 0.0),
            (-0.0, 0.0),
            (0.0, -0.0),
            (-0.0, -0.0)
        ]
    )
    internal func dividingZeroByZeroReturnsNaN(
        dividend: Double,
        divisor: Double
    ) {
        #expect((dividend / divisor).isNaN)
    }

    @Test(
        "Dividing infinity follows floating-point rules",
        arguments: [
            (Double.infinity, 1.0, Double.infinity),
            (Double.infinity, -1.0, Double.negativeInfinity),
            (Double.negativeInfinity, 1.0, Double.negativeInfinity),
            (Double.negativeInfinity, -1.0, Double.infinity)
        ]
    )
    internal func dividingInfinityFollowsFloatingPointRules(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Dividing by infinity follows floating-point rules",
        arguments: [
            (1.0, Double.infinity, 0.0),
            (1.0, Double.negativeInfinity, -0.0),
            (-1.0, Double.infinity, -0.0),
            (-1.0, Double.negativeInfinity, 0.0)
        ]
    )
    internal func dividingByInfinityFollowsFloatingPointRules(
        dividend: Double,
        divisor: Double,
        quotient: Double
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Dividing by infinity preserves negative zero sign",
        arguments: [
            (1.0, Double.negativeInfinity),
            (-1.0, Double.infinity)
        ]
    )
    internal func dividingByInfinityPreservesNegativeZeroSign(
        dividend: Double,
        divisor: Double
    ) {
        let quotient: Double = dividend / divisor

        #expect(quotient == 0.0)
        #expect(quotient.sign == .minus)
    }

    @Test(
        "Dividing infinities returns NaN",
        arguments: [
            (Double.infinity, Double.infinity),
            (Double.infinity, Double.negativeInfinity),
            (Double.negativeInfinity, Double.infinity),
            (Double.negativeInfinity, Double.negativeInfinity)
        ]
    )
    internal func dividingInfinitiesReturnsNaN(
        dividend: Double,
        divisor: Double
    ) {
        #expect((dividend / divisor).isNaN)
    }

    @Test(
        "Dividing NaN returns NaN",
        arguments: [
            (Double.nan, Double.nan),
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.infinity)
        ]
    )
    internal func dividingNaNReturnsNaN(
        dividend: Double,
        divisor: Double
    ) {
        #expect((dividend / divisor).isNaN)
    }
}
