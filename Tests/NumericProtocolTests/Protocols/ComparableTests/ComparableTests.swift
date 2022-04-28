// ComparableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol ComparableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Comparable
	
	func test_isLessThanReturnsFalse()
	func test_isLessThanReturnsTrue()
	func test_isLessThanOrEqualToReturnsFalse()
	func test_isLessThanOrEqualToReturnsTrue()
	func test_isGreaterThanReturnsFalse()
	func test_isGreaterThanReturnsTrue()
	func test_isGreaterThanOrEqualToReturnsFalse()
	func test_isGreaterThanOrEqualToReturnsTrue()
	
	func test_isWithinClosedRangeReturnsFalse()
	func test_isWithinClosedRangeReturnsTrue()
	func test_isWithinBoundsReturnsFalse()
	func test_isWithinBoundsReturnsTrue()
}
