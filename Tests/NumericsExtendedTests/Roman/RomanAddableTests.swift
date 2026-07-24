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
    private static let additionArguments: [(Roman, Roman, Roman)] = [
        (2, 3, 5),
        (3, 4, 7)
    ]

    @Test(
        "Addition succeeds",
        arguments: Self.additionArguments
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
        arguments: Self.additionArguments
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
        arguments: Self.additionArguments
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
        arguments: Self.additionArguments
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
            2,
            3
        ] as Array<Roman>
    )
    internal func addingZeroPreservesAugend(augend: Roman) {
        #expect(augend + 0 == augend)
    }

    @Test(
        "Addition is commutative",
        arguments: Self.additionArguments
    )
    internal func additionIsCommutative(
        augend: Roman,
        addend: Roman,
        sum _: Roman
    ) {
        #expect(augend + addend == addend + augend)
    }
}
