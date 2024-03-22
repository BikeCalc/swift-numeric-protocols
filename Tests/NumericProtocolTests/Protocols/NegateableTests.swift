//
// NegateableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol NegateableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Negateable
	
	func test_isNegativeReturnsFalse()
	func test_isNegativeReturnsTrue()
	func test_isPositiveReturnsFalse()
	func test_isPositiveReturnsTrue()
	func test_isSignedSucceeds()
	func test_isOppositeReturnsFalse()
	func test_isOppositeReturnsTrue()
}
