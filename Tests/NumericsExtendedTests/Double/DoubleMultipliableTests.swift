// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Multipliable Tests")
internal struct DoubleMultipliableTests {
    private static let multiplicationArguments: [(Double, Double, Double)] = [
        (2.0, 3.0, 6.0),
        (3.0, 4.0, 12.0),
        (-2.0, 3.0, -6.0),
        (-3.0, -4.0, 12.0),
        (0.5, 1.5, 0.75),
        (1.5, 2.5, 3.75),
        (-0.5, 1.5, -0.75),
        (-1.5, -2.5, 3.75)
    ]

    private static let doublingArguments: [(Double, Double)] = [
        (2.0, 4.0),
        (3.0, 6.0),
        (-2.0, -4.0),
        (-3.0, -6.0),
        (0.5, 1.0),
        (1.5, 3.0),
        (-0.5, -1.0),
        (-1.5, -3.0)
    ]

    @Test(
        "Is multiple of",
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
    internal func isMultipleOf(
        multiplicand: Double,
        multiplier: Double,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplier) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.doublingArguments
    )
    internal func doubledSucceeds(
        multiplicand: Double,
        product: Double
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: Self.doublingArguments
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
    @Test("Zero is multiple of zero")
    internal func zeroIsMultipleOfZero() {
        #expect(Double.zero.isMultiple(of: .zero))
    }

    @Test(
        "Is multiple of zero returns false",
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
    internal func isMultipleOfZeroReturnsFalse(multiplicand: Double) {
        #expect(multiplicand.isMultiple(of: .zero) == false)
    }

    @Test(
        "Multiplying by zero returns zero",
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
    internal func multiplyingByZeroReturnsZero(multiplicand: Double) {
        #expect(multiplicand * .zero == .zero)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
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
    internal func multiplyingByOnePreservesMultiplicand(multiplicand: Double) {
        #expect(multiplicand * 1.0 == multiplicand)
    }

    @Test(
        "Multiplying by negative one returns opposite value",
        arguments: [
            (2.0, -2.0),
            (3.0, -3.0),
            (-2.0, 2.0),
            (-3.0, 3.0),
            (0.5, -0.5),
            (1.5, -1.5),
            (-0.5, 0.5),
            (-1.5, 1.5)
        ]
    )
    internal func multiplyingByNegativeOneReturnsOppositeValue(
        multiplicand: Double,
        product: Double
    ) {
        #expect(multiplicand * -1.0 == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationIsCommutative(
        multiplicand: Double,
        multiplier: Double,
        product _: Double
    ) {
        #expect(multiplicand * multiplier == multiplier * multiplicand)
    }
}

// MARK: - Floating-Point Rules

extension DoubleMultipliableTests {
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

        #expect(product == .zero)
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
