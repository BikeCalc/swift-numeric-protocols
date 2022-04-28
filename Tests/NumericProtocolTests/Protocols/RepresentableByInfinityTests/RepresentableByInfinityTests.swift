// RepresentableByInfinityTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol RepresentableByInfinityTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: RepresentableByInfinity
	
	func test_isFiniteReturnsFalse()
	func test_isFiniteReturnsTrue()
	func test_isInfiniteReturnsFalse()
	func test_isInfiniteReturnsTrue()
}
