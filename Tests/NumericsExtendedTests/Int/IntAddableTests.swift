//
// IntAddableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Addable Tests")
internal struct IntAddableTests {
    @Test(
        "Addition succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6),
            (-2, 4, 2)
        ]
    )
    internal func additionSucceeds(
        augend: Int,
        addend: Int,
        sum: Int
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6),
            (-2, 4, 2)
        ]
    )
    internal func additionEqualSucceeds(
        augend: Int,
        addend: Int,
        sum: Int
    ) {
        var runningSum: Int = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6),
            (-2, 4, 2)
        ]
    )
    internal func addingSucceeds(
        augend: Int,
        addend: Int,
        sum: Int
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6),
            (-2, 4, 2)
        ]
    )
    internal func addSucceeds(
        augend: Int,
        addend: Int,
        sum: Int
    ) {
        var runningSum: Int = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

// MARK: - Arithmetic Rules

extension IntAddableTests {
    @Test(
        "Adding zero preserves augend",
        arguments: [
            (0, 0),
            (1, 1),
            (-1, -1)
        ]
    )
    internal func addingZeroPreservesAugend(
        augend: Int,
        sum: Int
    ) {
        #expect(augend + 0 == sum)
    }

    @Test(
        "Adding opposite values returns zero",
        arguments: [
            (0, 0, 0),
            (1, -1, 0),
            (-1, 1, 0),
            (5, -5, 0)
        ]
    )
    internal func addingOppositeValuesReturnsZero(
        augend: Int,
        addend: Int,
        sum: Int
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition is commutative",
        arguments: [
            (2, 4),
            (-2, 4),
            (-2, -4)
        ]
    )
    internal func additionIsCommutative(
        lhs: Int,
        rhs: Int
    ) {
        #expect(lhs + rhs == rhs + lhs)
    }
}
