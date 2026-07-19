//
// UInt4RaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Raisable Tests")
internal struct UInt4RaisableTests {
    @Test(
        "Is power of",
        arguments: [
            (1, 1, true),
            (4, 1, false),
            (4, 2, true),
            (8, 2, true),
            (9, 2, false)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func isPowerOf(
        value: UInt4,
        other: UInt4,
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
        ] as Array<(UInt4, UInt4.Exponent, UInt4)>
    )
    internal func exponentiationSucceeds(
        base: UInt4,
        exponent: UInt4.Exponent,
        power: UInt4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation equal succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(UInt4, UInt4.Exponent, UInt4)>
    )
    internal func exponentiationEqualSucceeds(
        base: UInt4,
        exponent: UInt4.Exponent,
        power: UInt4
    ) {
        var runningPower: UInt4 = base
        runningPower **= exponent
        #expect(runningPower == power)
    }

    @Test(
        "Raising to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(UInt4, UInt4.Exponent, UInt4)>
    )
    internal func raisingToSucceeds(
        base: UInt4,
        exponent: UInt4.Exponent,
        power: UInt4
    ) {
        #expect(base.raising(to: exponent) == power)
    }

    @Test(
        "Raise to succeeds",
        arguments: [
            (2, 1, 2),
            (2, 2, 4),
            (2, 3, 8)
        ] as Array<(UInt4, UInt4.Exponent, UInt4)>
    )
    internal func raiseToSucceeds(
        base: UInt4,
        exponent: UInt4.Exponent,
        power: UInt4
    ) {
        var runningPower: UInt4 = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }

    @Test(
        "Squared succeeds",
        arguments: [
            (2, 4),
            (3, 9)
        ] as Array<(UInt4, UInt4)>
    )
    internal func squaredSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: [
            (2, 4),
            (3, 9)
        ] as Array<(UInt4, UInt4)>
    )
    internal func squareSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        var runningPower: UInt4 = base
        runningPower.square()
        #expect(runningPower == power)
    }

    @Test(
        "Cubed succeeds",
        arguments: [
            (2, 8)
        ] as Array<(UInt4, UInt4)>
    )
    internal func cubedSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: [
            (2, 8)
        ] as Array<(UInt4, UInt4)>
    )
    internal func cubeSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        var runningPower: UInt4 = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Arithmetic Rules

extension UInt4RaisableTests {
    @Test(
        "Zero base exponentiation follows unsigned integer rules",
        arguments: [
            (0, 0, 1),
            (0, 1, 0),
            (0, 2, 0)
        ] as Array<(UInt4, UInt4.Exponent, UInt4)>
    )
    internal func zeroBaseExponentiationFollowsUnsignedIntegerRules(
        base: UInt4,
        exponent: UInt4.Exponent,
        power: UInt4
    ) {
        #expect(base ** exponent == power)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (2, 3),
            (3, 2)
        ] as Array<(UInt4, UInt4.Exponent)>
    )
    internal func exponentiationIsNotCommutative(
        base: UInt4,
        exponent: UInt4.Exponent
    ) {
        let power: UInt4 = base ** exponent
        let reversedPower: UInt4 = exponent ** base
        #expect(power != reversedPower)
    }
}
