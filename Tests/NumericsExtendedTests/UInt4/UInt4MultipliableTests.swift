// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("UInt4 Multipliable Tests")
internal struct UInt4MultipliableTests {
    private static let multiplicationArguments: [(UInt4, UInt4, UInt4)] = [
        (2, 3, 6),
        (3, 4, 12)
    ]

    private static let doublingArguments: [(UInt4, UInt4)] = [
        (2, 4),
        (3, 6)
    ]

    @Test(
        "Is multiple of",
        arguments: [
            (6, 3, true),
            (7, 3, false)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: UInt4,
        multiplier: UInt4,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplier) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.multiplicationArguments
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
        arguments: Self.doublingArguments
    )
    internal func doubledSucceeds(
        multiplicand: UInt4,
        product: UInt4
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: Self.doublingArguments
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
        "Is multiple of zero returns false",
        arguments: [
            2,
            3
        ] as Array<UInt4>
    )
    internal func isMultipleOfZeroReturnsFalse(multiplicand: UInt4) {
        #expect(multiplicand.isMultiple(of: 0) == false)
    }

    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            2,
            3
        ] as Array<UInt4>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: UInt4) {
        #expect(multiplicand * 0 == 0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            2,
            3
        ] as Array<UInt4>
    )
    internal func multiplyingByOnePreservesMultiplicand(multiplicand: UInt4) {
        #expect(multiplicand * 1 == multiplicand)
    }

    @Test(
        "Multiplication is commutative",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationIsCommutative(
        multiplicand: UInt4,
        multiplier: UInt4,
        product _: UInt4
    ) {
        #expect(multiplicand * multiplier == multiplier * multiplicand)
    }
}

// MARK: - Integer Rules

extension UInt4MultipliableTests {
    @Test(
        "Is multiple of one returns true",
        arguments: [
            2,
            3
        ] as Array<UInt4>
    )
    internal func isMultipleOfOneReturnsTrue(multiplicand: UInt4) {
        #expect(multiplicand.isMultiple(of: 1))
    }
}
