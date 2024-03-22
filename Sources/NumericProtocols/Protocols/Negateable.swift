//
// Negateable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be negating.
public protocol Negateable: Equatable {
	
	// MARK: - Negating Values
	
	/// Returns the additive inverse of the specified value.
	///
	/// - parameter operand:
	/// - returns: The additive inverse.
	prefix static func - (_ operand: Self) -> Self
}

extension Negateable
where Self: Comparable & RepresentableByZero {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this value is negative.
	///
	/// ```swift
	/// print(1.isNegative)
	/// // Prints "false"
	/// ```
	public var isNegative: Bool {
		return self < .zero
	}
	
	/// A boolean value indicating whether this value is positive.
	///
	/// ```swift
	/// print(1.isPositive)
	/// // Prints "true"
	/// ```
	public var isPositive: Bool {
		return .zero < self
	}
}

extension Negateable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this value is signed.
	///
	/// ```swift
	/// print(-1.isSigned)
	/// // Prints "true"
	/// ```
	public var isSigned: Bool {
		return true
	}
	
	/// Returns a boolean value indicating whether this value is the opposite of the specified value.
	///
	/// ```swift
	/// print(10.isOpposite(of: -10))
	/// // Prints "true"
	/// ```
	///
	/// - parameter other: The value to test.
	/// - returns: Returns `true` if this value is the opposite of the given value, and `false` otherwise.
	public func isOpposite(of other: Self) -> Bool {
		return self == other.negating()
	}
	
	// MARK: - Negating Values
	
	/// Returns the additive inverse of this value.
	///
	/// ```swift
	/// print(2.negating())
	/// // Prints "-2"
	/// ```
	///
	/// - returns: The additive inverse.
	public func negating() -> Self {
		return -self
	}
	
	/// Replaces this value with its additive inverse.
	///
	/// ```swift
	/// var number: Double = 2
	/// number.negate()
	/// print(number)
	/// // Prints "-2"
	/// ```
	public mutating func negate() {
		self = self.negating()
	}
}

extension Negateable
where Self: SignedNumeric {
	public mutating func negate() {
		self = 0 - self
	}
}
