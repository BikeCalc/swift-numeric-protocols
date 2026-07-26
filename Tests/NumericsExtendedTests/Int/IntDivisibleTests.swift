// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int Divisible Tests")
internal struct IntDivisibleTests {
    private static let divisionArguments: [(Int, Int, Int)] = [
        (6, 2, 3),
        (6, 3, 2),
        (-6, 2, -3),
        (-6, -3, 2)
    ]

    private static let remainderArguments: [(Int, Int, Int)] = [
        (4, 2, 0),
        (5, 2, 1),
        (-5, 2, -1),
        (-5, -2, -1)
    ]

    private static let halvingArguments: [(Int, Int)] = [
        (6, 3),
        (4, 2),
        (-6, -3),
        (-4, -2)
    ]

    @Test(
        "Parity predicates",
        arguments: [
            (0, true),
            (1, false),
            (2, true),
            (3, false),
            (-1, false),
            (-2, true),
            (-3, false)
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
        "Is divisible by",
        arguments: [
            (6, 3, true),
            (7, 3, false),
            (-6, 3, true),
            (-7, 3, false)
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
            (3, 6, true),
            (3, 7, false),
            (3, -6, true),
            (3, -7, false)
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
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        "Remainder succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderSucceeds(
        dividend: Int,
        divisor: Int,
        remainder: Int
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderEqualSucceeds(
        dividend: Int,
        divisor: Int,
        remainder: Int
    ) {
        var runningRemainder: Int = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Dividing by succeeds",
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        arguments: Self.halvingArguments
    )
    internal func halvedSucceeds(
        dividend: Int,
        quotient: Int
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: Self.halvingArguments
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
        "Zero is not invertible",
        arguments: [
            0,
            -0
        ]
    )
    internal func zeroIsNotInvertible(dividend: Int) {
        #expect(dividend.isInvertible == false)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            2,
            -3,
            3
        ]
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Int) {
        #expect(0 / divisor == 0)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            6,
            4,
            -6,
            -4
        ]
    )
    internal func dividingByOnePreservesDividend(dividend: Int) {
        #expect(dividend / 1 == dividend)
    }

    @Test(
        "Dividing by negative one returns opposite value",
        arguments: [
            (6, -6),
            (4, -4),
            (-6, 6),
            (-4, 4)
        ]
    )
    internal func dividingByNegativeOneReturnsOppositeValue(
        dividend: Int,
        quotient: Int
    ) {
        #expect(dividend / -1 == quotient)
    }

    @Test(
        "Remainder by self returns zero",
        arguments: [
            6,
            4,
            -6,
            -4
        ]
    )
    internal func remainderBySelfReturnsZero(value: Int) {
        #expect(value % value == 0)
    }

    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (5, 2, 1),
            (-5, 2, -1),
            (5, -2, 1),
            (-5, -2, -1)
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
        arguments: Self.divisionArguments
    )
    internal func divisionIsNotCommutative(
        dividend: Int,
        divisor: Int,
        quotient _: Int
    ) {
        #expect(dividend / divisor != divisor / dividend)
    }
}

// MARK: - Integer Rules

extension IntDivisibleTests {
    @Test(
        "Only one is invertible",
        arguments: [
            (1, true),
            (-1, true),
            (2, false),
            (-2, false)
        ]
    )
    internal func onlyOneIsInvertible(
        dividend: Int,
        result: Bool
    ) {
        #expect(dividend.isInvertible == result)
    }

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
        "Remainder by one returns zero",
        arguments: [
            6,
            4,
            -6,
            -4
        ]
    )
    internal func remainderByOneReturnsZero(dividend: Int) {
        #expect(dividend % 1 == 0)
    }

    @Test(
        "Integer division truncates toward zero",
        arguments: [
            (7, 3, 2),
            (-7, 3, -2),
            (7, -3, -2),
            (-7, -3, 2)
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
