// IntTests+ReportableAsOverflowTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

extension IntTests {
	func test_raisedReportingOverflowToReturnsFalse() {
		// Given
		let base: TestSubject = -2
		let exponent: TestSubject = 3
		
		// When
		let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
		
		// Then
		XCTAssertEqual(report.partialValue, -8)
		XCTAssertEqual(report.overflow, false)
	}

	func test_raisedReportingOverflowToReturnsTrue() {
		// Given
		let base: TestSubject = .max
		let exponent: TestSubject = 3
		
		// When
		let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
		
		// Then
		XCTAssertEqual(report.partialValue, 1)
		XCTAssertEqual(report.overflow, true)
	}
}
