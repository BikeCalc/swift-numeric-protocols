// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Roman Multipliable Tests")
internal struct RomanMultipliableTests {
    private static let multiplicationArguments: [(Roman, Roman, Roman)] = [
        (2, 3, 6),
        (3, 4, 12)
    ]

    private static let doublingArguments: [(Roman, Roman)] = [
        (2, 4),
        (3, 6)
    ]

    @Test(
        "Is multiple of",
        arguments: [
            (6, 3, true),
            (7, 3, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: Roman,
        multiplier: Roman,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplier) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationSucceeds(
        multiplicand: Roman,
        multiplier: Roman,
        product: Roman
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication equal succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: Roman,
        multiplier: Roman,
        product: Roman
    ) {
        var runningProduct: Roman = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }

    @Test(
        "Multiplying by succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplyingBySucceeds(
        multiplicand: Roman,
        multiplier: Roman,
        product: Roman
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }

    @Test(
        "Multiply by succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplyBySucceeds(
        multiplicand: Roman,
        multiplier: Roman,
        product: Roman
    ) {
        var runningProduct: Roman = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }

    @Test(
        "Doubled succeeds",
        arguments: Self.doublingArguments
    )
    internal func doubledSucceeds(
        multiplicand: Roman,
        product: Roman
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: Self.doublingArguments
    )
    internal func doubleSucceeds(
        multiplicand: Roman,
        product: Roman
    ) {
        var runningProduct: Roman = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}

// MARK: - Arithmetic Rules

extension RomanMultipliableTests {
    @Test("Zero is multiple of zero")
    internal func zeroIsMultipleOfZero() {
        #expect(Roman.zero.isMultiple(of: .zero) == true)
    }

    @Test(
        "Is multiple of zero returns false",
        arguments: [
            2,
            3
        ] as Array<Roman>
    )
    internal func isMultipleOfZeroReturnsFalse(multiplicand: Roman) {
        #expect(multiplicand.isMultiple(of: .zero) == false)
    }

    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            2,
            3
        ] as Array<Roman>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: Roman) {
        #expect(multiplicand * .zero == .zero)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            2,
            3
        ] as Array<Roman>
    )
    internal func multiplyingByOnePreservesMultiplicand(multiplicand: Roman) {
        #expect(multiplicand * 1 == multiplicand)
    }

    @Test(
        "Multiplication is commutative",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationIsCommutative(
        multiplicand: Roman,
        multiplier: Roman,
        product _: Roman
    ) {
        #expect(multiplicand * multiplier == multiplier * multiplicand)
    }
}

// MARK: - Integer Rules

extension RomanMultipliableTests {
    @Test(
        "Is multiple of one returns true",
        arguments: [
            2,
            3
        ] as Array<Roman>
    )
    internal func isMultipleOfOneReturnsTrue(multiplicand: Roman) {
        #expect(multiplicand.isMultiple(of: 1) == true)
    }
}
