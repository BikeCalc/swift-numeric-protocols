// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Canonicalized Fraction Equatable Tests")
internal struct CanonicalizedFractionEquatableTests {
    private static let equalityArguments: [(Fraction<Int>, Fraction<Int>, Bool)] = [
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2), true),
        (Fraction<Int>(1, 2), Fraction<Int>(2, 3), false),
        (Fraction<Int>(-1, 2), Fraction<Int>(-1, 2), true),
        (Fraction<Int>(-1, 2), Fraction<Int>(1, -2), true)
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
        let lhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: lhs)
        let rhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: rhs)

        #expect((lhsWrapper == rhsWrapper) == result)
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
        let lhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: lhs)
        let rhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: rhs)

        #expect((lhsWrapper != rhsWrapper) == !result)
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
        let lhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: lhs)
        let rhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: rhs)

        #expect(lhsWrapper.isEqual(to: rhsWrapper) == result)
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
        let lhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: lhs)
        let rhsWrapper: Canonicalized<Fraction<Int>> = .init(wrappedValue: rhs)

        #expect(lhsWrapper.isUnequal(to: rhsWrapper) == !result)
    }
}

// MARK: - Rational Rules

extension CanonicalizedFractionEquatableTests {
    // TODO:
}
