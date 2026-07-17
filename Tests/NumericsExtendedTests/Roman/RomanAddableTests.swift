//
// RomanAddableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman Addable Tests")
internal struct RomanAddableTests {
    @Test(
        "Addition succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func additionSucceeds(
        augend: Roman,
        addend: Roman,
        sum: Roman
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func additionEqualSucceeds(
        augend: Roman,
        addend: Roman,
        sum: Roman
    ) {
        var runningSum: Roman = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func addingSucceeds(
        augend: Roman,
        addend: Roman,
        sum: Roman
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: [
            (0, 0, 0),
            (2, 4, 6)
        ] as Array<(Roman, Roman, Roman)>
    )
    internal func addSucceeds(
        augend: Roman,
        addend: Roman,
        sum: Roman
    ) {
        var runningSum: Roman = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

// MARK: - Arithmetic Rules

extension RomanAddableTests {
    @Test(
        "Adding zero preserves augend",
        arguments: [
            (0, 0),
            (1, 1)
        ] as Array<(Roman, Roman)>
    )
    internal func addingZeroPreservesAugend(
        augend: Roman,
        sum: Roman
    ) {
        #expect(augend + 0 == sum)
    }

    @Test(
        "Addition is commutative",
        arguments: [
            (0, 0),
            (2, 4)
        ] as Array<(Roman, Roman)>
    )
    internal func additionIsCommutative(
        lhs: Roman,
        rhs: Roman
    ) {
        #expect(lhs + rhs == rhs + lhs)
    }
}
