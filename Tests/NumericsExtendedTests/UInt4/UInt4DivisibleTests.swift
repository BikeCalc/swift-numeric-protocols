//
// UInt4DivisibleTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Divisible Tests")
internal struct UInt4DivisibleTests {
    @Test(
        "Parity predicates",
        arguments: [
            (1, false),
            (2, true)
        ] as Array<(UInt4, Bool)>
    )
    internal func parityPredicates(
        value: UInt4,
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
        ] as Array<(UInt4, UInt4?)>
    )
    internal func reciprocal(
        dividend: UInt4,
        result: UInt4?
    ) {
        #expect(dividend.reciprocal == result)
    }

    @Test(
        "Is invertible",
        arguments: [
            (1, true),
            (2, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func isInvertible(
        dividend: UInt4,
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
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isDivisibleBy(
        dividend: UInt4,
        divisor: UInt4,
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
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isFactorOf(
        factor: UInt4,
        value: UInt4,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func divisionSucceeds(
        dividend: UInt4,
        divisor: UInt4,
        quotient: UInt4
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func divisionEqualSucceeds(
        dividend: UInt4,
        divisor: UInt4,
        quotient: UInt4
    ) {
        var runningQuotient: UInt4 = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Dividing by succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func dividingBySucceeds(
        dividend: UInt4,
        divisor: UInt4,
        quotient: UInt4
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: [
            (6, 2, 3),
            (7, 2, 3)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func divideBySucceeds(
        dividend: UInt4,
        divisor: UInt4,
        quotient: UInt4
    ) {
        var runningQuotient: UInt4 = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Halved succeeds",
        arguments: [
            (2, 1),
            (4, 2)
        ] as Array<(UInt4, UInt4)>
    )
    internal func halvedSucceeds(
        dividend: UInt4,
        quotient: UInt4
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: [
            (2, 1),
            (4, 2)
        ] as Array<(UInt4, UInt4)>
    )
    internal func halveSucceeds(
        dividend: UInt4,
        quotient: UInt4
    ) {
        var runningQuotient: UInt4 = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension UInt4DivisibleTests {
    @Test(
        "Halving odd values truncates toward zero",
        arguments: [
            (1, 0),
            (3, 1),
            (5, 2)
        ] as Array<(UInt4, UInt4)>
    )
    internal func halvingOddValuesTruncatesTowardZero(
        dividend: UInt4,
        quotient: UInt4
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            1,
            2
        ] as Array<UInt4>
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: UInt4) {
        #expect(UInt4.zero / divisor == 0)
    }

    @Test(
        "Division is not commutative",
        arguments: [
            (6, 2),
            (7, 2)
        ] as Array<(UInt4, UInt4)>
    )
    internal func divisionIsNotCommutative(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs / rhs != rhs / lhs)
    }
}
