// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Divisible Tests")
internal struct DoubleDivisibleTests {
    private static let divisionArguments: [(Double, Double, Double)] = [
        (6.0, 2.0, 3.0),
        (6.0, 3.0, 2.0),
        (-6.0, 2.0, -3.0),
        (-6.0, -3.0, 2.0),
        (1.5, 0.5, 3.0),
        (3.75, 1.5, 2.5),
        (-1.5, 0.5, -3.0),
        (-3.75, -1.5, 2.5)
    ]

    private static let remainderArguments: [(Double, Double, Double)] = [
        (4.0, 2.0, 0.0),
        (5.0, 2.0, 1.0),
        (-5.0, 2.0, -1.0),
        (-5.0, -2.0, -1.0),
        (1.5, 0.5, 0.0),
        (1.75, 0.5, 0.25),
        (-1.75, 0.5, -0.25),
        (-1.75, -0.5, -0.25)
    ]

    private static let halvingArguments: [(Double, Double)] = [
        (6.0, 3.0),
        (4.0, 2.0),
        (-6.0, -3.0),
        (-4.0, -2.0),
        (1.5, 0.75),
        (3.75, 1.875),
        (-1.5, -0.75),
        (-3.75, -1.875)
    ]

    @Test(
        "Reciprocal",
        arguments: [
            (2.0, 0.5),
            (4.0, 0.25),
            (-2.0, -0.5),
            (-4.0, -0.25),
            (0.5, 2.0),
            (0.25, 4.0),
            (-0.5, -2.0),
            (-0.25, -4.0)
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
            2.0,
            3.0,
            -2.0,
            -3.0,
            0.5,
            1.5,
            -0.5,
            -1.5
        ]
    )
    internal func isInvertible(dividend: Double) {
        #expect(dividend.isInvertible)
    }

    @Test(
        "Is divisible by",
        arguments: [
            (6.0, 3.0, true),
            (7.0, 3.0, false),
            (-6.0, 3.0, true),
            (-7.0, 3.0, false),
            (1.5, 0.5, true),
            (1.5, 2.5, false),
            (-1.5, 0.5, true),
            (-1.5, 2.5, false)
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
            (3.0, 6.0, true),
            (3.0, 7.0, false),
            (3.0, -6.0, true),
            (3.0, -7.0, false),
            (0.5, 1.5, true),
            (2.5, 1.5, false),
            (0.5, -1.5, true),
            (2.5, -1.5, false)
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
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        "Remainder succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderSucceeds(
        dividend: Double,
        divisor: Double,
        remainder: Double
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderEqualSucceeds(
        dividend: Double,
        divisor: Double,
        remainder: Double
    ) {
        var runningRemainder: Double = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Dividing by succeeds",
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        arguments: Self.halvingArguments
    )
    internal func halvedSucceeds(
        dividend: Double,
        quotient: Double
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: Self.halvingArguments
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
        "Zero is not invertible",
        arguments: [
            0.0,
            -0.0
        ]
    )
    internal func zeroIsNotInvertible(dividend: Double) {
        #expect(dividend.isInvertible == false)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            2.0,
            -3.0,
            3.0,
            0.5,
            1.5,
            -1.5
        ]
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Double) {
        #expect(0 / divisor == 0)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            6.0,
            4.0,
            -6.0,
            -4.0,
            1.5,
            3.75,
            -1.5,
            -3.75
        ]
    )
    internal func dividingByOnePreservesDividend(dividend: Double) {
        #expect(dividend / 1.0 == dividend)
    }

    @Test(
        "Dividing by negative one returns opposite value",
        arguments: [
            (6.0, -6.0),
            (4.0, -4.0),
            (-6.0, 6.0),
            (-4.0, 4.0),
            (1.5, -1.5),
            (3.75, -3.75),
            (-1.5, 1.5),
            (-3.75, 3.75)
        ]
    )
    internal func dividingByNegativeOneReturnsOppositeValue(
        dividend: Double,
        quotient: Double
    ) {
        #expect(dividend / -1.0 == quotient)
    }

    @Test(
        "Remainder by self returns zero",
        arguments: [
            6.0,
            4.0,
            -6.0,
            -4.0,
            1.5,
            3.75,
            -1.5,
            -3.75
        ]
    )
    internal func remainderBySelfReturnsZero(value: Double) {
        #expect(value % value == 0.0)
    }

    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (5.0, 2.0, 1.0),
            (-5.0, 2.0, -1.0),
            (5.0, -2.0, 1.0),
            (-5.0, -2.0, -1.0)
        ]
    )
    internal func remainderFollowsDividendSign(
        dividend: Double,
        divisor: Double,
        remainder: Double
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Division is not commutative",
        arguments: Self.divisionArguments
    )
    internal func divisionIsNotCommutative(
        dividend: Double,
        divisor: Double,
        quotient _: Double
    ) {
        #expect(dividend / divisor != divisor / dividend)
    }
}

// MARK: - Floating-Point Rules

extension DoubleDivisibleTests {
    @Test(
        "Nonfinite operands are not divisible",
        arguments: [
            (Double.infinity, 2.0),
            (Double.negativeInfinity, 2.0),
            (Double.nan, 2.0),
            (2.0, Double.infinity),
            (2.0, Double.negativeInfinity),
            (2.0, Double.nan),
            (0.0, Double.infinity),
            (-0.0, Double.negativeInfinity)
        ]
    )
    internal func nonfiniteOperandsAreNotDivisible(
        dividend: Double,
        divisor: Double
    ) {
        #expect(dividend.isDivisible(by: divisor) == false)
    }

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
            Double.nan,
            1.0,
            -1.0,
            Double.infinity,
            Double.negativeInfinity
        ]
    )
    internal func dividingNaNReturnsNaN(divisor: Double) {
        #expect((Double.nan / divisor).isNaN)
    }

    @Test(
        "Dividing by NaN returns NaN",
        arguments: [
            Double.nan,
            1.0,
            -1.0,
            Double.infinity,
            Double.negativeInfinity
        ]
    )
    internal func dividingByNaNReturnsNaN(dividend: Double) {
        #expect((dividend / Double.nan).isNaN)
    }
}
