//
// Int4AddableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 Addable Tests")
internal struct Int4AddableTests {
    private static let additionArguments: [(Int4, Int4, Int4)] = [
        (2, 3, 5),
        (3, 4, 7),
        (-2, 3, 1),
        (-3, -4, -7)
    ]

    @Test(
        "Addition succeeds",
        arguments: Self.additionArguments
    )
    internal func additionSucceeds(
        augend: Int4,
        addend: Int4,
        sum: Int4
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: Self.additionArguments
    )
    internal func additionEqualSucceeds(
        augend: Int4,
        addend: Int4,
        sum: Int4
    ) {
        var runningSum: Int4 = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: Self.additionArguments
    )
    internal func addingSucceeds(
        augend: Int4,
        addend: Int4,
        sum: Int4
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: Self.additionArguments
    )
    internal func addSucceeds(
        augend: Int4,
        addend: Int4,
        sum: Int4
    ) {
        var runningSum: Int4 = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

// MARK: - Arithmetic Rules

extension Int4AddableTests {
    @Test(
        "Adding zero preserves augend",
        arguments: [
            2,
            3,
            -2,
            -3
        ] as Array<Int4>
    )
    internal func addingZeroPreservesAugend(augend: Int4) {
        #expect(augend + 0 == augend)
    }

    @Test(
        "Adding opposite values returns zero",
        arguments: [
            (2, -2),
            (3, -3),
            (-2, 2),
            (-3, 3)
        ] as Array<(Int4, Int4)>
    )
    internal func addingOppositeValuesReturnsZero(
        augend: Int4,
        addend: Int4
    ) {
        #expect(augend + addend == 0)
    }

    @Test(
        "Addition is commutative",
        arguments: Self.additionArguments
    )
    internal func additionIsCommutative(
        augend: Int4,
        addend: Int4,
        sum _: Int4
    ) {
        #expect(augend + addend == addend + augend)
    }
}
