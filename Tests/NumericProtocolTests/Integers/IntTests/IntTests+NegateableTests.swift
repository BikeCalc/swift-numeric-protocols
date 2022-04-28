// IntTests+NegateableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension IntTests: NegateableTests {
	func test_isNegativeReturnsFalse() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isNegative

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isNegativeReturnsTrue() {
		// Given
		let value: TestSubject = -1
		
		// When
		let result: Bool = value.isNegative

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isPositiveReturnsFalse() {
		// Given
		let value: TestSubject = -1
		
		// When
		let result: Bool = value.isPositive

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isPositiveReturnsTrue() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isPositive

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isSignedSucceeds() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isSigned

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isOppositeReturnsFalse() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isOpposite(of: value)

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isOppositeReturnsTrue() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isOpposite(of: -value)

		// Then
		XCTAssertTrue(result)
	}
}

