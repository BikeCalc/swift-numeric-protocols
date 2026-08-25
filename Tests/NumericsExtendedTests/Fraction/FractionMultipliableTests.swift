// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Multipliable Tests")
internal struct FractionMultipliableTests {
    private static let multiplicationArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (.init(1, 2), .init(1, 2), .init(1, 4)),
        (.init(1, 2), .init(2, 3), .init(2, 6)),
        (.init(-1, 2), .init(1, 2), .init(-1, 4)),
        (.init(-1, 2), .init(-2, 3), .init(2, 6))
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2), Fraction<Int>(1, 4)),
        (Fraction<Int>(1, 2), Fraction<Int>(2, 3), Fraction<Int>(2, 6)),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, 2), Fraction<Int>(-1, 4)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-2, 3), Fraction<Int>(2, 6))
    ]

    private static let doublingArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(2, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-2, 2)),
        (Fraction<Int>(-1, -2), Fraction<Int>(-2, -2)),
        (Fraction<Int>(1, -2), Fraction<Int>(2, -2))
    ]

    @Test(
        "Is multiple of",
        arguments: [
            (Fraction<Int>(1, 4), Fraction<Int>(1, 4), true),
            (Fraction<Int>(2, 6), Fraction<Int>(1, 4), false),
            (Fraction<Int>(-1, 4), Fraction<Int>(1, 4), true),
            (Fraction<Int>(-2, 6), Fraction<Int>(1, 4), false)
        ]
    )
    internal func isMultipleOf(
        value: Fraction<Int>,
        other: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isMultiple(of: other) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationSucceeds(
        multiplicand: Fraction<Int>,
        multiplier: Fraction<Int>,
        product: Fraction<Int>
    ) {
        #expect(multiplicand * multiplier == product)
    }

    @Test(
        "Multiplication equal succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: Fraction<Int>,
        multiplier: Fraction<Int>,
        product: Fraction<Int>
    ) {
        var runningProduct: Fraction<Int> = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }

    @Test(
        "Multiplying by succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplyingBySucceeds(
        multiplicand: Fraction<Int>,
        multiplier: Fraction<Int>,
        product: Fraction<Int>
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }

    @Test(
        "Multiply by succeeds",
        arguments: Self.multiplicationArguments
    )
    internal func multiplyBySucceeds(
        multiplicand: Fraction<Int>,
        multiplier: Fraction<Int>,
        product: Fraction<Int>
    ) {
        var runningProduct: Fraction<Int> = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }

    @Test(
        "Doubled succeeds",
        arguments: Self.doublingArguments
    )
    internal func doubledSucceeds(
        multiplicand: Fraction<Int>,
        product: Fraction<Int>
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: Self.doublingArguments
    )
    internal func doubleSucceeds(
        multiplicand: Fraction<Int>,
        product: Fraction<Int>
    ) {
        var runningProduct: Fraction<Int> = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}

