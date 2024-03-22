//
// UIntTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

internal final class UIntTests: XCTestCase {
	typealias TestSubject = UInt
}

extension UIntTests: AddableTests {
    internal func test_additionSucceeds() {
        // Given
        let augend: TestSubject = 2
        let addend: TestSubject = 4
        
        // When
        let sum: TestSubject = augend + addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_additionEqualSucceeds() {
        // Given
        var sum: TestSubject = 2
        let addend: TestSubject = 4
        
        // When
        sum += addend

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addingSucceeds() {
        // Given
        let augend: TestSubject = 2
        let addend: TestSubject = 4
        
        // When
        let sum: TestSubject = augend.adding(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addSucceeds() {
        // Given
        var sum: TestSubject = 2
        let addend: TestSubject = 4
        
        // When
        sum.add(addend)

        // Then
        XCTAssertEqual(sum, 6)
    }
}

extension UIntTests: ComparableTests {
    internal func test_isLessThanReturnsFalse() {
        // Given
        let lhs: TestSubject = 2
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanReturnsTrue() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 2
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsFalse() {
        // Given
        let lhs: TestSubject = 2
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsTrue() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanReturnsFalse() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 2
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanReturnsTrue() {
        // Given
        let lhs: TestSubject = 2
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsFalse() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 2
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsTrue() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isWithinClosedRangeReturnsFalse() {
        // Given
        let value: TestSubject = 4
        let lowerBound: TestSubject = 1
        let upperBound: TestSubject = 3
        let range: ClosedRange<TestSubject> = lowerBound...upperBound
        
        // Then
        XCTAssertFalse(value.isWithin(range))
    }
    
    internal func test_isWithinClosedRangeReturnsTrue() {
        // Given
        let value: TestSubject = 2
        let lowerBound: TestSubject = 1
        let upperBound: TestSubject = 3
        let range: ClosedRange<TestSubject> = lowerBound...upperBound
        
        // Then
        XCTAssertTrue(value.isWithin(range))
    }
    
    internal func test_isWithinBoundsReturnsFalse() {
        // Given
        let value: TestSubject = 4
        let lowerBound: TestSubject = 1
        let upperBound: TestSubject = 3
        
        // Then
        XCTAssertFalse(value.isWithin(lowerBound, to: upperBound))
    }
    
    internal func test_isWithinBoundsReturnsTrue() {
        // Given
        let value: TestSubject = 2
        let lowerBound: TestSubject = 1
        let upperBound: TestSubject = 3
        
        // Then
        XCTAssertTrue(value.isWithin(lowerBound, to: upperBound))
    }
}

extension UIntTests: DivisibleTests {
    internal func test_isInvertibleReturnsFalse() {
        // Given
        let value: TestSubject = .zero
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isInvertibleReturnsTrue() {
        // Given
        let value: TestSubject = 1
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isDivisibleByReturnsFalse() {
        // Given
        let dividend: TestSubject = 3
        let divisor: TestSubject = 0
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isDivisibleByReturnsTrue() {
        // Given
        let dividend: TestSubject = 3
        let divisor: TestSubject = 1
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isFactorOfReturnsFalse() {
        // Given
        let dividend: TestSubject = 2
        let divisor: TestSubject = 3
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isFactorOfReturnsTrue() {
        // Given
        let dividend: TestSubject = 1
        let divisor: TestSubject = 2
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_divisionSucceeds() {
        // Given
        let dividend: TestSubject = 6
        let divisor: TestSubject = 2
        
        // When
        let quotient: TestSubject = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divisionEqualSucceeds() {
        // Given
        var quotient: TestSubject = 6
        let divisor: TestSubject = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_dividingBySucceeds() {
        // Given
        let dividend: TestSubject = 6
        let divisor: TestSubject = 2
        
        // When
        let quotient: TestSubject = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divideBySucceeds() {
        // Given
        var quotient: TestSubject = 6
        let divisor: TestSubject = 2
        
        // When
        quotient.divide(by: divisor)

        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_halvedSucceeds() {
        // Given
        let value: TestSubject = 1
        
        // When
        let half: TestSubject = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
    
    internal func test_halveSucceeds() {
        // Given
        let value: TestSubject = 1
        
        // When
        let half: TestSubject = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
}

extension UIntTests: EquatableTests {
    internal func test_isEqualToReturnsFalse() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 2
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEqualToReturnsTrue() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isUnequalToReturnsFalse() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 1
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isUnequalToReturnsTrue() {
        // Given
        let lhs: TestSubject = 1
        let rhs: TestSubject = 2
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isEvenReturnsFalse() {
        // Given
        let value: TestSubject = 1
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEvenReturnsTrue() {
        // Given
        let value: TestSubject = 0
        
        // When
        let result: Bool = value.isEven

        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isOddReturnsFalse() {
        // Given
        let value: TestSubject = 0
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isOddReturnsTrue() {
        // Given
        let value: TestSubject = 1
        
        // When
        let result: Bool = value.isOdd

        // Then
        XCTAssertTrue(result)
    }
}

extension UIntTests: MultipliableTests {
    internal func test_muliplicationSucceeds() {
        // Given
        let multiplicand: TestSubject = 2
        let multiplier: TestSubject = 3
        
        // When
        let product: TestSubject = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_muliplicationEqualSucceeds() {
        // Given
        var product: TestSubject = 2
        let multiplier: TestSubject = 3
        
        // When
        product *= multiplier

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyingBySucceeds() {
        // Given
        let multiplicand: TestSubject = 2
        let multiplier: TestSubject = 3
        
        // When
        let product: TestSubject = multiplicand.multiplying(by: multiplier)
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyBySucceeds() {
        // Given
        var product: TestSubject = 2
        let multiplier: TestSubject = 3
        
        // When
        product.multiply(by: multiplier)

        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_doubledSucceeds() {
        // Given
        let value: TestSubject = 1
        
        // When
        let double: TestSubject = value.doubled()
        
        // Then
        XCTAssertEqual(double, 2)
    }
    
    internal func test_doubleSucceeds() {
        // Given
        var value: TestSubject = 1
        
        // When
        value.double()
        
        // Then
        XCTAssertEqual(value, 2)
    }
}

extension UIntTests: RaisableTests {
    internal func test_isPowerOfReturnsFalse() {
        // Given
        let value: TestSubject = 3
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertFalse(isPowerOfTwo)
    }
    
    internal func test_isPowerOfReturnsTrue() {
        // Given
        let value: TestSubject = 4
        
        // When
        let isPowerOfTwo: Bool = value.isPower(of: 2)

        // Then
        XCTAssertTrue(isPowerOfTwo)
    }
    
    internal func test_exponentiationSucceeds() {
        // Given
        let base: TestSubject = 2
        let exponent: UInt = 2
        
        // When
        let power: TestSubject = base ** exponent
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_exponentiationEqualSucceeds() {
        // Given
        var power: TestSubject = 2
        let exponent: UInt = 2
        
        // When
        power **= exponent

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raisingToSucceeds() {
        // Given
        let base: TestSubject = 2
        let exponent: UInt = 2
        
        // When
        let power: TestSubject = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_raiseToSucceeds() {
        // Given
        var power: TestSubject = 2
        let exponent: UInt = 2
        
        // When
        power.raise(to: exponent)

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squaredSucceeds() {
        // Given
        let base: TestSubject = 2
        
        // When
        let power: TestSubject = base.squared()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_squareSucceeds() {
        // Given
        var power: TestSubject = 2
        
        // When
        power.square()

        // Then
        XCTAssertEqual(power, 4)
    }
    
    internal func test_cubedSucceeds() {
        // Given
        let base: TestSubject = 2
        
        // When
        let power: TestSubject = base.cubed()

        // Then
        XCTAssertEqual(power, 8)
    }
    
    internal func test_cubeSucceeds() {
        // Given
        var power: TestSubject = 2
        
        // When
        power.cube()

        // Then
        XCTAssertEqual(power, 8)
    }
}

extension UIntTests {
    internal func test_raisingToNegSucceeds() {
        // Given
        let base: TestSubject = 2
        let exponent: Int = -3
        
        // When
        let power: TestSubject = base.raising(to: exponent)
        
        // Then
        XCTAssertEqual(power, 0)
    }
    
    internal func test_raisingToZeroSucceeds() {
        // Given
        let base: TestSubject = 2
        let exponent: TestSubject = 0
        
        // When
        let power: TestSubject = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, 1)
    }
    
    internal func test_raisingToOneSucceeds() {
        // Given
        let base: TestSubject = 2
        let exponent: TestSubject = 1
        
        // When
        let power: TestSubject = base.raising(to: exponent)

        // Then
        XCTAssertEqual(power, base)
    }
}

extension UIntTests {
    internal func test_raisedReportingOverflowToReturnsFalse() {
        // Given
        let base: TestSubject = 2
        let exponent: TestSubject = 3
        
        // When
        let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 8)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_raisedReportingOverflowToReturnsTrue() {
        // Given
        let base: TestSubject = .max
        let exponent: TestSubject = 3
        
        // When
        let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 1)
        XCTAssertEqual(report.overflow, true)
    }
}

extension UIntTests: RepresentableByZeroTests {
    internal func test_isZeroReturnsFalse() {
        // Given
        let value: TestSubject = 1
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isZeroReturnsTrue() {
        // Given
        let value: TestSubject = .zero
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_additionReturnsZero() {
        // Given
        let augend: TestSubject = .zero
        let addend: TestSubject = .zero
        
        // When
        let sum: TestSubject = augend + addend

        // Then
        XCTAssertEqual(sum, .zero)
    }
    
    internal func test_divisionByZero() {
        // TODO:
    }
    
    internal func test_multiplicationReturnsZero() {
        // Given
        let multiplicand: TestSubject = .zero
        let multiplier: TestSubject = .zero
        
        // When
        let product: TestSubject = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, .zero)
    }
    
    internal func test_isMultipleOfZeroReturnsTrue() {
        // Given
        let multiplicand: TestSubject = 0
        let multiplicator: TestSubject = 0
        
        // When
        let result: Bool = multiplicand.isMultiple(of: multiplicator)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_subtractionReturnsZero() {
        // Given
        let minuend: TestSubject = .zero
        let subtrahend: TestSubject = .zero
        
        // When
        let difference: TestSubject = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, .zero)
    }
}

extension UIntTests: SubtractableTests {
    internal func test_subtractionSucceeds() {
        // Given
        let minuend: TestSubject = 6
        let subtrahend: TestSubject = 4
        
        // When
        let difference: TestSubject = minuend - subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractionEqualSucceeds() {
        // Given
        var difference: TestSubject = 6
        let subtrahend: TestSubject = 4
        
        // When
        difference -= subtrahend

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractingSucceeds() {
        // Given
        let minuend: TestSubject = 6
        let subtrahend: TestSubject = 4
        
        // When
        let difference: TestSubject = minuend.subtracting(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractSucceeds() {
        // Given
        var difference: TestSubject = 6
        let subtrahend: TestSubject = 4
        
        // When
        difference.subtract(subtrahend)

        // Then
        XCTAssertEqual(difference, 2)
    }
}
