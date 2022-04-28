// UIntTests+MultipliableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension UIntTests: MultipliableTests {
	func test_muliplicationSucceeds() {
		// Given
		let multiplicand: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		let product: TestSubject = multiplicand * multiplier
		
		// Then
		XCTAssertEqual(product, 6)
	}
	
	func test_muliplicationEqualSucceeds() {
		// Given
		var product: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		product *= multiplier

		// Then
		XCTAssertEqual(product, 6)
	}
	
	func test_multiplyingBySucceeds() {
		// Given
		let multiplicand: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		let product: TestSubject = multiplicand.multiplying(by: multiplier)
		
		// Then
		XCTAssertEqual(product, 6)
	}
	
	func test_multiplyBySucceeds() {
		// Given
		var product: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		product.multiply(by: multiplier)

		// Then
		XCTAssertEqual(product, 6)
	}
	
	func test_doubledSucceeds() {
		// Given
		let value: TestSubject = 1
		
		// When
		let double: TestSubject = value.doubled()
		
		// Then
		XCTAssertEqual(double, 2)
	}
	
	func test_doubleSucceeds() {
		// Given
		var value: TestSubject = 1
		
		// When
		value.double()
		
		// Then
		XCTAssertEqual(value, 2)
	}
}
