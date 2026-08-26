// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Divisible Tests")
internal struct FractionDivisibleTests {
    private static let divisionArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2), Fraction<Int>(2, 2)),
        (Fraction<Int>(1, 2), Fraction<Int>(2, 3), Fraction<Int>(3, 4)),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-2, 3), Fraction<Int>(-3, -4))
    ]

    private static let remainderArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2), Fraction<Int>(0, 2)),
        (Fraction<Int>(2, 3), Fraction<Int>(1, 2), Fraction<Int>(1, 6)),
        (Fraction<Int>(-2, 3), Fraction<Int>(1, 2), Fraction<Int>(-1, 6)),
        (Fraction<Int>(-2, 3), Fraction<Int>(-1, 2), Fraction<Int>(-1, 6))
    ]

    private static let halvingArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 4)),
        (Fraction<Int>(2, 3), Fraction<Int>(2, 6)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-1, 4)),
        (Fraction<Int>(-2, 3), Fraction<Int>(-2, 6))
    ]

    @Test(
        "Reciprocal",
        arguments: [
            (Fraction<Int>(1, 1), Fraction<Int>(1, 1) as Fraction<Int>?),
            (Fraction<Int>(-1, 1), Fraction<Int>(1, -1)),
            (Fraction<Int>(2, 1), Fraction<Int>(1, 2)),
            (Fraction<Int>(-2, 1), Fraction<Int>(1, -2))
        ]
    )
    internal func reciprocal(
        dividend: Fraction<Int>,
        result: Fraction<Int>?
    ) {
        #expect(dividend.reciprocal == result)
    }

    @Test(
        "Is divisible by",
        arguments: [
            (Fraction<Int>(6, 1), Fraction<Int>(3, 1), true),
            (Fraction<Int>(7, 1), Fraction<Int>(3, 1), false),
            (Fraction<Int>(-6, 1), Fraction<Int>(3, 1), true),
            (Fraction<Int>(-7, 1), Fraction<Int>(3, 1), false)
        ]
    )
    internal func isDivisibleBy(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        result: Bool
    ) {
        #expect(dividend.isDivisible(by: divisor) == result)
    }

    @Test(
        "Is factor of",
        arguments: [
            (Fraction<Int>(3, 1), Fraction<Int>(6, 1), true),
            (Fraction<Int>(3, 1), Fraction<Int>(7, 1), false),
            (Fraction<Int>(3, 1), Fraction<Int>(-6, 1), true),
            (Fraction<Int>(3, 1), Fraction<Int>(-7, 1), false)
        ]
    )
    internal func isFactorOf(
        factor: Fraction<Int>,
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(factor.isFactor(of: value) == result)
    }

    @Test(
        "Division succeeds",
        arguments: Self.divisionArguments
    )
    internal func divisionSucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        #expect(dividend / divisor == quotient)
    }

    @Test(
        "Division equal succeeds",
        arguments: Self.divisionArguments
    )
    internal func divisionEqualSucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        var runningQuotient: Fraction<Int> = dividend
        runningQuotient /= divisor
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Remainder succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderSucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        remainder: Fraction<Int>
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderEqualSucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        remainder: Fraction<Int>
    ) {
        var runningRemainder: Fraction<Int> = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Dividing by succeeds",
        arguments: Self.divisionArguments
    )
    internal func dividingBySucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        #expect(dividend.dividing(by: divisor) == quotient)
    }

    @Test(
        "Divide by succeeds",
        arguments: Self.divisionArguments
    )
    internal func divideBySucceeds(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        var runningQuotient: Fraction<Int> = dividend
        runningQuotient.divide(by: divisor)
        #expect(runningQuotient == quotient)
    }

    @Test(
        "Halved succeeds",
        arguments: Self.halvingArguments
    )
    internal func halvedSucceeds(
        dividend: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: Self.halvingArguments
    )
    internal func halveSucceeds(
        dividend: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        var runningQuotient: Fraction<Int> = dividend
        runningQuotient.halve()
        #expect(runningQuotient == quotient)
    }
}

// MARK: - Arithmetic Rules

extension FractionDivisibleTests {
    @Test(
        "Zero is not invertible",
        arguments: [
            Fraction<Int>(0, 1),
            Fraction<Int>(0, -1)
        ]
    )
    internal func zeroIsNotInvertible(dividend: Fraction<Int>) {
        #expect(dividend.isInvertible == false)
    }

    @Test(
        "Dividing zero by nonzero value returns represented zero",
        arguments: [
            Fraction<Int>(2, 1),
            Fraction<Int>(-3, 1),
            Fraction<Int>(3, 1)
        ]
    )
    internal func dividingZeroByNonzeroValueReturnsRepresentedZero(divisor: Fraction<Int>) {
        #expect((Fraction<Int>.zero / divisor).isZero == true)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            Fraction<Int>(6, 1),
            Fraction<Int>(4, 1),
            Fraction<Int>(-6, 1),
            Fraction<Int>(-4, 1)
        ]
    )
    internal func dividingByOnePreservesDividend(dividend: Fraction<Int>) {
        #expect(dividend / 1 == dividend)
    }

    @Test(
        "Dividing by negative one preserves raw quotient terms",
        arguments: [
            (Fraction<Int>(6, 1), Fraction<Int>(6, -1)),
            (Fraction<Int>(4, 1), Fraction<Int>(4, -1)),
            (Fraction<Int>(-6, 1), Fraction<Int>(-6, -1)),
            (Fraction<Int>(-4, 1), Fraction<Int>(-4, -1))
        ]
    )
    internal func dividingByNegativeOnePreservesRawQuotientTerms(
        dividend: Fraction<Int>,
        quotient: Fraction<Int>
    ) {
        #expect(dividend / -1 == quotient)
        #expect(quotient.isCanonicallyEquatable(to: -dividend) == true)
    }

    @Test(
        "Remainder by self returns represented zero",
        arguments: [
            Fraction<Int>(6, 1),
            Fraction<Int>(4, 1),
            Fraction<Int>(-6, 1),
            Fraction<Int>(-4, 1)
        ]
    )
    internal func remainderBySelfReturnsRepresentedZero(dividend: Fraction<Int>) {
        #expect((dividend % dividend).isZero == true)
    }

    @Test(
        "Remainder follows dividend sign",
        arguments: [
            (Fraction<Int>(5, 1), Fraction<Int>(2, 1), Fraction<Int>(1, 1)),
            (Fraction<Int>(-5, 1), Fraction<Int>(2, 1), Fraction<Int>(-1, 1)),
            (Fraction<Int>(5, 1), Fraction<Int>(-2, 1), Fraction<Int>(1, 1)),
            (Fraction<Int>(-5, 1), Fraction<Int>(-2, 1), Fraction<Int>(-1, 1))
        ]
    )
    internal func remainderFollowsDividendSign(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>,
        remainder: Fraction<Int>
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Division is not commutative",
        arguments: [
            (Fraction<Int>(1, 2), Fraction<Int>(2, 3)),
            (Fraction<Int>(-1, 2), Fraction<Int>(1, 2)),
            (Fraction<Int>(-1, 2), Fraction<Int>(-2, 3))
        ]
    )
    internal func divisionIsNotCommutative(
        dividend: Fraction<Int>,
        divisor: Fraction<Int>
    ) {
        #expect(dividend / divisor != divisor / dividend)
    }
}

// MARK: - Rational Rules

extension FractionDivisibleTests {
    // TODO: Rational Rules for FractionDivisibleTests
}
