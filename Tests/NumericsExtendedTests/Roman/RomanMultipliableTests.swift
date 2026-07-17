//
// RomanMultipliableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Multipliable Tests")
internal struct RomanMultipliableTests {
    @Test(
        "Is multiple of",
        arguments: [
            (0, 0, true),
            (3, 0, false),
            (0, 3, true),
            (3, 1, true),
            (6, 3, true),
            (7, 3, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func isMultipleOf(
        multiplicand: Roman,
        multiplicator: Roman,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplicator) == result)
    }

    @Test(
        "Multiplication succeeds",
        arguments: [
            (0, 0, 0),
            (2, 3, 6)
        ] as Array<(Roman, Roman, Roman)>
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
        arguments: [
            (0, 0, 0),
            (2, 3, 6)
        ] as Array<(Roman, Roman, Roman)>
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
        arguments: [
            (0, 0, 0),
            (2, 3, 6)
        ] as Array<(Roman, Roman, Roman)>
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
        arguments: [
            (0, 0, 0),
            (2, 3, 6)
        ] as Array<(Roman, Roman, Roman)>
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
        arguments: [
            (0, 0),
            (1, 2)
        ] as Array<(Roman, Roman)>
    )
    internal func doubledSucceeds(
        multiplicand: Roman,
        product: Roman
    ) {
        #expect(multiplicand.doubled() == product)
    }

    @Test(
        "Double succeeds",
        arguments: [
            (0, 0),
            (1, 2)
        ] as Array<(Roman, Roman)>
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
    @Test(
        "Multiplying by zero returns zero",
        arguments: [
            0,
            1
        ] as Array<Roman>
    )
    internal func multiplyingByZeroReturnsZero(multiplicand: Roman) {
        #expect(multiplicand * 0 == 0)
    }

    @Test(
        "Multiplying by one preserves multiplicand",
        arguments: [
            (0, 0),
            (1, 1)
        ] as Array<(Roman, Roman)>
    )
    internal func multiplyingByOnePreservesMultiplicand(
        multiplicand: Roman,
        product: Roman
    ) {
        #expect(multiplicand * 1 == product)
    }

    @Test(
        "Multiplication is commutative",
        arguments: [
            (0, 0),
            (2, 4)
        ] as Array<(Roman, Roman)>
    )
    internal func multiplicationIsCommutative(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs * rhs == rhs * lhs)
    }
}
