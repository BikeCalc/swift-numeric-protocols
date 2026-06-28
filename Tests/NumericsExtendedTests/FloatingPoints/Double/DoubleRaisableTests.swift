//
// DoubleRaisableTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Double Raisable")
internal struct DoubleRaisableTests {
    @Test(
        "Is power of",
        arguments: [
            (0.0, 0.0, true),
            (1.0, 0.0, false),
            (1.0, 1.0, true),
            (4.0, 1.0, false),
            (4.0, 2.0, true),
            (9.0, 2.0, false),
            (1.0, -1.0, true),
            (-1.0, -1.0, true),
            (2.0, -1.0, false),
            (4.0, -2.0, true),
            (-8.0, -2.0, true),
            (8.0, -2.0, false)
        ]
    )
    internal func isPowerOf(value: Double, other: Double, result: Bool) {
        #expect(value.isPower(of: other) == result)
    }
    
    @Test(
        "Exponentiation succeeds",
        arguments: [
            (2.0, 0, 1.0),
            (2.0, 1, 2.0),
            (2.0, 2, 4.0)
        ]
    )
    internal func exponentiationSucceeds(base: Double, exponent: Double.Exponent, power: Double) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Exponentiation equal succeeds",
        arguments: [
            (2.0, 0, 1.0),
            (2.0, 1, 2.0),
            (2.0, 2, 4.0)
        ]
    )
    internal func exponentiationEqualSucceeds(base: Double, exponent: Double.Exponent, power: Double) {
        var runningPower: Double = base
        runningPower **= exponent
        #expect(runningPower == power)
    }
    
    @Test(
        "Raising to succeeds",
        arguments: [
            (2.0, 0, 1.0),
            (2.0, 1, 2.0),
            (2.0, 2, 4.0)
        ]
    )
    internal func raisingToSucceeds(base: Double, exponent: Double.Exponent, power: Double) {
        #expect(base.raising(to: exponent) == power)
    }
    
    @Test(
        "Raise to succeeds",
        arguments: [
            (2.0, 0, 1.0),
            (2.0, 1, 2.0),
            (2.0, 2, 4.0)
        ]
    )
    internal func raiseToSucceeds(base: Double, exponent: Double.Exponent, power: Double) {
        var runningPower: Double = base
        runningPower.raise(to: exponent)
        #expect(runningPower == power)
    }
    
    @Test(
        "Squared succeeds",
        arguments: [
            (2.0, 4.0),
            (-2.0, 4.0)
        ]
    )
    internal func squaredSucceeds(base: Double, power: Double) {
        #expect(base.squared() == power)
    }
    
    @Test(
        "Square succeeds",
        arguments: [
            (2.0, 4.0),
            (-2.0, 4.0)
        ]
    )
    internal func squareSucceeds(base: Double, power: Double) {
        var runningPower: Double = base
        runningPower.square()
        #expect(runningPower == power)
    }
    
    @Test(
        "Cubed succeeds",
        arguments: [
            (2.0, 8.0),
            (-2.0, -8.0)
        ]
    )
    internal func cubedSucceeds(base: Double, power: Double) {
        #expect(base.cubed() == power)
    }
    
    @Test(
        "Cube succeeds",
        arguments: [
            (2.0, 8.0),
            (-2.0, -8.0)
        ]
    )
    internal func cubeSucceeds(base: Double, power: Double) {
        var runningPower: Double = base
        runningPower.cube()
        #expect(runningPower == power)
    }
}

// MARK: - Rules

extension DoubleRaisableTests {
    @Test(
        "Negative base exponentiation follows parity rule",
        arguments: [
            (-2.0, 1, -2.0),
            (-2.0, 2, 4.0),
            (-2.0, 3, -8.0)
        ]
    )
    internal func negativeBaseExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative exponent returns reciprocal power",
        arguments: [
            (2.0, -1, 0.5),
            (2.0, -2, 0.25),
            (2.0, -3, 0.125)
        ]
    )
    internal func negativeExponentReturnsReciprocalPower(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative base with negative exponent follows parity rule",
        arguments: [
            (-2.0, -1, -0.5),
            (-2.0, -2, 0.25),
            (-2.0, -3, -0.125)
        ]
    )
    internal func negativeBaseWithNegativeExponentFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Zero base exponentiation follows floating-point rules",
        arguments: [
            (0.0, 0, 1.0),
            (0.0, 1, 0.0),
            (0.0, -1, Double.infinity)
        ]
    )
    internal func zeroBaseExponentiationFollowsFloatingPointRules(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative zero exponentiation follows parity rule",
        arguments: [
            (-0.0, 0, 1.0),
            (-0.0, 1, -0.0),
            (-0.0, 2, 0.0),
            (-0.0, -1, -Double.infinity),
            (-0.0, -2, Double.infinity)
        ]
    )
    internal func negativeZeroExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative zero exponentiation preserves negative sign",
        arguments: [
            (-0.0, 1)
        ]
    )
    internal func negativeZeroExponentiationPreservesNegativeSign(
        base: Double,
        exponent: Double.Exponent
    ) {
        let power: Double = base ** exponent
        
        #expect(power == 0.0)
        #expect(power.sign == .minus)
    }
    
    @Test(
        "NaN raised to nonzero exponent returns NaN",
        arguments: [
            (Double.nan, -1),
            (Double.nan, 1),
            (Double.nan, 2)
        ]
    )
    internal func nanRaisedToNonzeroExponentReturnsNaN(
        base: Double,
        exponent: Double.Exponent
    ) {
        #expect((base ** exponent).isNaN)
    }
    
    @Test(
        "NaN raised to zero returns one",
        arguments: [
            (Double.nan, 0, 1.0)
        ]
    )
    internal func nanRaisedToZeroReturnsOne(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Positive infinity exponentiation follows reciprocal rules",
        arguments: [
            (Double.infinity, 0, 1.0),
            (Double.infinity, 1, Double.infinity),
            (Double.infinity, -1, 0.0)
        ]
    )
    internal func positiveInfinityExponentiationFollowsReciprocalRules(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative infinity exponentiation follows parity rule",
        arguments: [
            (Double.negativeInfinity, 0, 1.0),
            (Double.negativeInfinity, 1, Double.negativeInfinity),
            (Double.negativeInfinity, 2, Double.infinity),
            (Double.negativeInfinity, -1, -0.0),
            (Double.negativeInfinity, -2, 0.0)
        ]
    )
    internal func negativeInfinityExponentiationFollowsParityRule(
        base: Double,
        exponent: Double.Exponent,
        power: Double
    ) {
        #expect(base ** exponent == power)
    }
    
    @Test(
        "Negative infinity exponentiation preserves negative zero sign",
        arguments: [
            (Double.negativeInfinity, -1)
        ]
    )
    internal func negativeInfinityExponentiationPreservesNegativeZeroSign(
        base: Double,
        exponent: Double.Exponent
    ) {
        let power: Double = base ** exponent
        
        #expect(power == 0.0)
        #expect(power.sign == .minus)
    }
}
