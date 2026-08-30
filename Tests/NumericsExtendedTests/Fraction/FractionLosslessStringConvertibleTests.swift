// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Fraction LosslessStringConvertible Tests")
internal struct FractionLosslessStringConvertibleTests {
    @Test(
        "String initialization succeeds",
        arguments: [
            ("2", Fraction<Int>(2, 1)),
            ("1/2", Fraction<Int>(1, 2)),
            ("2/4", Fraction<Int>(2, 4)),
            ("2/-4", Fraction<Int>(2, -4))
        ]
    )
    internal func stringInitializationSucceeds(
        description: String,
        value: Fraction<Int>
    ) {
        #expect(Fraction<Int>(description) == value)
    }

    @Test(
        "String initialization fails",
        arguments: [
            "",
            "/",
            "1/",
            "/2",
            "1/2/3",
            "abc",
            "1.5"
        ]
    )
    internal func stringInitializationFails(description: String) {
        #expect(Fraction<Int>(description) == nil)
    }
}

// MARK: - Arithmetic Rules

extension FractionLosslessStringConvertibleTests {
    @Test(
        "Zero string initialization succeeds",
        arguments: [
            ("0", Fraction<Int>(0, 1)),
            ("0/1", Fraction<Int>(0, 1)),
            ("0/2", Fraction<Int>(0, 2))
        ]
    )
    internal func zeroStringInitializationSucceeds(
        description: String,
        value: Fraction<Int>
    ) {
        #expect(Fraction<Int>(description) == value)
    }

    @Test(
        "negative zero string initialization succeeds",
        arguments: [
            ("-0", Fraction<Int>(0, -1)),
            ("0/-1", Fraction<Int>(0, -1)),
            ("0/-2", Fraction<Int>(0, -2))
        ]
    )
    internal func negativeZeroStringInitializationSucceeds(
        description: String,
        value: Fraction<Int>
    ) {
        #expect(Fraction<Int>(description) == value)
    }
}

// MARK: - Rational Rules

extension FractionLosslessStringConvertibleTests {
    @Test(
        "Positive infinity string initialization succeeds",
        arguments: [
            "inf",
            "+inf",
            "infinity",
            "+infinity"
        ]
    )
    internal func positiveInfinityStringInitializationSucceeds(description: String) {
        #expect(Fraction<Int>(description) == .infinity)
    }

    @Test(
        "Negative infinity string initialization succeeds",
        arguments: [
            "-inf",
            "-infinity"
        ]
    )
    internal func negativeInfinityStringInitializationSucceeds(description: String) {
        #expect(Fraction<Int>(description) == .negativeInfinity)
    }

    @Test(
        "NaN string initialization succeeds",
        arguments: [
            "nan",
            "+nan",
            "-nan"
        ]
    )
    internal func nanStringInitializationSucceeds(description: String) {
        #expect(Fraction<Int>(description)?.isNaN == true)
    }
}
