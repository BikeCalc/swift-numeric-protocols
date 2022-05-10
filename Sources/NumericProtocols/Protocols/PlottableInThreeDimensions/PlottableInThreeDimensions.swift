// PlottableInThreeDimensions.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be plotted in three dimensions.
public protocol PlottableInThreeDimensions: PlottableInTwoDimensions {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	/// - parameter z: The Z-axis.
	init(x: Double, y: Double, z: Double)
	
	// MARK: - Instance Properties
	
	/// The value for the Z-axis.
	var z: Double { get }
}

extension PlottableInThreeDimensions {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	public init(x: Double, y: Double) {
		self.init(x: x, y: y, z: 0)
	}
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is farthest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is farthest than the specified value.
	public func isFarthest(than rhs: Self) -> Bool {
		return self.z > rhs.z
	}
	
	/// Returns a boolean value indicating whether this value is nearest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is nearest than the specified value.
	public func isNearest(than rhs: Self) -> Bool {
		return self.z < rhs.z
	}
}

extension PlottableInThreeDimensions
where Self: Addable {
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x + rhs.x
		let y: Double = lhs.y + rhs.y
		let z: Double = lhs.z + rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Divisible {
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x / rhs.x
		let y: Double = lhs.y / rhs.y
		let z: Double = lhs.z / rhs.z
		
		return .init(x: x, y: y, z: z)
	}
	
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x % rhs.x
		let y: Double = lhs.y % rhs.y
		let z: Double = lhs.z % rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.x == rhs.x
			&& lhs.y == rhs.y
			&& lhs.z == rhs.z
	}
}

extension PlottableInThreeDimensions
where Self: Multipliable {
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x * rhs.x
		let y: Double = lhs.y * rhs.y
		let z: Double = lhs.z * rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Negateable {
	public prefix static func - (operand: Self) -> Self {
		let x: Double = operand.x.negating()
		let y: Double = operand.y.negating()
		let z: Double = operand.z.negating()
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: RepresentableByZero {
	public static var zero: Self {
		return .init(x: .zero, y: .zero, z: .zero)
	}
}

extension PlottableInThreeDimensions
where Self: Strideable {
	public typealias Stride = Double
	
	public func advanced(by n: Double) -> Self {
		let x: Double = self.x + n
		let y: Double = self.y + n
		let z: Double = self.z + n
		
		return .init(x: x, y: y, z: z)
	}
	
	public func distance(to other: Self) -> Double {
		let x: Double = other.x - self.x
		let y: Double = other.y - self.y
		let z: Double = other.z - self.z
		
		return (x.squared() + y.squared() + z.squared()).squareRoot()
	}
}

extension PlottableInThreeDimensions
where Self: Subtractable {
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x - rhs.x
		let y: Double = lhs.y - rhs.y
		let z: Double = lhs.z - rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}
