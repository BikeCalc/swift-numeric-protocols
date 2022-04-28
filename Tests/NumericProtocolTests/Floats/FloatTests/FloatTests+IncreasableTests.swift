// FloatTests+IncreasableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension FloatTests: IncreasableTests {
	func test_increasingBySucceeds() {
		// Given
		let value: TestSubject = 10
		
		// When
		let result: TestSubject = value.increasing(by: 10)
		
		// Then
		XCTAssertEqual(result, 11)
		XCTAssertEqual(-result, -11)
	}
}
