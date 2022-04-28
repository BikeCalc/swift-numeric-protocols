// RepresentableByNaNTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol RepresentableByNaNTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: RepresentableByNaN
	
	func test_isNaNReturnsFalse()
	func test_isNaNReturnsTrue()
	func test_nanIsEqualToNaNReturnsFalse()
}
