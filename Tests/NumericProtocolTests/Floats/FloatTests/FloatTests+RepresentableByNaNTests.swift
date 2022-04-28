// FloatTests+RepresentableByNaNTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: RepresentableByNaNTests {
	func test_isNaNReturnsFalse() {
		// Given
		let value: TestSubject = 1.0
		
		// When
		let result: Bool = value.isNaN
		
		// Then
		XCTAssertFalse(result)
	}

	func test_isNaNReturnsTrue() {
		// Given
		let value: TestSubject = .nan
		
		// When
		let result: Bool = value.isNaN
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_nanIsEqualToNaNReturnsFalse() {
		// Given
		let nan: TestSubject = .nan
		
		// Then
		XCTAssertNotEqual(nan, nan)
	}
	
	func test_additionReturnsNaN() {
		// Given
		let augend: TestSubject = .nan
		let addend: TestSubject = .nan
		
		// When
		let sum: TestSubject = augend + addend

		// Then
		XCTAssertTrue(sum.isNaN)
	}
	
	func test_divisionReturnsNaN() {
		// Given
		let dividend: TestSubject = .nan
		let divisor: TestSubject = .nan
		
		// When
		let quotient: TestSubject = dividend / divisor

		// Then
		XCTAssertTrue(quotient.isNaN)
	}
	
	func test_multiplicationReturnsNaN() {
		// Given
		let multiplicand: TestSubject = .nan
		let multiplier: TestSubject = .nan
		
		// When
		let product: TestSubject = multiplicand * multiplier
		
		// Then
		XCTAssertTrue(product.isNaN)
	}
	
	func test_subtractionReturnsNaN() {
		// Given
		let minuend: TestSubject = .nan
		let subtrahend: TestSubject = .nan
		
		// When
		let difference: TestSubject = minuend - subtrahend

		// Then
		XCTAssertTrue(difference.isNaN)
	}
	
	func test_descriptionReturnsNaN() {
		// Given
		let value: TestSubject = .nan
		
		// Then
		XCTAssertEqual(value.description, "nan")
	}
}
