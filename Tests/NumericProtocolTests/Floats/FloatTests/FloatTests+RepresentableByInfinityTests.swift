// FloatTests+RepresentableByInfinityTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: RepresentableByInfinityTests {
	func test_isFiniteReturnsFalse() {
		// Given
		let value: TestSubject = .infinity
		
		// When
		let result: Bool = value.isFinite
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isFiniteReturnsTrue() {
		// Given
		let value: TestSubject = 1.0
		
		// When
		let result: Bool = value.isFinite
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isInfiniteReturnsFalse() {
		// Given
		let value: TestSubject = 1.0
		
		// When
		let result: Bool = value.isInfinite
		
		// Then
		XCTAssertFalse(result)
	}

	func test_isInfiniteReturnsTrue() {
		// Given
		let value: TestSubject = .infinity
		
		// When
		let result: Bool = value.isInfinite
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_addingInfinitySucceeds() {
		// Given
		let infinity: TestSubject = .infinity
		
		// When
		XCTAssertEqual(infinity.adding(infinity), infinity)
		XCTAssertTrue(infinity.adding(-infinity).isNaN)
		XCTAssertTrue((-infinity).adding(infinity).isNaN)
		XCTAssertEqual((-infinity).adding(-infinity), -infinity)
		XCTAssertEqual(infinity.adding(1), infinity)
		XCTAssertEqual(infinity.adding(-1), infinity)
		XCTAssertEqual(-infinity.adding(1), -infinity)
		XCTAssertEqual(-infinity.adding(-1), -infinity)
		XCTAssertEqual(.init(1).adding(infinity), infinity)
		XCTAssertEqual(.init(1).adding(-infinity), -infinity)
		XCTAssertEqual(.init(-1).adding(infinity), infinity)
		XCTAssertEqual(.init(-1).adding(-infinity), -infinity)
	}
	
	func test_dividingInfinitySucceeds() {
		// Given
		let infinity: TestSubject = .infinity
		let zero: TestSubject = .zero
		
		// Then
		XCTAssertTrue(infinity.dividing(by: infinity).isNaN)
		XCTAssertTrue(infinity.dividing(by: -infinity).isNaN)
		XCTAssertTrue((-infinity.dividing(by: infinity)).isNaN)
		XCTAssertTrue((-infinity.dividing(by: -infinity)).isNaN)
		XCTAssertEqual(infinity.dividing(by: 1.0), infinity)
		XCTAssertEqual(infinity.dividing(by: -1.0), -infinity)
		XCTAssertEqual(-infinity.dividing(by: 1.0), -infinity)
		XCTAssertEqual(-infinity.dividing(by: -1.0), infinity)
		XCTAssertEqual(.init(1).dividing(by: infinity), zero)
		XCTAssertEqual(.init(1).dividing(by: -infinity), zero)
		XCTAssertEqual(.init(-1).dividing(by: infinity), zero)
		XCTAssertEqual(.init(-1).dividing(by: -infinity), zero)
	}

	func test_multiplyingInfinitySucceeds() {
		// Given
		let infinity: TestSubject = .infinity
		
		// Then
		XCTAssertEqual(infinity.multiplying(by: infinity), infinity)
		XCTAssertEqual(infinity.multiplying(by: -infinity), -infinity)
		XCTAssertEqual(-infinity.multiplying(by: infinity), -infinity)
		XCTAssertEqual(-infinity.multiplying(by: -infinity), infinity)
		XCTAssertEqual(infinity.multiplying(by: 1), infinity)
		XCTAssertEqual(infinity.multiplying(by: -1), -infinity)
		XCTAssertEqual(-infinity.multiplying(by: 1), -infinity)
		XCTAssertEqual(-infinity.multiplying(by: -1), infinity)
		XCTAssertEqual(.init(1).multiplying(by: infinity), infinity)
		XCTAssertEqual(.init(1).multiplying(by: -infinity), -infinity)
		XCTAssertEqual(.init(-1).multiplying(by: infinity), -infinity)
		XCTAssertEqual(.init(-1).multiplying(by: -infinity), infinity)
	}
	
	func test_subtractingInfinitySucceeds() {
		// Given
		let infinity: TestSubject = .infinity
		
		// When
		XCTAssertTrue(infinity.subtracting(infinity).isNaN)
		XCTAssertEqual(infinity.subtracting(-infinity), infinity)
		XCTAssertEqual((-infinity).subtracting(infinity), -infinity)
		XCTAssertTrue((-infinity).subtracting(-infinity).isNaN)
		XCTAssertEqual(infinity.subtracting(1), infinity)
		XCTAssertEqual(infinity.subtracting(-1), infinity)
		XCTAssertEqual(-infinity.subtracting(1), -infinity)
		XCTAssertEqual(-infinity.subtracting(-1), -infinity)
		XCTAssertEqual(.init(1).subtracting(infinity), -infinity)
		XCTAssertEqual(.init(1).subtracting(-infinity), infinity)
		XCTAssertEqual(.init(-1).subtracting(infinity), -infinity)
		XCTAssertEqual(.init(-1).subtracting(-infinity), infinity)
	}
	
	func test_descriptionReturnsInfinity() {
		// Given
		let value: TestSubject = .infinity
		
		// Then
		XCTAssertEqual(value.description, "inf")
	}
	
	func test_descriptionReturnsNegativeInfinity() {
		// Given
		let value: TestSubject = .negativeInfinity
		
		// Then
		XCTAssertEqual(value.description, "-inf")
	}
}
