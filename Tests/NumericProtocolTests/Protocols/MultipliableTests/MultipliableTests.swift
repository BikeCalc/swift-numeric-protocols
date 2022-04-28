// MultipliableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol MultipliableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Multipliable
	
	//func test_isMultipleOfReturnsFalse()
	//func test_isMultipleOfReturnsTrue()
	func test_muliplicationSucceeds()
	func test_muliplicationEqualSucceeds()
	func test_multiplyingBySucceeds()
	func test_multiplyBySucceeds()
	func test_doubledSucceeds()
	func test_doubleSucceeds()
}
