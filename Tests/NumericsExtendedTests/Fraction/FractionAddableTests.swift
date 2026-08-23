// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Addable Tests")
internal struct FractionAddableTests {
    private static let additionArguments: [(Fraction<Int>, Fraction<Int>, Fraction<Int>)] = [
        (.init(1, 2), .init(1, 2), .init(2, 2)),
        (.init(1, 2), .init(2, 3), .init(7, 6)),
        (.init(-1, 2), .init(1, 2), .init(0, 2)),
        (.init(-1, 2), .init(-2, 3), .init(-7, 6))
    ]

    @Test(
        "Addition succeeds",
        arguments: Self.additionArguments
    )
    internal func additionSucceeds(
        augend: Fraction<Int>,
        addend: Fraction<Int>,
        sum: Fraction<Int>
    ) {
        #expect(augend + addend == sum)
    }

    @Test(
        "Addition equal succeeds",
        arguments: Self.additionArguments
    )
    internal func additionEqualSucceeds(
        augend: Fraction<Int>,
        addend: Fraction<Int>,
        sum: Fraction<Int>
    ) {
        var runningSum: Fraction<Int> = augend
        runningSum += addend
        #expect(runningSum == sum)
    }

    @Test(
        "Adding succeeds",
        arguments: Self.additionArguments
    )
    internal func addingSucceeds(
        augend: Fraction<Int>,
        addend: Fraction<Int>,
        sum: Fraction<Int>
    ) {
        #expect(augend.adding(addend) == sum)
    }

    @Test(
        "Add succeeds",
        arguments: Self.additionArguments
    )
    internal func addSucceeds(
        augend: Fraction<Int>,
        addend: Fraction<Int>,
        sum: Fraction<Int>
    ) {
        var runningSum: Fraction<Int> = augend
        runningSum.add(addend)
        #expect(runningSum == sum)
    }
}

