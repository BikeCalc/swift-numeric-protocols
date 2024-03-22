//
// RepresentableByMaxTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol RepresentableByMaxTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: RepresentableByMax
	
	func test_isMaxReturnsFalse()
	func test_isMaxReturnsTrue()
}
