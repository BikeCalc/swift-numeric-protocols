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
    @Test(
        "Addition succeeds",
        arguments: [
            (2, 4, 6),
            (-2, 4, 2)
        ] as Array<(Int4, Int4, Int4)>
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
        arguments: [
            (2, 4, 6),
            (-2, 4, 2)
        ] as Array<(Int4, Int4, Int4)>
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
        arguments: [
            (2, 4, 6),
            (-2, 4, 2)
        ] as Array<(Int4, Int4, Int4)>
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
        arguments: [
            (2, 4, 6),
            (-2, 4, 2)
        ] as Array<(Int4, Int4, Int4)>
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
            (0, 0),
            (1, 1),
            (-1, -1)
        ] as Array<(Int4, Int4)>
    )
    internal func addingZeroPreservesAugend(
        augend: Int4,
        sum: Int4
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
        ] as Array<(Int4, Int4, Int4)>
    )
    internal func addingOppositeValuesReturnsZero(
        augend: Int4,
        addend: Int4,
        sum: Int4
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition is commutative",
        arguments: [
            (2, 4),
            (-2, 4),
            (-2, -4)
        ] as Array<(Int4, Int4)>
    )
    internal func additionIsCommutative(
        lhs: Int4,
        rhs: Int4
    ) {
        #expect(lhs + rhs == rhs + lhs)
    }
}
