// Raisable.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be raised to the power.
public protocol Raisable: Equatable {
	
	// MARK: - Raising Values
	
    /// Returns the power of raising the first specified value to the second.
	///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    /// - returns: The power.
    static func ** <Exponent>(lhs: Self, rhs: Exponent) -> Self
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger
}

extension Raisable {
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is a power of the specified value.
	///
	/// ```swift
	/// print(100.isPower(of: 10))
	/// // Prints "true"
	/// ```
	///
	/// - parameter other: The value to test.
	/// - returns: Returns `true` if this value is a power of the specified value, and `false` otherwise.
	public func isPower(of other: Self) -> Bool
	where Self: Comparable & Divisible & ExpressibleByIntegerLiteral {
		var number: Self = self

		while number > 1 && (number % other) == 0 {
			number /= other
		}

		return number == 1
	}
	
	// MARK: - Raising Values
	
	/// Raises the first specified value to the second and stores the power in the left-hand-side variable.
    ///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    public static func **= <Exponent>(lhs: inout Self, rhs: Exponent)
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
		lhs = lhs ** rhs
    }
    
	/// Returns the power of raising this value to the specified value.
    ///
    /// ```swift
    /// print(2.raising(to: 4))
    /// // Prints "16"
    /// ```
    ///
    /// - parameter exponent: The exponent.
    /// - returns: The power.
    public func raising<Exponent>(to exponent: Exponent) -> Self
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
        return self ** exponent
    }
    
	/// Raises this value to the specified value and produces the power.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.raise(to: 4)
	/// print(number)
    /// // Prints "16"
    /// ```
    ///
    /// - parameter exponent: The exponent.
    public mutating func raise<Exponent>(to exponent: Exponent)
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
        self **= exponent
    }
	
	// MARK: - Squaring Values
    
    /// Returns the result of raising this value to its square.
    ///
    /// ```swift
    /// print(2.squared())
    /// // Prints "4"
    /// ```
    ///
    /// - returns: The square.
    public func squared() -> Self {
        return self ** 2
    }
    
	/// Raises this value to its square.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.square()
	/// print(number)
    /// // Prints "4"
    /// ```
    public mutating func square() {
        self **= 2
    }
	
	// MARK: - Cubing Values
    
	/// Returns the result of raising this value to its cube.
    ///
    /// ```swift
    /// print(2.cubed())
    /// // Prints "8"
    /// ```
    ///
    /// - returns: The cube.
    public func cubed() -> Self {
        return self ** 3
    }
    
    /// Raises this value to its cube.
    ///
    /// ```swift
    /// var number: Double = 2
    /// number.cube()
	/// print(number)
    /// // Prints "8"
    /// ```
    public mutating func cube() {
        self **= 3
    }
}
