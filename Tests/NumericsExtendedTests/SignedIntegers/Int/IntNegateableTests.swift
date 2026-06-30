//
// IntNegateableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int Negateable Tests")
internal struct IntNegateableTests {
    @Test(
        "Is negative",
        arguments: [
            (1, false),
            (-0, false),
            (0, false),
            (-1, true)
        ]
    )
    internal func isNegative(
        value: Int,
        result: Bool
    ) {
        #expect(value.isNegative == result)
    }
    
    @Test(
        "Is positive",
        arguments: [
            (-1, false),
            (-0, false),
            (0, false),
            (1, true)
        ]
    )
    internal func isPositive(
        value: Int,
        result: Bool
    ) {
        #expect(value.isPositive == result)
    }
    
    @Test(
        "Is signed",
        arguments: [
            (-1, true),
            (-0, true),
            (0, true),
            (1, true)
        ]
    )
    internal func isSigned(
        value: Int,
        result: Bool
    ) {
        #expect(value.isSigned == result)
    }
    
    @Test(
        "Is opposite",
        arguments: [
            (1, 1, false),
            (0, 0, true),
            (-0, 0, true),
            (0, -0, true),
            (-0, -0, true),
            (-1, 1, true),
            (1, -1, true)
        ]
    )
    internal func isOpposite(
        value: Int,
        other: Int,
        result: Bool
    ) {
        #expect(value.isOpposite(of: other) == result)
    }
}
