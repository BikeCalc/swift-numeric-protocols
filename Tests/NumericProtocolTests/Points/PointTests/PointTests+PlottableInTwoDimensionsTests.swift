// PointTests+PlottableInTwoDimensionsTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension PointTests: PlottableInTwoDimensionsTests {
	func test_isLeftestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 1, y: 0)
		let rhs: TestSubject = .init(x: 0, y: 0)
		
		// When
		let result: Bool = lhs.isLeftest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isLeftestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0)
		let rhs: TestSubject = .init(x: 1, y: 0)
		
		// When
		let result: Bool = lhs.isLeftest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isRightestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0)
		let rhs: TestSubject = .init(x: 1, y: 0)
		
		// When
		let result: Bool = lhs.isRightest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isRightestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 1, y: 0)
		let rhs: TestSubject = .init(x: 0, y: 0)
		
		// When
		let result: Bool = lhs.isRightest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isHighestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0)
		let rhs: TestSubject = .init(x: 0, y: 1)
		
		// When
		let result: Bool = lhs.isHighest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isHighestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 1)
		let rhs: TestSubject = .init(x: 0, y: 0)
		
		// When
		let result: Bool = lhs.isHighest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isLowestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 1)
		let rhs: TestSubject = .init(x: 0, y: 0)
		
		// When
		let result: Bool = lhs.isLowest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isLowestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0)
		let rhs: TestSubject = .init(x: 0, y: 1)
		
		// When
		let result: Bool = lhs.isLowest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
}
