// SubtractableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol SubtractableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Subtractable
	
	func test_subtractionSucceeds()
	func test_subtractionEqualSucceeds()
	func test_subtractingSucceeds()
	func test_subtractSucceeds()
}
