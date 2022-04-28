// RaisableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol RaisableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Raisable
	
	func test_isPowerOfReturnsFalse()
	func test_isPowerOfReturnsTrue()
	func test_exponentiationSucceeds()
	func test_exponentiationEqualSucceeds()
	func test_raisingToSucceeds()
	func test_raiseToSucceeds()
	func test_squaredSucceeds()
	func test_squareSucceeds()
	func test_cubedSucceeds()
	func test_cubeSucceeds()
}
