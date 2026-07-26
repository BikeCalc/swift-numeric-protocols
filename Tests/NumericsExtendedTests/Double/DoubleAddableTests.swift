// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Addable Tests")
internal struct DoubleAddableTests {
    private static let additionArguments: Array<(Double, Double, Double)> = [
        (2.0, 3.0, 5.0),
        (3.0, 4.0, 7.0),
        (-2.0, 3.0, 1.0),
        (-3.0, -4.0, -7.0),
        (0.5, 1.5, 2.0),
        (1.5, 2.5, 4.0),
        (-0.5, 1.5, 1.0),
        (-1.5, -2.5, -4.0)
    ]

    @Test(
        "Addition succeeds",
        arguments: Self.additionArguments
    )
    internal func additionSucceeds(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: Self.additionArguments
    )
    internal func additionEqualSucceeds(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        var runningSum: Double = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: Self.additionArguments
    )
    internal func addingSucceeds(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: Self.additionArguments
    )
    internal func addSucceeds(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        var runningSum: Double = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

// MARK: - Arithmetic Rules

extension DoubleAddableTests {
    @Test(
        "Adding zero preserves augend",
        arguments: [
            2.0,
            3.0,
            -2.0,
            -3.0,
            0.5,
            1.5,
            -0.5,
            -1.5
        ]
    )
    internal func addingZeroPreservesAugend(augend: Double) {
        #expect(augend + 0.0 == augend)
    }

    @Test(
        "Adding opposite values returns zero",
        arguments: [
            (2.0, -2.0),
            (3.0, -3.0),
            (-2.0, 2.0),
            (-3.0, 3.0),
            (0.5, -0.5),
            (1.5, -1.5),
            (-0.5, 0.5),
            (-1.5, 1.5)
        ]
    )
    internal func addingOppositeValuesReturnsZero(
        augend: Double,
        addend: Double
    ) {
        #expect(augend + addend == 0.0)
    }

    @Test(
        "Addition is commutative",
        arguments: Self.additionArguments
    )
    internal func additionIsCommutative(
        augend: Double,
        addend: Double,
        sum _: Double
    ) {
        #expect(augend + addend == addend + augend)
    }
}

// MARK: - Floating-Point Rules

extension DoubleAddableTests {
    @Test(
        "Adding zero follows floating-point rules",
        arguments: [
            (0.0, 0.0, 0.0),
            (-0.0, 0.0, 0.0),
            (0.0, -0.0, 0.0),
            (-0.0, -0.0, -0.0),
            (2.0, 0.0, 2.0),
            (-2.0, 0.0, -2.0),
            (0.5, 0.0, 0.5),
            (-0.5, 0.0, -0.5)
        ]
    )
    internal func addingZeroFollowsFloatingPointRules(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Adding infinity follows floating-point rules",
        arguments: [
            (Double.infinity, Double.infinity, Double.infinity),
            (Double.negativeInfinity, Double.negativeInfinity, Double.negativeInfinity),
            (Double.infinity, 1.0, Double.infinity),
            (Double.negativeInfinity, 1.0, Double.negativeInfinity),
            (1.0, Double.infinity, Double.infinity),
            (1.0, Double.negativeInfinity, Double.negativeInfinity)
        ]
    )
    internal func addingInfinityFollowsFloatingPointRules(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Adding opposite infinities returns NaN",
        arguments: [
            (Double.infinity, Double.negativeInfinity),
            (Double.negativeInfinity, Double.infinity)
        ]
    )
    internal func addingOppositeInfinitiesReturnsNaN(
        augend: Double,
        addend: Double
    ) {
        #expect((augend + addend).isNaN)
    }

    @Test(
        "Adding NaN returns NaN",
        arguments: [
            (Double.nan, Double.nan),
            (Double.nan, 1.0),
            (1.0, Double.nan),
            (Double.nan, Double.infinity),
            (Double.nan, Double.negativeInfinity)
        ]
    )
    internal func addingNaNReturnsNaN(
        augend: Double,
        addend: Double
    ) {
        #expect((augend + addend).isNaN)
    }
}
