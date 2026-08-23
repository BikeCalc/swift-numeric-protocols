// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("UInt4 Divisible Tests")
internal struct UInt4DivisibleTests {
    private static let divisionArguments: [(UInt4, UInt4, UInt4)] = [
        (6, 2, 3),
        (6, 3, 2)
    ]

    private static let remainderArguments: [(UInt4, UInt4, UInt4)] = [
        (4, 2, 0),
        (5, 2, 1)
    ]

    private static let halvingArguments: [(UInt4, UInt4)] = [
        (6, 3),
        (4, 2)
    ]

    @Test(
        "Parity predicates",
        arguments: [
            (0, true),
            (1, false),
            (2, true),
            (3, false)
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
        "Is divisible by",
        arguments: [
            (6, 3, true),
            (7, 3, false)
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
            (3, 6, true),
            (3, 7, false)
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
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        "Remainder succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderSucceeds(
        dividend: UInt4,
        divisor: UInt4,
        remainder: UInt4
    ) {
        #expect(dividend % divisor == remainder)
    }

    @Test(
        "Remainder equal succeeds",
        arguments: Self.remainderArguments
    )
    internal func remainderEqualSucceeds(
        dividend: UInt4,
        divisor: UInt4,
        remainder: UInt4
    ) {
        var runningRemainder: UInt4 = dividend
        runningRemainder %= divisor
        #expect(runningRemainder == remainder)
    }

    @Test(
        "Dividing by succeeds",
        arguments: Self.divisionArguments
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
        arguments: Self.divisionArguments
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
        arguments: Self.halvingArguments
    )
    internal func halvedSucceeds(
        dividend: UInt4,
        quotient: UInt4
    ) {
        #expect(dividend.halved() == quotient)
    }

    @Test(
        "Halve succeeds",
        arguments: Self.halvingArguments
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
    @Test("Zero is not invertible")
    internal func zeroIsNotInvertible() {
        let zero: UInt4 = .zero
        #expect(zero.isInvertible == false)
    }

    @Test(
        "Dividing zero by nonzero value returns zero",
        arguments: [
            2,
            3
        ] as Array<UInt4>
    )
    internal func dividingZeroByNonzeroValueReturnsZero(divisor: UInt4) {
        #expect(UInt4.zero / divisor == .zero)
    }

    @Test(
        "Dividing by one preserves dividend",
        arguments: [
            6,
            4
        ] as Array<UInt4>
    )
    internal func dividingByOnePreservesDividend(dividend: UInt4) {
        #expect(dividend / 1 == dividend)
    }

    @Test(
        "Remainder by self returns zero",
        arguments: [
            6,
            4
        ] as Array<UInt4>
    )
    internal func remainderBySelfReturnsZero(value: UInt4) {
        #expect(value % value == .zero)
    }

    @Test(
        "Division is not commutative",
        arguments: Self.divisionArguments
    )
    internal func divisionIsNotCommutative(
        dividend: UInt4,
        divisor: UInt4,
        quotient _: UInt4
    ) {
        #expect(dividend / divisor != divisor / dividend)
    }
}

// MARK: - Integer Rules

extension UInt4DivisibleTests {
    @Test(
        "Only one is invertible",
        arguments: [
            (1, true),
            (2, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func onlyOneIsInvertible(
        dividend: UInt4,
        result: Bool
    ) {
        #expect(dividend.isInvertible == result)
    }

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
        "Remainder by one returns zero",
        arguments: [
            6,
            4
        ] as Array<UInt4>
    )
    internal func remainderByOneReturnsZero(dividend: UInt4) {
        #expect(dividend % 1 == .zero)
    }
}
