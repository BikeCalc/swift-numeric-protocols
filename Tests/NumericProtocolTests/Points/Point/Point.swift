// Point.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A structure containing 3-axis acceleration values.
struct Point {
	
	// MARK: - Creating Instances
	
	init(x: Double, y: Double, z: Double) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	// MARK: - Instance Properties
	
	/// The value for the X-axis in gravitational force.
	let x: Double
	
	/// The value for the Y-axis in gravitational force.
	let y: Double
	
	/// The value for the Z-axis in gravitational force.
	let z: Double
}
