// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("Double Truncatable Tests")
internal struct DoubleTruncatableTests {
    private static let truncationArguments: Array<(Double, Double.DecimalPlace, Double)> = [
        (1.2345, Double.DecimalPlace(0), 1.0),
        (-1.2345, Double.DecimalPlace(0), -1.0),
        (1.2345, Double.DecimalPlace(1), 1.2),
        (-1.2345, Double.DecimalPlace(1), -1.2),
        (1.2345, Double.DecimalPlace(2), 1.23),
        (-1.2345, Double.DecimalPlace(2), -1.23),
        (1.2399, Double.DecimalPlace(2), 1.23),
        (-1.2399, Double.DecimalPlace(2), -1.23),
        (0.555, Double.DecimalPlace(2), 0.55),
        (-0.555, Double.DecimalPlace(2), -0.55),
        (12.999, Double.DecimalPlace(2), 12.99),
        (-12.999, Double.DecimalPlace(2), -12.99)
    ]

    @Test(
        "Truncated to succeeds",
        arguments: Self.truncationArguments
    )
    internal func truncatedToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }

    @Test(
        "Truncate to succeeds",
        arguments: Self.truncationArguments
    )
    internal func truncateToSucceeds(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        var truncatedValue: Double = value
        truncatedValue.truncate(to: decimalPlace)
        #expect(truncatedValue == result)
    }
}

// MARK: - Arithmetic Rules

extension DoubleTruncatableTests {
    @Test(
        "Truncating whole value preserves value",
        arguments: [
            (1.0, Double.DecimalPlace(0)),
            (-1.0, Double.DecimalPlace(0)),
            (1.0, Double.DecimalPlace(2)),
            (-1.0, Double.DecimalPlace(2))
        ]
    )
    internal func truncatingWholeValuePreservesValue(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        #expect(value.truncated(to: decimalPlace) == value)
    }

    @Test(
        "Truncating follows toward-zero rule",
        arguments: [
            (1.9, Double.DecimalPlace(0), 1.0),
            (-1.9, Double.DecimalPlace(0), -1.0),
            (1.29, Double.DecimalPlace(1), 1.2),
            (-1.29, Double.DecimalPlace(1), -1.2)
        ]
    )
    internal func truncatingFollowsTowardZeroRule(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }
}

// MARK: - Floating-Point Rules

extension DoubleTruncatableTests {
    @Test(
        "Truncating infinity follows floating-point rules",
        arguments: [
            (Double.infinity, Double.DecimalPlace(0), Double.infinity),
            (Double.infinity, Double.DecimalPlace(2), Double.infinity),
            (Double.negativeInfinity, Double.DecimalPlace(0), Double.negativeInfinity),
            (Double.negativeInfinity, Double.DecimalPlace(2), Double.negativeInfinity)
        ]
    )
    internal func truncatingInfinityFollowsFloatingPointRules(
        value: Double,
        decimalPlace: Double.DecimalPlace,
        result: Double
    ) {
        #expect(value.truncated(to: decimalPlace) == result)
    }

    @Test(
        "Truncating NaN returns NaN",
        arguments: [
            (Double.nan, Double.DecimalPlace(0)),
            (Double.nan, Double.DecimalPlace(2))
        ]
    )
    internal func truncatingNaNReturnsNaN(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        #expect(value.truncated(to: decimalPlace).isNaN == true)
    }

    @Test(
        "Truncating zero preserves negative zero sign",
        arguments: [
            (-0.0, Double.DecimalPlace(0)),
            (-0.0, Double.DecimalPlace(2))
        ]
    )
    internal func truncatingZeroPreservesNegativeZeroSign(
        value: Double,
        decimalPlace: Double.DecimalPlace
    ) {
        let truncatedValue: Double = value.truncated(to: decimalPlace)

        #expect(truncatedValue == .zero)
        #expect(truncatedValue.sign == .minus)
    }
}
