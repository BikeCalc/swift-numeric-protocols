//
// PowerTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import NumericsExtended

internal final class PowerTests: XCTestCase {
    internal func test_pow() {
		// Given
		let base: Int = 2
		let exponent: Int = 4
		
		// When
		let power: Int = pow(base, exponent)
		
		// Then
		XCTAssertEqual(power, 16)
	}
}
