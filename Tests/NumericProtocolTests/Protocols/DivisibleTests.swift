//
// DivisibleTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol DivisibleTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Divisible
	
	func test_isInvertibleReturnsFalse()
	func test_isInvertibleReturnsTrue()
	func test_isDivisibleByReturnsFalse()
	func test_isDivisibleByReturnsTrue()
	func test_isFactorOfReturnsFalse()
	func test_isFactorOfReturnsTrue()
	func test_divisionSucceeds()
	func test_divisionEqualSucceeds()
	func test_dividingBySucceeds()
	func test_divideBySucceeds()
	func test_halvedSucceeds()
	func test_halveSucceeds()
}
