//
// Raisable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators

/// Representing values that can be raised to the power.
public protocol Raisable: Equatable {
    /// The type used to represent exponents.
    associatedtype Exponent
    
    /// Returns the power of raising the first specified value to the second.
	///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    /// - returns: The power.
    static func ** (_ lhs: Self, _ rhs: Self.Exponent) -> Self
}

extension Raisable {
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
        switch other {
        case 0:
            return self == 0
        case 1:
            return self == 1
        default:
            var number: Self = self
            
            while number > 1 && number.isDivisible(by: other) {
                let quotient = number / other
                
                guard quotient != number else {
                    return false
                }
                
                number = quotient
            }
            
            return number == 1
        }
	}
    
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
    where Self: Comparable & Divisible & ExpressibleByIntegerLiteral & Negateable {
        switch other {
        case -1:
            return self == 1 || self == -1
        case 0:
            return self == 0
        case 1:
            return self == 1
        default:
            var number: Self = self
            
            while number.isDivisible(by: other) {
                let quotient = number / other
                
                guard quotient != number else {
                    return false
                }
                
                number = quotient
                
                if number == 1 {
                    return true
                }
            }
            
            return number == 1
        }
    }
	
	/// Raises the first specified value to the second and stores the power in the left-hand-side variable.
    ///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    public static func **= (_ lhs: inout Self, _ rhs: Self.Exponent) {
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
    public func raising(to exponent: Self.Exponent) -> Self {
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
    public mutating func raise(to exponent: Self.Exponent) {
        self **= exponent
    }
    
    /// Returns the result of raising this value to its square.
    ///
    /// ```swift
    /// print(2.squared())
    /// // Prints "4"
    /// ```
    ///
    /// - returns: The square.
    public func squared() -> Self
    where Self.Exponent: ExpressibleByIntegerLiteral {
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
    public mutating func square()
    where Self.Exponent: ExpressibleByIntegerLiteral {
        self **= 2
    }
    
	/// Returns the result of raising this value to its cube.
    ///
    /// ```swift
    /// print(2.cubed())
    /// // Prints "8"
    /// ```
    ///
    /// - returns: The cube.
    public func cubed() -> Self
    where Self.Exponent: ExpressibleByIntegerLiteral {
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
    public mutating func cube()
    where Self.Exponent: ExpressibleByIntegerLiteral {
        self **= 3
    }
}
