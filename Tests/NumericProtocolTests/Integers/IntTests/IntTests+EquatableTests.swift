// IntTests+EquatableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension IntTests: EquatableTests {
	func test_isEqualToReturnsFalse() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 2
		
		// When
		let result: Bool = lhs.isEqual(to: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isEqualToReturnsTrue() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isEqual(to: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isUnequalToReturnsFalse() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isUnequal(to: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isUnequalToReturnsTrue() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 2
		
		// When
		let result: Bool = lhs.isUnequal(to: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isEvenReturnsFalse() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isEven

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isEvenReturnsTrue() {
		// Given
		let value: TestSubject = 0
		
		// When
		let result: Bool = value.isEven

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isOddReturnsFalse() {
		// Given
		let value: TestSubject = 0
		
		// When
		let result: Bool = value.isOdd

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isOddReturnsTrue() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isOdd

		// Then
		XCTAssertTrue(result)
	}
}
