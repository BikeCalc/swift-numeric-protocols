//
// RomanDivisibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Divisible Tests")
internal struct RomanDivisibleTests {
    @Test(
        "Parity predicates",
        arguments: [
            (1, false),
            (2, true)
        ] as Array<(Roman, Bool)>
    )
    internal func parityPredicates(
        value: Roman,
        result: Bool
    ) {
        #expect(value.isEven == result)
        #expect(value.isOdd == !result)
    }

    @Test(
        "Reciprocal",
        arguments: [
            (1, 1),
            (2, nil)
        ] as Array<(Roman, Roman?)>
    )
    internal func reciprocal(
        dividend: Roman,
        result: Roman?
    ) {
        #expect(dividend.reciprocal == result)
    }

    @Test(
        "Is invertible",
        arguments: [
            (1, true),
            (2, false)
        ] as Array<(Roman, Bool)>
    )
    internal func isInvertible(
        dividend: Roman,
        result: Bool
    ) {
        #expect(dividend.isInvertible == result)
    }

    @Test(
        "Is divisible by",
        arguments: [
            (3, 1, true),
            (6, 2, true),
            (7, 2, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func isDivisibleBy(
        dividend: Roman,
        divisor: Roman,
        result: Bool
    ) {
        #expect(dividend.isDivisible(by: divisor) == result)
    }

    @Test(
        "Is factor of",
        arguments: [
            (1, 2, true),
            (2, 6, true),
            (2, 7, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func isFactorOf(
        factor: Roman,
        value: Roman,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func divisionSucceeds(
        dividend: Roman,
        divisor: Roman,
        quotient: Roman
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func divisionEqualSucceeds(
        dividend: Roman,
        divisor: Roman,
        quotient: Roman
    ) {
        var runningQuotient: Roman = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Remainder succeeds",
        arguments: [
            (6, 2, 0),
            (7, 2, 1)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func remainderSucceeds(
        dividend: Roman,
        divisor: Roman,
        remainder: Roman
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: [
            (6, 2, 0),
            (7, 2, 1)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func remainderEqualSucceeds(
        dividend: Roman,
        divisor: Roman,
        remainder: Roman
    ) {
        var runningRemainder: Roman = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Dividing by succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func dividingBySucceeds(
        dividend: Roman,
        divisor: Roman,
        quotient: Roman
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func divideBySucceeds(
        dividend: Roman,
        divisor: Roman,
        quotient: Roman
    ) {
        var runningQuotient: Roman = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Halved succeeds",
        arguments: [
            (2, 1),
            (4, 2)
        ] as Array<(Roman, Roman)>
    )
    internal func halvedSucceeds(
        dividend: Roman,
        quotient: Roman
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: [
            (2, 1),
            (4, 2)
        ] as Array<(Roman, Roman)>
    )
    internal func halveSucceeds(
        dividend: Roman,
        quotient: Roman
    ) {
        var runningQuotient: Roman = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension RomanDivisibleTests {
    @Test(
        "Halving odd values truncates toward zero",
        arguments: [
            (1, 0),
            (3, 1),
            (5, 2)
        ] as Array<(Roman, Roman)>
    )
    internal func halvingOddValuesTruncatesTowardZero(
        dividend: Roman,
        quotient: Roman
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            1,
            3
        ] as Array<Roman>
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: Roman) {
        #expect(0 / divisor == 0)
    }

    @Test(
        "Remainder by one returns zero",
        arguments: [
            1,
            5
        ] as Array<Roman>
    )
    internal func remainderByOneReturnsZero(dividend: Roman) {
        #expect(dividend % 1 == 0)
    }

    @Test(
        "Remainder by self returns zero",
        arguments: [
            1,
            5
        ] as Array<Roman>
    )
    internal func remainderBySelfReturnsZero(value: Roman) {
        #expect(value % value == 0)
    }

    @Test(
        "Division is not commutative",
        arguments: [
            (6, 2),
            (7, 2)
        ] as Array<(Roman, Roman)>
    )
    internal func divisionIsNotCommutative(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs / rhs != rhs / lhs)
    }
}
