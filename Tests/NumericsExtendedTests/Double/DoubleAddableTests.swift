//
// DoubleAddableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Addable Tests")
internal struct DoubleAddableTests {
    @Test(
        "Addition succeeds",
        arguments: [
            (2.0, 4.0, 6.0),
            (-2.0, 4.0, 2.0)
        ]
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
        arguments: [
            (2.0, 4.0, 6.0),
            (-2.0, 4.0, 2.0)
        ]
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
        arguments: [
            (2.0, 4.0, 6.0),
            (-2.0, 4.0, 2.0)
        ]
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
        arguments: [
            (2.0, 4.0, 6.0),
            (-2.0, 4.0, 2.0)
        ]
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
            (0.0, 0.0),
            (1.0, 1.0),
            (-1.0, -1.0)
        ]
    )
    internal func addingZeroPreservesAugend(
        augend: Double,
        sum: Double
    ) {
        #expect(augend + 0.0 == sum)
    }

    @Test(
        "Adding opposite values returns zero",
        arguments: [
            (0.0, 0.0, 0.0),
            (1.0, -1.0, 0.0),
            (-1.0, 1.0, 0.0),
            (5.0, -5.0, 0.0)
        ]
    )
    internal func addingOppositeValuesReturnsZero(
        augend: Double,
        addend: Double,
        sum: Double
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition is commutative",
        arguments: [
            (2.0, 4.0),
            (-2.0, 4.0),
            (-2.0, -4.0)
        ]
    )
    internal func additionIsCommutative(
        lhs: Double,
        rhs: Double
    ) {
        #expect(lhs + rhs == rhs + lhs)
    }
}

// MARK: - Floating-Point Rules

extension DoubleAddableTests {
    @Test(
        "Adding zero follows floating-point rules",
        arguments: [
            (0.0, 0.0, 0.0),
            (-0.0, -0.0, -0.0),
            (1.0, 0.0, 1.0),
            (-1.0, 0.0, -1.0)
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
            (Double.nan, Double.infinity)
        ]
    )
    internal func addingNaNReturnsNaN(
        augend: Double,
        addend: Double
    ) {
        #expect((augend + addend).isNaN)
    }
}
