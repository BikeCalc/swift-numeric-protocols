//
// IntTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

internal final class IntTests: XCTestCase {}

// MARK: - Addable

extension IntTests {
    internal func test_additionSucceeds() {
        // Given
        let augend: Int = 2
        let addend: Int = 4
        
        // When
        let sum: Int = augend + addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_additionEqualSucceeds() {
        // Given
        var sum: Int = 2
        let addend: Int = 4
        
        // When
        sum += addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addingSucceeds() {
        // Given
        let augend: Int = 2
        let addend: Int = 4
        
        // When
        let sum: Int = augend.adding(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addSucceeds() {
        // Given
        var sum: Int = 2
        let addend: Int = 4
        
        // When
        sum.add(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
}

// MARK: - Comparable

extension IntTests {
    internal func test_isLessThanReturnsFalse() {
        // Given
        let lhs: Int = 2
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanReturnsTrue() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 2
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsFalse() {
        // Given
        let lhs: Int = 2
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsTrue() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanReturnsFalse() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 2
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanReturnsTrue() {
        // Given
        let lhs: Int = 2
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsFalse() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 2
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsTrue() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isWithinClosedRangeReturnsFalse() {
        // Given
        let value: Int = 4
        let lowerBound: Int = 1
        let upperBound: Int = 3
        let range: ClosedRange<Int> = lowerBound...upperBound
        
        // Then
        XCTAssertFalse(value.isWithin(range))
    }
    
    internal func test_isWithinClosedRangeReturnsTrue() {
        // Given
        let value: Int = 2
        let lowerBound: Int = 1
        let upperBound: Int = 3
        let range: ClosedRange<Int> = lowerBound...upperBound
        
        // Then
        XCTAssertTrue(value.isWithin(range))
    }
    
    internal func test_isWithinBoundsReturnsFalse() {
        // Given
        let value: Int = 4
        let lowerBound: Int = 1
        let upperBound: Int = 3
        
        // Then
        XCTAssertFalse(value.isWithin(lowerBound, to: upperBound))
    }
    
    internal func test_isWithinBoundsReturnsTrue() {
        // Given
        let value: Int = 2
        let lowerBound: Int = 1
        let upperBound: Int = 3
        
        // Then
        XCTAssertTrue(value.isWithin(lowerBound, to: upperBound))
    }
}

// MARK: - Divisible

extension IntTests {
    internal func test_isInvertibleReturnsFalse() {
        // Given
        let value: Int = .zero
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isInvertibleReturnsTrue() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isDivisibleByReturnsFalse() {
        // Given
        let dividend: Int = 3
        let divisor: Int = 0
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isDivisibleByReturnsTrue() {
        // Given
        let dividend: Int = 3
        let divisor: Int = 1
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isFactorOfReturnsFalse() {
        // Given
        let dividend: Int = 2
        let divisor: Int = 3
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isFactorOfReturnsTrue() {
        // Given
        let dividend: Int = 1
        let divisor: Int = 2
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_divisionSucceeds() {
        // Given
        let dividend: Int = 6
        let divisor: Int = 2
        
        // When
        let quotient: Int = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divisionEqualSucceeds() {
        // Given
        var quotient: Int = 6
        let divisor: Int = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_dividingBySucceeds() {
        // Given
        let dividend: Int = 6
        let divisor: Int = 2
        
        // When
        let quotient: Int = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divideBySucceeds() {
        // Given
        var quotient: Int = 6
        let divisor: Int = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_halvedSucceeds() {
        // Given
        let value: Int = 1
        
        // When
        let half: Int = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
    
    internal func test_halveSucceeds() {
        // Given
        let value: Int = 1
        
        // When
        let half: Int = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
}

// MARK: - Equatable

extension IntTests {
    internal func test_isEqualToReturnsFalse() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 2
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEqualToReturnsTrue() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isUnequalToReturnsFalse() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 1
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isUnequalToReturnsTrue() {
        // Given
        let lhs: Int = 1
        let rhs: Int = 2
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isEvenReturnsFalse() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEvenReturnsTrue() {
        // Given
        let value: Int = 0
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isOddReturnsFalse() {
        // Given
        let value: Int = 0
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isOddReturnsTrue() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertTrue(result)
    }
}

// MARK: - Multipliable

extension IntTests {
    internal func test_muliplicationSucceeds() {
        // Given
        let multiplicand: Int = 2
        let multiplier: Int = 3
        
        // When
        let product: Int = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_muliplicationEqualSucceeds() {
        // Given
        var product: Int = 2
        let multiplier: Int = 3
        
        // When
        product *= multiplier

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyingBySucceeds() {
        // Given
        let multiplicand: Int = 2
        let multiplier: Int = 3
        
        // When
        let product: Int = multiplicand.multiplying(by: multiplier)
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyBySucceeds() {
        // Given
        var product: Int = 2
        let multiplier: Int = 3
        
        // When
        product.multiply(by: multiplier)

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_doubledSucceeds() {
        // Given
        let value: Int = 1
        
        // When
        let double: Int = value.doubled()
        
        // Then
        XCTAssertEqual(double, 2)
    }
    
    internal func test_doubleSucceeds() {
        // Given
        var value: Int = 1
        
        // When
        value.double()
        
        // Then
        XCTAssertEqual(value, 2)
    }
}

// MARK: - Negateable

extension IntTests {
    internal func test_isNegativeReturnsFalse() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isNegative

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isNegativeReturnsTrue() {
        // Given
        let value: Int = -1
        
        // When
        let result: Bool = value.isNegative

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isPositiveReturnsFalse() {
        // Given
        let value: Int = -1
        
        // When
        let result: Bool = value.isPositive

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isPositiveReturnsTrue() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isPositive

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isSignedSucceeds() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isSigned

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isOppositeReturnsFalse() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isOpposite(of: value)

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isOppositeReturnsTrue() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isOpposite(of: -value)

        // Then
        XCTAssertTrue(result)
    }
}

// MARK: - Raisable

extension IntTests {
    internal func test_isPowerOfReturnsFalse() {
        // Given
        let value: Int = 3
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertFalse(isPowerOfTwo)
    }
    
    internal func test_isPowerOfReturnsTrue() {
        // Given
        let value: Int = 4
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertTrue(isPowerOfTwo)
    }
    
    internal func test_exponentiationSucceeds() {
        // Given
        let base: Int = 2
        let exponent: UInt = 2
        
        // When
        let power: Int = base ** exponent
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_exponentiationEqualSucceeds() {
        // Given
        var power: Int = 2
        let exponent: UInt = 2
        
        // When
        power **= exponent

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raisingToSucceeds() {
        // Given
        let base: Int = 2
        let exponent: UInt = 2
        
        // When
        let power: Int = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raiseToSucceeds() {
        // Given
        var power: Int = 2
        let exponent: UInt = 2
        
        // When
        power.raise(to: exponent)

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squaredSucceeds() {
        // Given
        let base: Int = 2
        
        // When
        let power: Int = base.squared()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squareSucceeds() {
        // Given
        var power: Int = 2
        
        // When
        power.square()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_cubedSucceeds() {
        // Given
        let base: Int = 2
        
        // When
        let power: Int = base.cubed()

        // Then
        XCTAssertEqual(power, 8)
    }
    
    internal func test_cubeSucceeds() {
        // Given
        var power: Int = 2
        
        // When
        power.cube()

        // Then
        XCTAssertEqual(power, 8)
    }
    
    internal func test_raisingToNegSucceeds() {
        // Given
        let base: Int = 2
        let exponent: Int = -3
        
        // When
        let power: Int = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 0)
    }
    
    internal func test_raisingToZeroSucceeds() {
        // Given
        let base: Int = 2
        let exponent: Int = 0
        
        // When
        let power: Int = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, 1)
    }
    
    internal func test_raisingToOneSucceeds() {
        // Given
        let base: Int = 2
        let exponent: Int = 1
        
        // When
        let power: Int = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, base)
    }
    
    internal func test_raisedReportingOverflowToReturnsFalse() {
        // Given
        let base: Int = -2
        let exponent: Int = 3
        
        // When
        let report: Int.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, -8)
        XCTAssertEqual(report.overflow, false)
    }

    internal func test_raisedReportingOverflowToReturnsTrue() {
        // Given
        let base: Int = .max
        let exponent: Int = 3
        
        // When
        let report: Int.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 1)
        XCTAssertEqual(report.overflow, true)
    }
}

// MARK: - RepresentableByZero

extension IntTests {
    internal func test_isZeroReturnsFalse() {
        // Given
        let value: Int = 1
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isZeroReturnsTrue() {
        // Given
        let value: Int = .zero
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_additionReturnsZero() {
        // Given
        let augend: Int = .zero
        let addend: Int = .zero
        
        // When
        let sum: Int = augend + addend

        // Then
        XCTAssertEqual(sum, .zero)
    }
    
    internal func test_divisionByZero() {
        // TODO:
    }
    
    internal func test_multiplicationReturnsZero() {
        // Given
        let multiplicand: Int = .zero
        let multiplier: Int = .zero
        
        // When
        let product: Int = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, .zero)
    }
    
    internal func test_isMultipleOfZeroReturnsTrue() {
        // Given
        let multiplicand: Int = 0
        let multiplicator: Int = 0
        
        // When
        let result: Bool = multiplicand.isMultiple(of: multiplicator)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_subtractionReturnsZero() {
        // Given
        let minuend: Int = .zero
        let subtrahend: Int = .zero
        
        // When
        let difference: Int = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, .zero)
    }
}

// MARK: - Subtractable

extension IntTests {
    internal func test_subtractionSucceeds() {
        // Given
        let minuend: Int = 6
        let subtrahend: Int = 4
        
        // When
        let difference: Int = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractionEqualSucceeds() {
        // Given
        var difference: Int = 6
        let subtrahend: Int = 4
        
        // When
        difference -= subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractingSucceeds() {
        // Given
        let minuend: Int = 6
        let subtrahend: Int = 4
        
        // When
        let difference: Int = minuend.subtracting(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractSucceeds() {
        // Given
        var difference: Int = 6
        let subtrahend: Int = 4
        
        // When
        difference.subtract(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
}
