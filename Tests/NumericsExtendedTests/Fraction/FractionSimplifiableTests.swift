// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction Simplifiable Tests")
internal struct FractionSimplifiableTests {
    private static let simplicationArguments: [(Fraction<Int>, Fraction<Int>)] = [
        (Fraction<Int>(2, 4), Fraction<Int>(1, 2)),
        (Fraction<Int>(-2, 4), Fraction<Int>(-1, 2)),
        (Fraction<Int>(2, -4), Fraction<Int>(1, -2)),
        (Fraction<Int>(-2, -4), Fraction<Int>(-1, -2)),
        (Fraction<Int>(1, 2), Fraction<Int>(1, 2)),
        (Fraction<Int>(-1, 2), Fraction<Int>(-1, 2)),
        (Fraction<Int>(1, -2), Fraction<Int>(1, -2)),
        (Fraction<Int>(-1, -2), Fraction<Int>(-1, -2))
    ]

    @Test(
        "Is simplifiable",
        arguments: [
            (Fraction<Int>(2, 4), true),
            (Fraction<Int>(-2, 4), true),
            (Fraction<Int>(2, -4), true),
            (Fraction<Int>(-2, -4), true),
            (Fraction<Int>(1, 2), false),
            (Fraction<Int>(-1, 2), false),
            (Fraction<Int>(1, -2), false),
            (Fraction<Int>(-1, -2), false)
        ]
    )
    internal func isSimplifiable(
        value: Fraction<Int>,
        result: Bool
    ) {
        #expect(value.isSimplifiable == result)
        #expect(value.isSimplified == !result)
    }

    @Test(
        "Simplification succeeds",
        arguments: Self.simplicationArguments
    )
    internal func simplificationSucceeds(
        value: Fraction<Int>,
        result: Fraction<Int>
    ) {
        #expect(value.simplified() == result)
    }

    @Test(
        "Simplify succeeds",
        arguments: Self.simplicationArguments
    )
    internal func simplifySucceeds(
        value: Fraction<Int>,
        result: Fraction<Int>
    ) {
        var runningValue: Fraction<Int> = value
        runningValue.simplify()
        #expect(runningValue == result)
    }
}

// MARK: - Rational Rules

extension FractionSimplifiableTests {
    @Test(
        "Zero simplification follows rational rules",
        arguments: [
            (Fraction<Int>(0, 1), false, Fraction<Int>(0, 1)),
            (Fraction<Int>(0, 2), true, Fraction<Int>(0, 1)),
            (Fraction<Int>(0, -2), true, Fraction<Int>(0, -1))
        ]
    )
    internal func zeroSimplificationFollowsRationalRules(
        value: Fraction<Int>,
        isSimplifiable: Bool,
        result: Fraction<Int>
    ) {
        #expect(value.isSimplifiable == isSimplifiable)
        #expect(value.isSimplified == !isSimplifiable)
        #expect(value.simplified() == result)
    }

    @Test("Positive infinity simplification follows rational rules")
    internal func positiveInfinitySimplificationFollowsRationalRules() {
        #expect(Fraction<Int>.infinity.isSimplifiable == false)
        #expect(Fraction<Int>.infinity.isSimplified == true)
        #expect(Fraction<Int>.infinity.simplified() == .infinity)
    }

    @Test("Negative infinity simplification follows rational rules")
    internal func negativeInfinitySimplificationFollowsRationalRules() {
        #expect(Fraction<Int>.negativeInfinity.isSimplifiable == false)
        #expect(Fraction<Int>.negativeInfinity.isSimplified == true)
        #expect(Fraction<Int>.negativeInfinity.simplified() == .negativeInfinity)
    }

    @Test("NaN simplification follows rational rules")
    internal func nanSimplificationFollowsRationalRules() {
        #expect(Fraction<Int>.nan.isSimplifiable == false)
        #expect(Fraction<Int>.nan.isSimplified == true)
        #expect(Fraction<Int>.nan.simplified().isNaN == true)
    }
}

// MARK: - Fixed-Width Integer Rules

extension FractionSimplifiableTests {
    @Test("Int minimum terms simplify without overflow")
    internal func intMinimumTermsSimplifyWithoutOverflow() {
        let value: Fraction<Int> = .init(Int.min, Int.min)
        let expected: Fraction<Int> = .init(-1, -1)

        #expect(value.simplified() == expected)
    }
}
