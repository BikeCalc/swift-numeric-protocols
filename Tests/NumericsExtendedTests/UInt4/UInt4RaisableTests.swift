// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("UInt4 Raisable Tests")
internal struct UInt4RaisableTests {
    private static let exponentiationArguments: [(UInt4, UInt4.Exponent, UInt4)] = [
        (2, 2, 4),
        (2, 3, 8)
    ]

    private static let squaringArguments: [(UInt4, UInt4)] = [
        (2, 4),
        (3, 9)
    ]

    private static let cubingArguments: [(UInt4, UInt4)] = [
        (2, 8)
    ]

    @Test(
        "Is power of",
        arguments: [
            (4, 2, true),
            (6, 2, false),
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.squaringArguments
    )
    internal func squaredSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: Self.squaringArguments
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
        arguments: Self.cubingArguments
    )
    internal func cubedSucceeds(
        base: UInt4,
        power: UInt4
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: Self.cubingArguments
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
        "Raising to zero returns one",
        arguments: [
            0,
            1,
            2,
            3
        ] as Array<UInt4>
    )
    internal func raisingToZeroReturnsOne(base: UInt4) {
        #expect(base ** .zero == 1)
    }

    @Test(
        "Raising to one preserves base",
        arguments: [
            0,
            1,
            2,
            3
        ] as Array<UInt4>
    )
    internal func raisingToOnePreservesBase(base: UInt4) {
        #expect(base ** 1 == base)
    }

    @Test(
        "One base exponentiation returns one",
        arguments: [
            0,
            1,
            2,
            3
        ] as Array<UInt4.Exponent>
    )
    internal func oneBaseExponentiationReturnsOne(exponent: UInt4.Exponent) {
        #expect(UInt4(1) ** exponent == 1)
    }

    @Test(
        "One base power predicate follows identity rule",
        arguments: [
            (1, true),
            (2, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func oneBasePowerPredicateFollowsIdentityRule(
        value: UInt4,
        result: Bool
    ) {
        #expect(value.isPower(of: 1) == result)
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

// MARK: - Integer Rules

extension UInt4RaisableTests {
    @Test(
        "Zero base power predicate follows unsigned integer rules",
        arguments: [
            (0, true),
            (1, true),
            (2, false)
        ] as Array<(UInt4, Bool)>
    )
    internal func zeroBasePowerPredicateFollowsUnsignedIntegerRules(
        value: UInt4,
        result: Bool
    ) {
        #expect(value.isPower(of: .zero) == result)
    }

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
}
