//
// Numeric.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols

extension Numeric
where Self: Divisible {
    /// Returns a boolean value indicating whether this value is divisible by the specified value.
    ///
    /// ```swift
    /// print(50.isDivisible(by: 0))
    /// // Prints "false"
    /// ```
    ///
    /// - parameter other: The value to test.
    /// - returns: Returns `true` if this value is divisible by the specified value, and `false` otherwise.
    public func isDivisible(by other: Self) -> Bool {
        guard other != 0 else {
            return false
        }
        
        return self % other == 0
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
    public func isFactor(of other: Self) -> Bool {
        guard self != 0 else {
            return false
        }
        
        return (other % self) == 0
    }
    
    /// Returns this value halved.
    ///
    /// ```swift
    /// print(1.halved())
    /// // Prints "0.5"
    /// ```
    ///
    /// - returns: The value halved.
    public func halved() -> Self {
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
    public mutating func halve() {
        self = self.halved()
    }
}

extension Numeric
where Self: Divisible & RepresentableByZero {
    /// Returns the reciprocal of this instance.
    public var reciprocal: Self? {
        guard self.isInvertible else {
            return nil
        }
        
        return 1 / self
    }
    
    /// A boolean value indicating whether this instance is invertible.
    public var isInvertible: Bool {
        return self.isZero == false
    }
}

extension Numeric
where Self: Multipliable {
    /// Returns this value doubled.
    ///
    /// ```swift
    /// print(1.doubled())
    /// // Prints "2"
    /// ```
    ///
    ///  - returns: The value doubled.
    public func doubled() -> Self {
        return self * 2
    }
    
    /// Doubles this value.
    ///
    /// ```swift
    /// var number: Double = 1
    /// number.double()
    /// print(number)
    /// // Prints "2"
    /// ```
    public mutating func double() {
        self = self.doubled()
    }
}

extension Numeric
where Self: Raisable {
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
    where Self: Comparable & Divisible {
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
    where Self: Comparable & Divisible & Negateable {
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
