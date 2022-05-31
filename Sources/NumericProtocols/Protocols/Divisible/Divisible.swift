// Divisible.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be divided.
public protocol Divisible: Equatable {
	
	// MARK: - Dividing Values
	
	/// Returns the quotient of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The quotient.
	static func / (lhs: Self, rhs: Self) -> Self
	
	/// Returns the remainder of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The remainder.
	static func % (lhs: Self, rhs: Self) -> Self
}

extension Divisible
where Self: ExpressibleByIntegerLiteral {
	
	// MARK: - Instance Properties
	
	/// Returns the reciprocal of this instance.
	public var reciprocal: Self? {
		return 1 / self
	}
}

extension Divisible
where Self: ExpressibleByIntegerLiteral & RepresentableByZero {
	
	// MARK: - Instance Properties
	
	/// Returns the reciprocal of this instance.
	public var reciprocal: Self? {
		guard self.isInvertible else {
			return nil
		}
		
		return 1 / self
	}
}

extension Divisible
where Self: RepresentableByZero {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this instance is invertible.
	public var isInvertible: Bool {
		return self.isZero == false
	}
}

extension Divisible {
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is divisible by the specified value.
	///
	/// ```swift
	/// print(50.isDivisible(by: 0))
	/// // Prints "false"
	/// ```
	///
	/// - parameter other: The value to test.
	/// - returns: Returns `true` if this value is divisible by the specified value, and `false` otherwise.
	public func isDivisible(by other: Self) -> Bool
	where Self: ExpressibleByIntegerLiteral {
		return other != 0
	}
	
	/// Returns a boolean value indicating whether this value is a factor of the specified value.
	///
	/// ```swift
	/// print(10.isFactor(of: 50))
	/// // Prints "true"
	/// ```
	///
	/// - parameter other: The value to test.
	/// - returns: Returns `true` if this value is a factor of the specified value, and `false` otherwise.
	public func isFactor(of other: Self) -> Bool
	where Self: ExpressibleByIntegerLiteral {
		return (other % self) == 0
	}
	
	// MARK: - Dividing Values
	
	/// Divides the first specified value by the second and stores the quotient in the left-hand-side variable.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
	
	/// Divides the first specified value by the second and stores the remainder in the left-hand-side variable.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	public static func %= (lhs: inout Self, rhs: Self) {
		lhs = lhs % rhs
	}
    
    /// Returns the quotient of dividing this value by the specified value.
    ///
    /// ```swift
    /// print(6.dividing(by: 2))
    /// // Prints "3"
    /// ```
    ///
    /// - parameter divisor: The divisor.
    /// - returns: The quotient.
    public func dividing(by divisor: Self) -> Self {
        return self / divisor
    }
    
	/// Divides this value by the specified value and produces the quotient.
    ///
    /// ```swift
    /// var number: Double = 6
    /// number.divide(by: 2)
	/// print(number)
    /// // Prints "3"
    /// ```
    ///
    /// - parameter divisor: The divisor.
    public mutating func divide(by divisor: Self) {
        self /= divisor
    }
	
	// MARK: - Halving Values
	
	/// Returns this value halved.
	///
	/// ```swift
	/// print(1.halved())
	/// // Prints "0.5"
	/// ```
	///
	/// - returns: The value halved.
	public func halved() -> Self
	where Self: ExpressibleByIntegerLiteral {
		return self / 2
	}
	
	/// Halves this value.
	///
	/// ```swift
	/// var number: Double = 1
	/// number.halve()
	/// print(number)
	/// // Prints "0.5"
	/// ```
	public mutating func halve()
	where Self: ExpressibleByIntegerLiteral {
		self = self.halved()
	}
}
