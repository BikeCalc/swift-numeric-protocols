// FloatTests+AddableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: AddableTests {
	func test_additionSucceeds() {
		// Given
		let augend: TestSubject = 2
		let addend: TestSubject = 4
		
		// When
		let sum: TestSubject = augend + addend

		// Then
		XCTAssertEqual(sum, 6)
	}
	
	func test_additionEqualSucceeds() {
		// Given
		var sum: TestSubject = 2
		let addend: TestSubject = 4
		
		// When
		sum += addend

		// Then
		XCTAssertEqual(sum, 6)
	}
	
	func test_addingSucceeds() {
		// Given
		let augend: TestSubject = 2
		let addend: TestSubject = 4
		
		// When
		let sum: TestSubject = augend.adding(addend)

		// Then
		XCTAssertEqual(sum, 6)
	}
	
	func test_addSucceeds() {
		// Given
		var sum: TestSubject = 2
		let addend: TestSubject = 4
		
		// When
		sum.add(addend)

		// Then
		XCTAssertEqual(sum, 6)
	}
}
