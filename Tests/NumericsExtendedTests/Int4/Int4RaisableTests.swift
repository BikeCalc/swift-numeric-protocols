//
// Int4RaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Raisable Tests")
internal struct Int4RaisableTests {
    @Test(
        "Is power of",
        arguments: [
            (1, 1, true),
            (4, 1, false),
            (4, 2, true),
            (1, -1, true),
            (-1, -1, true),
            (2, -1, false),
            (4, -2, true),
            (-8, -2, true),
            (7, 2, false)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func isPowerOf(
        value: Int4,
        other: Int4,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Exponentiation succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (-2, 3, -8)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func exponentiationSucceeds(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (-2, 3, -8)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func exponentiationEqualSucceeds(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        var runningPower: Int4 = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (-2, 3, -8)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func raisingToSucceeds(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (-2, 3, -8)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func raiseToSucceeds(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        var runningPower: Int4 = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: [
            (2, 4),
            (-2, 4)
        ] as Array<(Int4, Int4)>
    )
    internal func squaredSucceeds(
        base: Int4,
        power: Int4
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: [
            (2, 4),
            (-2, 4)
        ] as Array<(Int4, Int4)>
    )
    internal func squareSucceeds(
        base: Int4,
        power: Int4
    ) {
        var runningPower: Int4 = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: [
            (-1, -1),
            (-2, -8)
        ] as Array<(Int4, Int4)>
    )
    internal func cubedSucceeds(
        base: Int4,
        power: Int4
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: [
            (-1, -1),
            (-2, -8)
        ] as Array<(Int4, Int4)>
    )
    internal func cubeSucceeds(
        base: Int4,
        power: Int4
    ) {
        var runningPower: Int4 = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension Int4RaisableTests {
    @Test(
        "Negative base exponentiation follows parity rule",
        arguments: [
            (-2, 1, -2),
            (-2, 2, 4),
            (-2, 3, -8)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func negativeBaseExponentiationFollowsParityRule(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (2, -1),
            (-2, 3)
        ] as Array<(Int4, Int4.Exponent)>
    )
    internal func exponentiationIsNotCommutative(
        base: Int4,
        exponent: Int4.Exponent
    ) {
        let power: Int4 = base ** exponent
        let reversedPower: Int4 = exponent ** base
        #expect(power != reversedPower)
    }
}

// MARK: - Integer Rules

extension Int4RaisableTests {
    @Test(
        "Negative exponent returns zero",
        arguments: [
            (2, -1, 0),
            (2, -2, 0),
            (2, -3, 0)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func negativeExponentReturnsZero(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Negative base with negative exponent returns zero",
        arguments: [
            (-2, -1, 0),
            (-2, -2, 0),
            (-2, -3, 0)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func negativeBaseWithNegativeExponentReturnsZero(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Zero base exponentiation follows integer rules",
        arguments: [
            (0, 0, 1),
            (0, 1, 0),
            (0, -1, 0)
        ] as Array<(Int4, Int4.Exponent, Int4)>
    )
    internal func zeroBaseExponentiationFollowsIntegerRules(
        base: Int4,
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(base ** exponent == power)
    }
}
