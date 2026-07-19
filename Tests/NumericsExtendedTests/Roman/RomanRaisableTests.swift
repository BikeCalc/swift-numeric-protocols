//
// RomanRaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Raisable Tests")
internal struct RomanRaisableTests {
    @Test(
        "Is power of",
        arguments: [
            (1, 1, true),
            (4, 1, false),
            (4, 2, true),
            (8, 2, true),
            (9, 2, false)
        ] as Array<(Roman, Roman, Bool)>
    )
    internal func isPowerOf(
        value: Roman,
        other: Roman,
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
        ] as Array<(Roman, Roman.Exponent, Roman)>
    )
    internal func exponentiationSucceeds(
        base: Roman,
        exponent: Roman.Exponent,
        power: Roman
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(Roman, Roman.Exponent, Roman)>
    )
    internal func exponentiationEqualSucceeds(
        base: Roman,
        exponent: Roman.Exponent,
        power: Roman
    ) {
        var runningPower: Roman = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(Roman, Roman.Exponent, Roman)>
    )
    internal func raisingToSucceeds(
        base: Roman,
        exponent: Roman.Exponent,
        power: Roman
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(Roman, Roman.Exponent, Roman)>
    )
    internal func raiseToSucceeds(
        base: Roman,
        exponent: Roman.Exponent,
        power: Roman
    ) {
        var runningPower: Roman = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: [
            (2, 4),
            (3, 9)
        ] as Array<(Roman, Roman)>
    )
    internal func squaredSucceeds(
        base: Roman,
        power: Roman
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: [
            (2, 4),
            (3, 9)
        ] as Array<(Roman, Roman)>
    )
    internal func squareSucceeds(
        base: Roman,
        power: Roman
    ) {
        var runningPower: Roman = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: [
            (2, 8),
            (3, 27)
        ] as Array<(Roman, Roman)>
    )
    internal func cubedSucceeds(
        base: Roman,
        power: Roman
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: [
            (2, 8),
            (3, 27)
        ] as Array<(Roman, Roman)>
    )
    internal func cubeSucceeds(
        base: Roman,
        power: Roman
    ) {
        var runningPower: Roman = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension RomanRaisableTests {
    @Test(
        "Zero base exponentiation follows unsigned integer rules",
        arguments: [
            (0, 0, 1),
            (0, 1, 0),
            (0, 2, 0)
        ] as Array<(Roman, Roman.Exponent, Roman)>
    )
    internal func zeroBaseExponentiationFollowsRomanRules(
        base: Roman,
        exponent: Roman.Exponent,
        power: Roman
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (2, 3),
            (3, 2)
        ] as Array<(Roman, Roman.Exponent)>
    )
    internal func exponentiationIsNotCommutative(
        base: Roman,
        exponent: Roman.Exponent
    ) {
        let power: Roman = base ** exponent
        let reversedPower: Roman = exponent ** base
        #expect(power != reversedPower)
    }
}
