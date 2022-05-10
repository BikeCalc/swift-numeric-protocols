// PlottableInThreeDimensionsTests.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericProtocols

protocol PlottableInThreeDimensionsTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: PlottableInThreeDimensions
	
	func test_isFarthestThanReturnsFalse()
	func test_isFarthestThanReturnsTrue()
	func test_isNearestThanReturnsFalse()
	func test_isNearestThanReturnsTrue()
}
