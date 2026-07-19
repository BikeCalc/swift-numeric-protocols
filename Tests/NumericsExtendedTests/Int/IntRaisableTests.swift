//
// IntRaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Raisable Tests")
internal struct IntRaisableTests {
    @Test(
        "Is power of",
        arguments: [
            (1, 1, true),
            (4, 1, false),
            (4, 2, true),
            (8, 2, true),
            (9, 2, false),
            (1, -1, true),
            (-1, -1, true),
            (2, -1, false),
            (4, -2, true),
            (-8, -2, true),
            (8, -2, false)
        ]
    )
    internal func isPowerOf(
        value: Int,
        other: Int,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Exponentiation succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ]
    )
    internal func exponentiationSucceeds(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ]
    )
    internal func exponentiationEqualSucceeds(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        var runningPower: Int = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ]
    )
    internal func raisingToSucceeds(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ]
    )
    internal func raiseToSucceeds(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        var runningPower: Int = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: [
            (2, 4),
            (-2, 4)
        ]
    )
    internal func squaredSucceeds(
        base: Int,
        power: Int
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: [
            (2, 4),
            (-2, 4)
        ]
    )
    internal func squareSucceeds(
        base: Int,
        power: Int
    ) {
        var runningPower: Int = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: [
            (2, 8),
            (-2, -8)
        ]
    )
    internal func cubedSucceeds(
        base: Int,
        power: Int
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: [
            (2, 8),
            (-2, -8)
        ]
    )
    internal func cubeSucceeds(
        base: Int,
        power: Int
    ) {
        var runningPower: Int = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension IntRaisableTests {
    @Test(
        "Negative base exponentiation follows parity rule",
        arguments: [
            (-2, 1, -2),
            (-2, 2, 4),
            (-2, 3, -8)
        ]
    )
    internal func negativeBaseExponentiationFollowsParityRule(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (2, 3),
            (3, 2)
        ]
    )
    internal func exponentiationIsNotCommutative(
        base: Int,
        exponent: Int.Exponent
    ) {
        let power: Int = base ** exponent
        let reversedPower: Int = exponent ** base
        #expect(power != reversedPower)
    }
}

// MARK: - Integer Rules

extension IntRaisableTests {
    @Test(
        "Negative exponent returns zero",
        arguments: [
            (2, -1, 0),
            (2, -2, 0),
            (2, -3, 0)
        ]
    )
    internal func negativeExponentReturnsZero(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative base with negative exponent returns zero",
        arguments: [
            (-2, -1, 0),
            (-2, -2, 0),
            (-2, -3, 0)
        ]
    )
    internal func negativeBaseWithNegativeExponentReturnsZero(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Zero base exponentiation follows integer rules",
        arguments: [
            (0, 0, 1),
            (0, 1, 0),
            (0, -1, 0)
        ]
    )
    internal func zeroBaseExponentiationFollowsIntegerRules(
        base: Int,
        exponent: Int.Exponent,
        power: Int
    ) {
        #expect(base ** exponent == power)
    }
}
