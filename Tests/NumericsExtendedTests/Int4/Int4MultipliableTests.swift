//
// Int4MultipliableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Multipliable Tests")
internal struct Int4MultipliableTests {
    @Test(
        "Is multiple of",
        arguments: [
            (3, 1, true),
            (6, 3, true),
            (7, 3, false),
            (-6, 3, true),
            (6, -3, true)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: Int4,
        multiplicator: Int4,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplicator) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: [
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func multiplicationSucceeds(
        multiplicand: Int4,
        multiplier: Int4,
        product: Int4
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication equal succeeds",
        arguments: [
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: Int4,
        multiplier: Int4,
        product: Int4
    ) {
        var runningProduct: Int4 = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }

    @Test(
        "Multiplying by succeeds",
        arguments: [
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func multiplyingBySucceeds(
        multiplicand: Int4,
        multiplier: Int4,
        product: Int4
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }

    @Test(
        "Multiply by succeeds",
        arguments: [
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func multiplyBySucceeds(
        multiplicand: Int4,
        multiplier: Int4,
        product: Int4
    ) {
        var runningProduct: Int4 = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }

    @Test(
        "Doubled succeeds",
        arguments: [
            (1, 2),
            (-1, -2),
            (3, 6)
        ] as Array<(Int4, Int4)>
    )
    internal func doubledSucceeds(
        multiplicand: Int4,
        product: Int4
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: [
            (1, 2),
            (-1, -2),
            (3, 6)
        ] as Array<(Int4, Int4)>
    )
    internal func doubleSucceeds(
        multiplicand: Int4,
        product: Int4
    ) {
        var runningProduct: Int4 = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}

// MARK: - Arithmetic Rules

extension Int4MultipliableTests {
    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            0,
            1,
            -1,
            5,
            -5
        ] as Array<Int4>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: Int4) {
        #expect(multiplicand * 0 == 0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            (0, 0),
            (1, 1),
            (-1, -1),
            (5, 5),
            (-5, -5)
        ] as Array<(Int4, Int4)>
    )
    internal func multiplyingByOnePreservesMultiplicand(
        multiplicand: Int4,
        product: Int4
    ) {
        #expect(multiplicand * 1 == product)
    }

    @Test(
        "Multiplication follows sign rules",
        arguments: [
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func multiplicationFollowsSignRules(
        multiplicand: Int4,
        multiplier: Int4,
        product: Int4
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: [
            (2, 3),
            (-2, 3),
            (-2, -3)
        ] as Array<(Int4, Int4)>
    )
    internal func multiplicationIsCommutative(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs * rhs == rhs * lhs)
    }
}
