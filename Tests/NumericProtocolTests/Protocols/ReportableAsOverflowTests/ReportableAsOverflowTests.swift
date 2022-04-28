// ReportableAsOverflowTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol ReportableAsOverflowTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: ReportableAsOverflow
	
	func test_addingReportingOverflowReturnsFalse()
	func test_addingReportingOverflowReturnsTrue()
	func test_subtractingReportingOverflowReturnsFalse()
	func test_subtractingReportingOverflowReturnsTrue()
	func test_multipliedReportingOverflowByReturnsFalse()
	func test_multipliedReportingOverflowByReturnsTrue()
	func test_dividedReportingOverflowByReturnsFalse()
	func test_dividedReportingOverflowByReturnsTrue()
	func test_remainderReportingOverflowDividingByReturnsFalse()
	func test_remainderReportingOverflowDividingByReturnsTrue()
	func test_raisedReportingOverflowToReturnsFalse()
	func test_raisedReportingOverflowToReturnsTrue()
}
