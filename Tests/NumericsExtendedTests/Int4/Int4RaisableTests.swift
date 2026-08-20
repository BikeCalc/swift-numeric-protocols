// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Int4 Raisable Tests")
internal struct Int4RaisableTests {
    private static let exponentiationArguments: [(Int4, Int4.Exponent, Int4)] = [
        (2, 2, 4),
        (2, -2, 0),
        (2, -3, 0),
        (-2, 2, 4),
        (-2, 3, -8),
        (-2, -2, 0),
        (-2, -3, 0),
        (1, -2, 1),
        (1, -3, 1),
        (-1, -2, 1),
        (-1, -3, -1)
    ]

    private static let squaringArguments: [(Int4, Int4)] = [
        (2, 4),
        (-2, 4)
    ]

    private static let cubingArguments: [(Int4, Int4)] = [
        (-2, -8)
    ]

    @Test(
        "Is power of",
        arguments: [
            (4, 2, true),
            (6, 2, false),
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.exponentiationArguments
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
        arguments: Self.squaringArguments
    )
    internal func squaredSucceeds(
        base: Int4,
        power: Int4
    ) {
        #expect(base.squared() == power)
    }

    @Test(
        "Square succeeds",
        arguments: Self.squaringArguments
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
        arguments: Self.cubingArguments
    )
    internal func cubedSucceeds(
        base: Int4,
        power: Int4
    ) {
        #expect(base.cubed() == power)
    }

    @Test(
        "Cube succeeds",
        arguments: Self.cubingArguments
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
        "Raising to zero returns one",
        arguments: [
            0,
            -0,
            1,
            -1,
            2,
            3,
            -2,
            -3
        ] as Array<Int4>
    )
    internal func raisingToZeroReturnsOne(base: Int4) {
        #expect(base ** 0 == 1)
    }

    @Test(
        "Raising to one preserves base",
        arguments: [
            0,
            -0,
            1,
            -1,
            2,
            3,
            -2,
            -3
        ] as Array<Int4>
    )
    internal func raisingToOnePreservesBase(base: Int4) {
        #expect(base ** 1 == base)
    }

    @Test(
        "One base exponentiation returns one",
        arguments: [
            0,
            1,
            2,
            3,
            -2,
            -3
        ] as Array<Int4.Exponent>
    )
    internal func oneBaseExponentiationReturnsOne(exponent: Int4.Exponent) {
        #expect(Int4(1) ** exponent == 1)
    }

    @Test(
        "One base power predicate follows identity rule",
        arguments: [
            (1, true),
            (2, false)
        ] as Array<(Int4, Bool)>
    )
    internal func oneBasePowerPredicateFollowsIdentityRule(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isPower(of: 1) == result)
    }

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
        "Negative one base exponentiation follows parity rule",
        arguments: [
            (0, 1),
            (1, -1),
            (2, 1),
            (3, -1),
            (-2, 1),
            (-3, -1)
        ] as Array<(Int4.Exponent, Int4)>
    )
    internal func negativeOneBaseExponentiationFollowsParityRule(
        exponent: Int4.Exponent,
        power: Int4
    ) {
        #expect(Int4(-1) ** exponent == power)
    }

    @Test(
        "Negative base power predicate follows signed rules",
        arguments: [
            (4, -2, true),
            (-8, -2, true),
            (6, -2, false)
        ] as Array<(Int4, Int4, Bool)>
    )
    internal func negativeBasePowerPredicateFollowsSignedRules(
        value: Int4,
        other: Int4,
        result: Bool
    ) {
        #expect(value.isPower(of: other) == result)
    }

    @Test(
        "Negative one base power predicate follows signed rules",
        arguments: [
            (1, true),
            (-1, true),
            (2, false)
        ] as Array<(Int4, Bool)>
    )
    internal func negativeOneBasePowerPredicateFollowsSignedRules(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isPower(of: -1) == result)
    }

    @Test(
        "Exponentiation is not commutative",
        arguments: [
            (-2, 3),
            (2, -2)
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
        "Zero base power predicate follows integer rules",
        arguments: [
            (0, true),
            (-0, true),
            (1, true),
            (2, false)
        ] as Array<(Int4, Bool)>
    )
    internal func zeroBasePowerPredicateFollowsIntegerRules(
        value: Int4,
        result: Bool
    ) {
        #expect(value.isPower(of: 0) == result)
    }

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
            (-0, 0, 1),
            (0, 1, 0),
            (-0, 1, 0),
            (0, 2, 0),
            (-0, 2, 0)
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
