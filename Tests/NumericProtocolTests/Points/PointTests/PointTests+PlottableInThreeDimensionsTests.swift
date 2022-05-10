// PointTests+PlottableInThreeDimensionsTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension PointTests: PlottableInThreeDimensionsTests {
	func test_isFarthestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0, z: 0)
		let rhs: TestSubject = .init(x: 0, y: 0, z: 1)
		
		// When
		let result: Bool = lhs.isFarthest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isFarthestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0, z: 1)
		let rhs: TestSubject = .init(x: 0, y: 0, z: 0)
		
		// When
		let result: Bool = lhs.isFarthest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isNearestThanReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0, z: 1)
		let rhs: TestSubject = .init(x: 0, y: 0, z: 0)
		
		// When
		let result: Bool = lhs.isNearest(than: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isNearestThanReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(x: 0, y: 0, z: 0)
		let rhs: TestSubject = .init(x: 0, y: 0, z: 1)
		
		// When
		let result: Bool = lhs.isNearest(than: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
}
