//
// IntMultipliableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Multipliable Tests")
internal struct IntMultipliableTests {
    @Test(
        "Is multiple of",
        arguments: [
            (0, 0, true),
            (3, 0, false),
            (0, 3, true),
            (3, 1, true),
            (6, 3, true),
            (7, 3, false),
            (-6, 3, true),
            (6, -3, true)
        ]
    )
    internal func isMultipleOf(
        multiplicand: Int,
        multiplicator: Int,
        result: Bool
    ) {
        #expect(multiplicand.isMultiple(of: multiplicator) == result)
    }
    
    @Test(
        "Multiplication succeeds",
        arguments: [
            (0, 0, 0),
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ]
    )
    internal func multiplicationSucceeds(
        multiplicand: Int,
        multiplier: Int,
        product: Int
    ) {
        #expect(multiplicand * multiplier == product)
    }
    
    @Test(
        "Multiplication equal succeeds",
        arguments: [
            (0, 0, 0),
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ]
    )
    internal func multiplicationEqualSucceeds(
        multiplicand: Int,
        multiplier: Int,
        product: Int
    ) {
        var runningProduct: Int = multiplicand
        runningProduct *= multiplier
        #expect(runningProduct == product)
    }
    
    @Test(
        "Multiplying by succeeds",
        arguments: [
            (0, 0, 0),
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ]
    )
    internal func multiplyingBySucceeds(
        multiplicand: Int,
        multiplier: Int,
        product: Int
    ) {
        #expect(multiplicand.multiplying(by: multiplier) == product)
    }
    
    @Test(
        "Multiply by succeeds",
        arguments: [
            (0, 0, 0),
            (2, 3, 6),
            (-2, 3, -6),
            (2, -3, -6),
            (-2, -3, 6)
        ]
    )
    internal func multiplyBySucceeds(
        multiplicand: Int,
        multiplier: Int,
        product: Int
    ) {
        var runningProduct: Int = multiplicand
        runningProduct.multiply(by: multiplier)
        #expect(runningProduct == product)
    }
    
    @Test(
        "Doubled succeeds",
        arguments: [
            (0, 0),
            (1, 2),
            (-1, -2)
        ]
    )
    internal func doubledSucceeds(
        multiplicand: Int,
        product: Int
    ) {
        #expect(multiplicand.doubled() == product)
    }
    
    @Test(
        "Double succeeds",
        arguments: [
            (0, 0),
            (1, 2),
            (-1, -2)
        ]
    )
    internal func doubleSucceeds(
        multiplicand: Int,
        product: Int
    ) {
        var runningProduct: Int = multiplicand
        runningProduct.double()
        #expect(runningProduct == product)
    }
}
