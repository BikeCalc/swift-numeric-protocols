//
// UInt4MultipliableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Multipliable Tests")
internal struct UInt4MultipliableTests {
    @Test(
        "Is multiple of",
        arguments: [
            (3, 1, true),
            (6, 3, true),
            (7, 3, false)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: UInt4,
        multiplicator: UInt4,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplicator) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: [
            (2, 3, 6),
            (3, 4, 12)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func multiplicationSucceeds(
        multiplicand: UInt4,
        multiplier: UInt4,
        product: UInt4
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication equal succeeds",
        arguments: [
            (2, 3, 6),
            (3, 4, 12)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: UInt4,
        multiplier: UInt4,
        product: UInt4
    ) {
        var runningProduct: UInt4 = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }

    @Test(
        "Multiplying by succeeds",
        arguments: [
            (2, 3, 6),
            (3, 4, 12)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func multiplyingBySucceeds(
        multiplicand: UInt4,
        multiplier: UInt4,
        product: UInt4
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }

    @Test(
        "Multiply by succeeds",
        arguments: [
            (2, 3, 6),
            (3, 4, 12)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func multiplyBySucceeds(
        multiplicand: UInt4,
        multiplier: UInt4,
        product: UInt4
    ) {
        var runningProduct: UInt4 = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }

    @Test(
        "Doubled succeeds",
        arguments: [
            (1, 2),
            (3, 6)
        ] as Array<(UInt4, UInt4)>
    )
    internal func doubledSucceeds(
        multiplicand: UInt4,
        product: UInt4
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: [
            (1, 2),
            (3, 6)
        ] as Array<(UInt4, UInt4)>
    )
    internal func doubleSucceeds(
        multiplicand: UInt4,
        product: UInt4
    ) {
        var runningProduct: UInt4 = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}

// MARK: - Arithmetic Rules

extension UInt4MultipliableTests {
    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            0,
            1,
            5
        ] as Array<UInt4>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: UInt4) {
        #expect(multiplicand * 0 == 0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            (0, 0),
            (1, 1),
            (5, 5)
        ] as Array<(UInt4, UInt4)>
    )
    internal func multiplyingByOnePreservesMultiplicand(
        multiplicand: UInt4,
        product: UInt4
    ) {
        #expect(multiplicand * 1 == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: [
            (2, 4),
            (3, 5)
        ] as Array<(UInt4, UInt4)>
    )
    internal func multiplicationIsCommutative(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs * rhs == rhs * lhs)
    }
}
