// PlottableInTwoDimensionsTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol PlottableInTwoDimensionsTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: PlottableInTwoDimensions
	
	func test_isLeftestThanReturnsFalse()
	func test_isLeftestThanReturnsTrue()
	func test_isRightestThanReturnsFalse()
	func test_isRightestThanReturnsTrue()
	func test_isHighestThanReturnsFalse()
	func test_isHighestThanReturnsTrue()
	func test_isLowestThanReturnsFalse()
	func test_isLowestThanReturnsTrue()
}
