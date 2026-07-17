//
// DoubleMultipliableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Multipliable Tests")
internal struct DoubleMultipliableTests {
    @Test(
        "Is multiple of",
        arguments: [
            (0.0, 0.0, true),
            (3.0, 0.0, false),
            (0.0, 3.0, true),
            (3.0, 1.0, true),
            (6.0, 3.0, true),
            (7.0, 3.0, false),
            (-6.0, 3.0, true),
            (6.0, -3.0, true)
        ]
    )
    internal func isMultipleOf(
        multiplicand: Double,
        multiplicator: Double,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplicator) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (2.0, 3.0, 6.0),
            (-2.0, 3.0, -6.0),
            (2.0, -3.0, -6.0),
            (-2.0, -3.0, 6.0)
        ]
    )
    internal func multiplicationSucceeds(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication equal succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (2.0, 3.0, 6.0),
            (-2.0, 3.0, -6.0),
            (2.0, -3.0, -6.0),
            (-2.0, -3.0, 6.0)
        ]
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        var runningProduct: Double = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }

    @Test(
        "Multiplying by succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (2.0, 3.0, 6.0),
            (-2.0, 3.0, -6.0),
            (2.0, -3.0, -6.0),
            (-2.0, -3.0, 6.0)
        ]
    )
    internal func multiplyingBySucceeds(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }

    @Test(
        "Multiply by succeeds",
        arguments: [
            (0.0, 0.0, 0.0),
            (2.0, 3.0, 6.0),
            (-2.0, 3.0, -6.0),
            (2.0, -3.0, -6.0),
            (-2.0, -3.0, 6.0)
        ]
    )
    internal func multiplyBySucceeds(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        var runningProduct: Double = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }

    @Test(
        "Doubled succeeds",
        arguments: [
            (0.0, 0.0),
            (1.0, 2.0),
            (-1.0, -2.0)
        ]
    )
    internal func doubledSucceeds(
        multiplicand: Double,
        product: Double
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: [
            (0.0, 0.0),
            (1.0, 2.0),
            (-1.0, -2.0)
        ]
    )
    internal func doubleSucceeds(
        multiplicand: Double,
        product: Double
    ) {
        var runningProduct: Double = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}

// MARK: - Arithmetic Rules

extension DoubleMultipliableTests {
    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            0.0,
            1.0,
            -1,
            5.0,
            -5
        ]
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: Double) {
        #expect(multiplicand * 0.0 == 0.0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            (0.0, 0.0),
            (1.0, 1.0),
            (-1.0, -1.0),
            (5.0, 5.0),
            (-5.0, -5.0)
        ]
    )
    internal func multiplyingByOnePreservesMultiplicand(
        multiplicand: Double,
        product: Double
    ) {
        #expect(multiplicand * 1.0 == product)
    }

    @Test(
        "Multiplication follows sign rules",
        arguments: [
            (2.0, 3.0, 6.0),
            (-2.0, 3.0, -6.0),
            (2.0, -3.0, -6.0),
            (-2.0, -3.0, 6.0)
        ]
    )
    internal func multiplicationFollowsSignRules(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: [
            (2.0, 4.0),
            (-2.0, 4.0),
            (-2.0, -4.0)
        ]
    )
    internal func multiplicationIsCommutative(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs * rhs == rhs * lhs)
    }
}

// MARK: - Floating-Point Rules

extension DoubleMultipliableTests {
    @Test(
        "Multiplying by zero follows floating-point rules",
        arguments: [
            (0.0, 0.0, 0.0),
            (1.0, 0.0, 0.0),
            (-1.0, 0.0, -0.0),
            (0.0, -1.0, -0.0)
        ]
    )
    internal func multiplyingByZeroFollowsFloatingPointRules(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplying by zero preserves negative zero sign",
        arguments: [
            (-1.0, 0.0),
            (0.0, -1.0)
        ]
    )
    internal func multiplyingByZeroPreservesNegativeZeroSign(
        multiplicand: Double,
        multiplier: Double
    ) {
        let product: Double = multiplicand * multiplier

        #expect(product == 0.0)
        #expect(product.sign == .minus)
    }

    @Test(
        "Multiplying infinity follows floating-point rules",
        arguments: [
            (Double.infinity, Double.infinity, Double.infinity),
            (Double.infinity, Double.negativeInfinity, Double.negativeInfinity),
            (Double.negativeInfinity, Double.infinity, Double.negativeInfinity),
            (Double.negativeInfinity, Double.negativeInfinity, Double.infinity),
            (Double.infinity, 1.0, Double.infinity),
            (Double.infinity, -1.0, Double.negativeInfinity),
            (Double.negativeInfinity, 1.0, Double.negativeInfinity),
            (Double.negativeInfinity, -1.0, Double.infinity),
            (1.0, Double.infinity, Double.infinity),
            (1.0, Double.negativeInfinity, Double.negativeInfinity),
            (-1.0, Double.infinity, Double.negativeInfinity),
            (-1.0, Double.negativeInfinity, Double.infinity)
        ]
    )
    internal func multiplyingInfinityFollowsFloatingPointRules(
        multiplicand: Double,
        multiplier: Double,
        product: Double
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplying infinity by zero returns NaN",
        arguments: [
            (Double.infinity, 0.0),
            (Double.negativeInfinity, 0.0),
            (0.0, Double.infinity),
            (0.0, Double.negativeInfinity)
        ]
    )
    internal func multiplyingInfinityByZeroReturnsNaN(
        multiplicand: Double,
        multiplier: Double
    ) {
        #expect((multiplicand * multiplier).isNaN)
    }

    @Test(
        "Multiplying NaN returns NaN",
        arguments: [
            (Double.nan, Double.nan),
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.infinity)
        ]
    )
    internal func multiplyingNaNReturnsNaN(
        multiplicand: Double,
        multiplier: Double
    ) {
        #expect((multiplicand * multiplier).isNaN)
    }
}
