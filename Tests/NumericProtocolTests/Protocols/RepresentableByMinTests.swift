//
// RepresentableByMinTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol RepresentableByMinTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: RepresentableByMin
	
	func test_isMinReturnsFalse()
	func test_isMinReturnsTrue()
}
