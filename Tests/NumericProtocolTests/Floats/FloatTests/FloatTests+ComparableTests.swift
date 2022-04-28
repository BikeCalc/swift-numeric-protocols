// FloatTests+ComparableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: ComparableTests {
	func test_isLessThanReturnsFalse() {
		// Given
		let lhs: TestSubject = 2
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isLess(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isLessThanReturnsTrue() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 2
		
		// When
		let result: Bool = lhs.isLess(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isLessThanOrEqualToReturnsFalse() {
		// Given
		let lhs: TestSubject = 2
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isLessThanOrEqual(to: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isLessThanOrEqualToReturnsTrue() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isLessThanOrEqual(to: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isGreaterThanReturnsFalse() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 2
		
		// When
		let result: Bool = lhs.isGreater(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isGreaterThanReturnsTrue() {
		// Given
		let lhs: TestSubject = 2
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isGreater(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isGreaterThanOrEqualToReturnsFalse() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 2
		
		// When
		let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isGreaterThanOrEqualToReturnsTrue() {
		// Given
		let lhs: TestSubject = 1
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isWithinClosedRangeReturnsFalse() {
		// Given
		let value: TestSubject = 4
		let lowerBound: TestSubject = 1
		let upperBound: TestSubject = 3
		let range: ClosedRange<TestSubject> = lowerBound...upperBound
		
		// Then
		XCTAssertFalse(value.isWithin(range))
	}
	
	func test_isWithinClosedRangeReturnsTrue() {
		// Given
		let value: TestSubject = 2
		let lowerBound: TestSubject = 1
		let upperBound: TestSubject = 3
		let range: ClosedRange<TestSubject> = lowerBound...upperBound
		
		// Then
		XCTAssertTrue(value.isWithin(range))
	}
	
	func test_isWithinBoundsReturnsFalse() {
		// Given
		let value: TestSubject = 4
		let lowerBound: TestSubject = 1
		let upperBound: TestSubject = 3
		
		// Then
		XCTAssertFalse(value.isWithin(lowerBound, to: upperBound))
	}
	
	func test_isWithinBoundsReturnsTrue() {
		// Given
		let value: TestSubject = 2
		let lowerBound: TestSubject = 1
		let upperBound: TestSubject = 3
		
		// Then
		XCTAssertTrue(value.isWithin(lowerBound, to: upperBound))
	}
}
