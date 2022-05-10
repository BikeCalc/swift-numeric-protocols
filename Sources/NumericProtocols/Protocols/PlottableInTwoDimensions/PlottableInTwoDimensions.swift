// PlottableInTwoDimensions.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be plotted in two dimensions.
public protocol PlottableInTwoDimensions: Equatable {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	init(x: Double, y: Double)
	
	// MARK: - Instance Properties
	
	/// The value for the X-axis.
	var x: Double { get }
	
	/// The value for the Y-axis.
	var y: Double { get }
}

extension PlottableInTwoDimensions {
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is leftest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is leftest than the specified value.
	public func isLeftest(than rhs: Self) -> Bool {
		return self.x < rhs.x
	}
	
	/// Returns a boolean value indicating whether this value is rightest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is rightest than the specified value.
	public func isRightest(than rhs: Self) -> Bool {
		return self.x > rhs.x
	}
	
	/// Returns a boolean value indicating whether this value is highest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is highest than the specified value.
	public func isHighest(than rhs: Self) -> Bool {
		return self.y < rhs.y
	}
	
	/// Returns a boolean value indicating whether this value is lowest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is lowest than the specified value.
	public func isLowest(than rhs: Self) -> Bool {
		return self.y > rhs.y
	}
}

extension PlottableInTwoDimensions
where Self: Addable {
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x + rhs.x
		let y: Double = lhs.y + rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Divisible {
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x / rhs.x
		let y: Double = lhs.y / rhs.y
		
		return .init(x: x, y: y)
	}
	
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x % rhs.x
		let y: Double = lhs.y % rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.x == rhs.x
			&& lhs.y == rhs.y
	}
}

extension PlottableInTwoDimensions
where Self: Multipliable {
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x * rhs.x
		let y: Double = lhs.y * rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Negateable {
	public prefix static func - (operand: Self) -> Self {
		let x: Double = operand.x.negating()
		let y: Double = operand.y.negating()
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: RepresentableByZero {
	public static var zero: Self {
		return .init(x: .zero, y: .zero)
	}
}

extension PlottableInTwoDimensions
where Self: Strideable {
	public typealias Stride = Double
	
	public func advanced(by n: Double) -> Self {
		let x: Double = self.x + n
		let y: Double = self.y + n
		
		return .init(x: x, y: y)
	}
	
	public func distance(to other: Self) -> Double {
		let x: Double = other.x - self.x
		let y: Double = other.y - self.y
		
		return (x.squared() + y.squared()).squareRoot()
	}
}

extension PlottableInTwoDimensions
where Self: Subtractable {
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Double = lhs.x - rhs.x
		let y: Double = lhs.y - rhs.y
		
		return .init(x: x, y: y)
	}
}
