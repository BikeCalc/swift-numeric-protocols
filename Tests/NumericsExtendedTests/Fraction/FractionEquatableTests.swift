// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Equatable Tests")
internal struct FractionEquatableTests {
    private static let equalityArguments: [(Fraction<Int>, Fraction<Int>, Bool)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2), true),
        (Fraction<Int>(1, 2), Fraction<Int>(2, 3), false),
        (Fraction<Int>(-1, 2), Fraction<Int>(-1, 2), true),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, -2), false)
    ]

    @Test(
        "Equality succeeds",
        arguments: Self.equalityArguments
    )
    internal func equalitySucceeds(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs == rhs) == result)
    }

    @Test(
        "Inequality succeeds",
        arguments: Self.equalityArguments
    )
    internal func inequalitySucceeds(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs != rhs) == !result)
    }

    @Test(
        "Is equal succeeds",
        arguments: Self.equalityArguments
    )
    internal func isEqualSucceeds(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
    }

    @Test(
        "Is unequal succeeds",
        arguments: Self.equalityArguments
    )
    internal func isUnequalSucceeds(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}

// MARK: - Rational Rules

extension FractionEquatableTests {
    @Test("Equivalent representations follow stored representation rules")
    internal func equivalentRepresentationsFollowStoredRepresentationRules() {
        let lhs = Fraction<Int>(1, 2)
        let rhs = Fraction<Int>(2, 4)

        #expect((lhs == rhs) == false)
        #expect((lhs != rhs) == true)
        #expect(lhs.isEqual(to: rhs) == false)
        #expect(lhs.isUnequal(to: rhs) == true)
    }

    @Test(
        "Zero equality follows stored representation rules",
        arguments: [
            (Fraction<Int>(0, 1), Fraction<Int>(0, 1), true),
            (Fraction<Int>(0, -1), Fraction<Int>(0, 1), false),
            (Fraction<Int>(0, 1), Fraction<Int>(1, 1), false),
            (Fraction<Int>(0, -1), Fraction<Int>(1, 1), false)
        ]
    )
    internal func zeroEqualityFollowsStoredRepresentationRules(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs == rhs) == result)
        #expect((lhs != rhs) == !result)
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }

    @Test(
        "Positive infinity equality follows rational rules",
        arguments: [
            (Fraction<Int>.infinity, Fraction<Int>.infinity, true),
            (Fraction<Int>.infinity, Fraction<Int>.negativeInfinity, false)
        ]
    )
    internal func positiveInfinityEqualityFollowsRationalRules(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs == rhs) == result)
        #expect((lhs != rhs) == !result)
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }

    @Test(
        "Negative infinity equality follows rational rules",
        arguments: [
            (Fraction<Int>.negativeInfinity, Fraction<Int>.negativeInfinity, true),
            (Fraction<Int>.negativeInfinity, Fraction<Int>.infinity, false)
        ]
    )
    internal func negativeInfinityEqualityFollowsRationalRules(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs == rhs) == result)
        #expect((lhs != rhs) == !result)
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }

    @Test(
        "NaN equality follows rational rules",
        arguments: [
            (Fraction<Int>.nan, Fraction<Int>.nan, false),
            (Fraction<Int>.nan, Fraction<Int>(1, 1), false),
            (Fraction<Int>(1, 1), Fraction<Int>.nan, false)
        ]
    )
    internal func nanEqualityFollowsRationalRules(
        lhs: Fraction<Int>,
        rhs: Fraction<Int>,
        result: Bool
    ) {
        #expect((lhs == rhs) == result)
        #expect((lhs != rhs) == !result)
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
