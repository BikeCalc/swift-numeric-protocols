//
// AddableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol AddableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Addable
	
	func test_additionSucceeds()
	func test_additionEqualSucceeds()
	func test_addingSucceeds()
	func test_addSucceeds()
}
