// FloatTests+DecreasableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: DecreasableTests {
	func test_decreasingBySucceeds() {
		// Given
		let value: TestSubject = 10
		
		// When
		let result: TestSubject = value.decreasing(by: 10)
		
		// Then
		XCTAssertEqual(result, 9)
		XCTAssertEqual(-result, -9)
	}
}
