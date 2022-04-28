// EquivalentableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol EquivalentableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Equivalentable
	
	func test_isEquivalentToReturnsFalse()
	func test_isEquivalentToReturnsTrue()
}
