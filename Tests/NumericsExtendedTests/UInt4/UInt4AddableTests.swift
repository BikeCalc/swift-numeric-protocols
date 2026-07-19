//
// UInt4AddableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 Addable Tests")
internal struct UInt4AddableTests {
    @Test(
        "Addition succeeds",
        arguments: [
            (2, 4, 6),
            (3, 5, 8)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func additionSucceeds(
        augend: UInt4,
        addend: UInt4,
        sum: UInt4
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: [
            (2, 4, 6),
            (3, 5, 8)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func additionEqualSucceeds(
        augend: UInt4,
        addend: UInt4,
        sum: UInt4
    ) {
        var runningSum: UInt4 = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: [
            (2, 4, 6),
            (3, 5, 8)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func addingSucceeds(
        augend: UInt4,
        addend: UInt4,
        sum: UInt4
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: [
            (2, 4, 6),
            (3, 5, 8)
        ] as Array<(UInt4, UInt4, UInt4)>
    )
    internal func addSucceeds(
        augend: UInt4,
        addend: UInt4,
        sum: UInt4
    ) {
        var runningSum: UInt4 = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

// MARK: - Arithmetic Rules

extension UInt4AddableTests {
    @Test(
        "Adding zero preserves augend",
        arguments: [
            (0, 0),
            (1, 1)
        ] as Array<(UInt4, UInt4)>
    )
    internal func addingZeroPreservesAugend(
        augend: UInt4,
        sum: UInt4
    ) {
        #expect(augend + 0 == sum)
    }

    @Test(
        "Addition is commutative",
        arguments: [
            (2, 4)
        ] as Array<(UInt4, UInt4)>
    )
    internal func additionIsCommutative(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs + rhs == rhs + lhs)
    }
}
