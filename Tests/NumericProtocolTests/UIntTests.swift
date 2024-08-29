//
// UIntTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

internal final class UIntTests: XCTestCase {}

// MARK: - Addable

extension UIntTests {
    internal func test_additionSucceeds() {
        // Given
        let augend: UInt = 2
        let addend: UInt = 4
        
        // When
        let sum: UInt = augend + addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_additionEqualSucceeds() {
        // Given
        var sum: UInt = 2
        let addend: UInt = 4
        
        // When
        sum += addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addingSucceeds() {
        // Given
        let augend: UInt = 2
        let addend: UInt = 4
        
        // When
        let sum: UInt = augend.adding(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addSucceeds() {
        // Given
        var sum: UInt = 2
        let addend: UInt = 4
        
        // When
        sum.add(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
}

// MARK: - Comparable

extension UIntTests {
    internal func test_isLessThanReturnsFalse() {
        // Given
        let lhs: UInt = 2
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanReturnsTrue() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 2
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsFalse() {
        // Given
        let lhs: UInt = 2
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsTrue() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanReturnsFalse() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 2
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanReturnsTrue() {
        // Given
        let lhs: UInt = 2
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsFalse() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 2
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsTrue() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isWithinClosedRangeReturnsFalse() {
        // Given
        let value: UInt = 4
        let lowerBound: UInt = 1
        let upperBound: UInt = 3
        let range: ClosedRange<UInt> = lowerBound...upperBound
        
        // Then
        XCTAssertFalse(value.isWithin(range))
    }
    
    internal func test_isWithinClosedRangeReturnsTrue() {
        // Given
        let value: UInt = 2
        let lowerBound: UInt = 1
        let upperBound: UInt = 3
        let range: ClosedRange<UInt> = lowerBound...upperBound
        
        // Then
        XCTAssertTrue(value.isWithin(range))
    }
    
    internal func test_isWithinBoundsReturnsFalse() {
        // Given
        let value: UInt = 4
        let lowerBound: UInt = 1
        let upperBound: UInt = 3
        
        // Then
        XCTAssertFalse(value.isWithin(lowerBound, to: upperBound))
    }
    
    internal func test_isWithinBoundsReturnsTrue() {
        // Given
        let value: UInt = 2
        let lowerBound: UInt = 1
        let upperBound: UInt = 3
        
        // Then
        XCTAssertTrue(value.isWithin(lowerBound, to: upperBound))
    }
}

// MARK: - Divisible

extension UIntTests {
    internal func test_isInvertibleReturnsFalse() {
        // Given
        let value: UInt = .zero
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isInvertibleReturnsTrue() {
        // Given
        let value: UInt = 1
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isDivisibleByReturnsFalse() {
        // Given
        let dividend: UInt = 3
        let divisor: UInt = 0
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isDivisibleByReturnsTrue() {
        // Given
        let dividend: UInt = 3
        let divisor: UInt = 1
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isFactorOfReturnsFalse() {
        // Given
        let dividend: UInt = 2
        let divisor: UInt = 3
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isFactorOfReturnsTrue() {
        // Given
        let dividend: UInt = 1
        let divisor: UInt = 2
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_divisionSucceeds() {
        // Given
        let dividend: UInt = 6
        let divisor: UInt = 2
        
        // When
        let quotient: UInt = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divisionEqualSucceeds() {
        // Given
        var quotient: UInt = 6
        let divisor: UInt = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_dividingBySucceeds() {
        // Given
        let dividend: UInt = 6
        let divisor: UInt = 2
        
        // When
        let quotient: UInt = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divideBySucceeds() {
        // Given
        var quotient: UInt = 6
        let divisor: UInt = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_halvedSucceeds() {
        // Given
        let value: UInt = 1
        
        // When
        let half: UInt = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
    
    internal func test_halveSucceeds() {
        // Given
        let value: UInt = 1
        
        // When
        let half: UInt = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
}

// MARK: - Equatable

extension UIntTests {
    internal func test_isEqualToReturnsFalse() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 2
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEqualToReturnsTrue() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isUnequalToReturnsFalse() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 1
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isUnequalToReturnsTrue() {
        // Given
        let lhs: UInt = 1
        let rhs: UInt = 2
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isEvenReturnsFalse() {
        // Given
        let value: UInt = 1
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEvenReturnsTrue() {
        // Given
        let value: UInt = 0
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isOddReturnsFalse() {
        // Given
        let value: UInt = 0
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isOddReturnsTrue() {
        // Given
        let value: UInt = 1
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertTrue(result)
    }
}

// MARK: - Multipliable

extension UIntTests {
    internal func test_muliplicationSucceeds() {
        // Given
        let multiplicand: UInt = 2
        let multiplier: UInt = 3
        
        // When
        let product: UInt = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_muliplicationEqualSucceeds() {
        // Given
        var product: UInt = 2
        let multiplier: UInt = 3
        
        // When
        product *= multiplier

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyingBySucceeds() {
        // Given
        let multiplicand: UInt = 2
        let multiplier: UInt = 3
        
        // When
        let product: UInt = multiplicand.multiplying(by: multiplier)
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyBySucceeds() {
        // Given
        var product: UInt = 2
        let multiplier: UInt = 3
        
        // When
        product.multiply(by: multiplier)

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_doubledSucceeds() {
        // Given
        let value: UInt = 1
        
        // When
        let double: UInt = value.doubled()
        
        // Then
        XCTAssertEqual(double, 2)
    }
    
    internal func test_doubleSucceeds() {
        // Given
        var value: UInt = 1
        
        // When
        value.double()
        
        // Then
        XCTAssertEqual(value, 2)
    }
}

// MARK: - Raisable

extension UIntTests {
    internal func test_isPowerOfReturnsFalse() {
        // Given
        let value: UInt = 3
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertFalse(isPowerOfTwo)
    }
    
    internal func test_isPowerOfReturnsTrue() {
        // Given
        let value: UInt = 4
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertTrue(isPowerOfTwo)
    }
    
    internal func test_exponentiationSucceeds() {
        // Given
        let base: UInt = 2
        let exponent: UInt = 2
        
        // When
        let power: UInt = base ** exponent
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_exponentiationEqualSucceeds() {
        // Given
        var power: UInt = 2
        let exponent: UInt = 2
        
        // When
        power **= exponent

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raisingToSucceeds() {
        // Given
        let base: UInt = 2
        let exponent: UInt = 2
        
        // When
        let power: UInt = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raiseToSucceeds() {
        // Given
        var power: UInt = 2
        let exponent: UInt = 2
        
        // When
        power.raise(to: exponent)

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squaredSucceeds() {
        // Given
        let base: UInt = 2
        
        // When
        let power: UInt = base.squared()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squareSucceeds() {
        // Given
        var power: UInt = 2
        
        // When
        power.square()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_cubedSucceeds() {
        // Given
        let base: UInt = 2
        
        // When
        let power: UInt = base.cubed()

        // Then
        XCTAssertEqual(power, 8)
    }
    
    internal func test_cubeSucceeds() {
        // Given
        var power: UInt = 2
        
        // When
        power.cube()

        // Then
        XCTAssertEqual(power, 8)
    }
    
    internal func test_raisingToNegSucceeds() {
        // Given
        let base: UInt = 2
        let exponent: Int = -3
        
        // When
        let power: UInt = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 0)
    }
    
    internal func test_raisingToZeroSucceeds() {
        // Given
        let base: UInt = 2
        let exponent: UInt = 0
        
        // When
        let power: UInt = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, 1)
    }
    
    internal func test_raisingToOneSucceeds() {
        // Given
        let base: UInt = 2
        let exponent: UInt = 1
        
        // When
        let power: UInt = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, base)
    }
    
    internal func test_raisedReportingOverflowToReturnsFalse() {
        // Given
        let base: UInt = 2
        let exponent: UInt = 3
        
        // When
        let report: UInt.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 8)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_raisedReportingOverflowToReturnsTrue() {
        // Given
        let base: UInt = .max
        let exponent: UInt = 3
        
        // When
        let report: UInt.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 1)
        XCTAssertEqual(report.overflow, true)
    }
}

// MARK: - RepresentableByZero

extension UIntTests {
    internal func test_isZeroReturnsFalse() {
        // Given
        let value: UInt = 1
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isZeroReturnsTrue() {
        // Given
        let value: UInt = .zero
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_additionReturnsZero() {
        // Given
        let augend: UInt = .zero
        let addend: UInt = .zero
        
        // When
        let sum: UInt = augend + addend

        // Then
        XCTAssertEqual(sum, .zero)
    }
    
    internal func test_divisionByZero() {
        // TODO:
    }
    
    internal func test_multiplicationReturnsZero() {
        // Given
        let multiplicand: UInt = .zero
        let multiplier: UInt = .zero
        
        // When
        let product: UInt = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, .zero)
    }
    
    internal func test_isMultipleOfZeroReturnsTrue() {
        // Given
        let multiplicand: UInt = 0
        let multiplicator: UInt = 0
        
        // When
        let result: Bool = multiplicand.isMultiple(of: multiplicator)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_subtractionReturnsZero() {
        // Given
        let minuend: UInt = .zero
        let subtrahend: UInt = .zero
        
        // When
        let difference: UInt = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, .zero)
    }
}

// MARK: - Subtractable

extension UIntTests {
    internal func test_subtractionSucceeds() {
        // Given
        let minuend: UInt = 6
        let subtrahend: UInt = 4
        
        // When
        let difference: UInt = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractionEqualSucceeds() {
        // Given
        var difference: UInt = 6
        let subtrahend: UInt = 4
        
        // When
        difference -= subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractingSucceeds() {
        // Given
        let minuend: UInt = 6
        let subtrahend: UInt = 4
        
        // When
        let difference: UInt = minuend.subtracting(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractSucceeds() {
        // Given
        var difference: UInt = 6
        let subtrahend: UInt = 4
        
        // When
        difference.subtract(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
}
