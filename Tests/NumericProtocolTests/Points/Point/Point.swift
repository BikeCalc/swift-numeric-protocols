// Point.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A structure representing a point in 3-dimension.
struct Point {
	
	// MARK: - Creating Instances
	
	init(x: Double, y: Double, z: Double) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	// MARK: - Instance Properties
	
	let x: Double
	
	let y: Double
	
	let z: Double
}
