//
// Int4DivisibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Divisible Tests")
internal struct Int4DivisibleTests {
    private static let divisionArguments: [(Int4, Int4, Int4)] = [
        (6, 2, 3),
        (6, 3, 2),
        (-6, 2, -3),
        (-6, -3, 2)
    ]

    private static let remainderArguments: [(Int4, Int4, Int4)] = [
        (4, 2, 0),
        (5, 2, 1),
        (-5, 2, -1),
        (-5, -2, -1)
    ]

    private static let halvingArguments: [(Int4, Int4)] = [
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
        ] as Array<(Int4, Bool)>
    )
    internal func parityPredicates(
        value: Int4,
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
        ] as Array<(Int4, Int4?)>
    )
    internal func reciprocal(
        dividend: Int4,
        result: Int4?
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
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isDivisibleBy(
        dividend: Int4,
        divisor: Int4,
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
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isFactorOf(
        factor: Int4,
        value: Int4,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: Self.divisionArguments
    )
    internal func divisionSucceeds(
        dividend: Int4,
        divisor: Int4,
        quotient: Int4
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: Self.divisionArguments
    )
    internal func divisionEqualSucceeds(
        dividend: Int4,
        divisor: Int4,
        quotient: Int4
    ) {
        var runningQuotient: Int4 = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Dividing by succeeds",
        arguments: Self.divisionArguments
    )
    internal func dividingBySucceeds(
        dividend: Int4,
        divisor: Int4,
        quotient: Int4
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: Self.divisionArguments
    )
    internal func divideBySucceeds(
        dividend: Int4,
        divisor: Int4,
        quotient: Int4
    ) {
        var runningQuotient: Int4 = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Remainder succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderSucceeds(
        dividend: Int4,
        divisor: Int4,
        remainder: Int4
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderEqualSucceeds(
        dividend: Int4,
        divisor: Int4,
        remainder: Int4
    ) {
        var runningRemainder: Int4 = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Halved succeeds",
        arguments: Self.halvingArguments
    )
    internal func halvedSucceeds(
        dividend: Int4,
        quotient: Int4
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: Self.halvingArguments
    )
    internal func halveSucceeds(
        dividend: Int4,
        quotient: Int4
    ) {
        var runningQuotient: Int4 = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension Int4DivisibleTests {
    @Test(
        "Zero is not invertible",
        arguments: [
            0,
            -0
        ] as Array<Int4>
    )
    internal func zeroIsNotInvertible(dividend: Int4) {
        #expect(dividend.isInvertible == false)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            2,
            -3,
            3
        ] as Array<Int4>
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Int4) {
        #expect(Int4.zero / divisor == 0)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            6,
            4,
            -6,
            -4
        ] as Array<Int4>
    )
    internal func dividingByOnePreservesDividend(dividend: Int4) {
        #expect(dividend / 1 == dividend)
    }

    @Test(
        "Dividing by negative one returns opposite value",
        arguments: [
            (6, -6),
            (4, -4),
            (-6, 6),
            (-4, 4)
        ] as Array<(Int4, Int4)>
    )
    internal func dividingByNegativeOneReturnsOppositeValue(
        dividend: Int4,
        quotient: Int4
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
        ] as Array<Int4>
    )
    internal func remainderBySelfReturnsZero(value: Int4) {
        #expect(value % value == 0)
    }

    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (5, 2, 1),
            (-5, 2, -1),
            (5, -2, 1),
            (-5, -2, -1)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func remainderFollowsDividendSign(
        dividend: Int4,
        divisor: Int4,
        remainder: Int4
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Division is not commutative",
        arguments: Self.divisionArguments
    )
    internal func divisionIsNotCommutative(
        dividend: Int4,
        divisor: Int4,
        quotient _: Int4
    ) {
        #expect(dividend / divisor != divisor / dividend)
    }
}

// MARK: - Integer Rules

extension Int4DivisibleTests {
    @Test(
        "Only one is invertible",
        arguments: [
            (1, true),
            (-1, true),
            (2, false),
            (-2, false)
        ] as Array<(Int4, Bool)>
    )
    internal func onlyOneIsInvertible(
        dividend: Int4,
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
        ] as Array<(Int4, Int4)>
    )
    internal func halvingOddValuesTruncatesTowardZero(
        dividend: Int4,
        quotient: Int4
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
        ] as Array<Int4>
    )
    internal func remainderByOneReturnsZero(dividend: Int4) {
        #expect(dividend % 1 == 0)
    }

    @Test(
        "Integer division truncates toward zero",
        arguments: [
            (7, 3, 2),
            (-7, 3, -2),
            (7, -3, -2),
            (-7, -3, 2)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func integerDivisionTruncatesTowardZero(
        dividend: Int4,
        divisor: Int4,
        quotient: Int4
    ) {
        #expect(dividend / divisor == quotient)
    }
}
