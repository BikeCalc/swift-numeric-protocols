// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int4 Multipliable Tests")
internal struct Int4MultipliableTests {
    private static let multiplicationArguments: [(Int4, Int4, Int4)] = [
        (2, 3, 6),
        (-2, 3, -6)
    ]

    private static let doublingArguments: [(Int4, Int4)] = [
        (2, 4),
        (3, 6),
        (-2, -4),
        (-3, -6)
    ]

    @Test(
        "Is multiple of",
        arguments: [
            (6, 3, true),
            (7, 3, false),
            (-6, 3, true),
            (-7, 3, false)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: Int4,
        multiplier: Int4,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplier) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.doublingArguments
    )
    internal func doubledSucceeds(
        multiplicand: Int4,
        product: Int4
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: Self.doublingArguments
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
    @Test("Zero is multiple of zero")
    internal func zeroIsMultipleOfZero() {
        #expect(Int4.zero.isMultiple(of: .zero))
    }

    @Test(
        "Is multiple of zero returns false",
        arguments: [
            2,
            3,
            -2,
            -3
        ] as Array<Int4>
    )
    internal func isMultipleOfZeroReturnsFalse(multiplicand: Int4) {
        #expect(multiplicand.isMultiple(of: 0) == false)
    }

    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            2,
            -2
        ] as Array<Int4>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: Int4) {
        #expect(multiplicand * 0 == 0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            2,
            -2
        ] as Array<Int4>
    )
    internal func multiplyingByOnePreservesMultiplicand(multiplicand: Int4) {
        #expect(multiplicand * 1 == multiplicand)
    }

    @Test(
        "Multiplying by negative one returns opposite value",
        arguments: [
            (2, -2),
            (3, -3),
            (-2, 2),
            (-3, 3)
        ] as Array<(Int4, Int4)>
    )
    internal func multiplyingByNegativeOneReturnsOppositeValue(
        multiplicand: Int4,
        product: Int4
    ) {
        #expect(multiplicand * -1 == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationIsCommutative(
        multiplicand: Int4,
        multiplier: Int4,
        product _: Int4
    ) {
        #expect(multiplicand * multiplier == multiplier * multiplicand)
    }
}

// MARK: - Integer Rules

extension Int4MultipliableTests {
    @Test(
        "Is multiple of one returns true",
        arguments: [
            2,
            3,
            -2,
            -3
        ] as Array<Int4>
    )
    internal func isMultipleOfOneReturnsTrue(multiplicand: Int4) {
        #expect(multiplicand.isMultiple(of: 1))
    }
}
