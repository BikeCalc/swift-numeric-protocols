// DecreasableTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol DecreasableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Decreasable
	
	func test_decreasingBySucceeds()
}
