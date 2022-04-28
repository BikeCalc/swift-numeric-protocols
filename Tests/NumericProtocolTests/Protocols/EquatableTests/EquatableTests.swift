// EquatableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol EquatableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Equatable
	
	func test_isEqualToReturnsFalse()
	func test_isEqualToReturnsTrue()
	func test_isUnequalToReturnsFalse()
	func test_isUnequalToReturnsTrue()
}
