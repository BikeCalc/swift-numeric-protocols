//
// Divisible.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be divided.
public protocol Divisible: Equatable {
	/// Returns the quotient of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The quotient.
	static func / (_ lhs: Self, _ rhs: Self) -> Self
	
	/// Returns the remainder of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The remainder.
	static func % (_ lhs: Self, _ rhs: Self) -> Self
}

extension Divisible
where Self: ExpressibleByIntegerLiteral {
	/// Returns the reciprocal of this instance.
	public var reciprocal: Self? {
		return 1 / self
	}
}

extension Divisible
where Self: ExpressibleByIntegerLiteral & RepresentableByZero {
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
	/// A boolean value indicating whether this instance is invertible.
	public var isInvertible: Bool {
		return self.isZero == false
	}
}

extension Divisible {
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
	
	/// Divides the first specified value by the second and stores the quotient in the left-hand-side variable.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
    public static func /= (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs / rhs
    }
	
	/// Divides the first specified value by the second and stores the remainder in the left-hand-side variable.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	public static func %= (_ lhs: inout Self, _ rhs: Self) {
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

extension Divisible
where Self: ExpressibleByFloatLiteral {
    /// The value representing one tenth.
    public static var tenth: Self {
        return 1e-1
    }
    
    /// The value representing one hundredth.
    public static var hundredth: Self {
        return 1e-2
    }
    
    /// The value representing one thousandth.
    public static var thousandth: Self {
        return 1e-3
    }
    
    /// The value representing ten thousandth.
    public static var tenThousandth: Self {
        return 1e-4
    }
    
    /// The value representing one hundred thousandth.
    public static var hundredThousandth: Self {
        return 1e-5
    }
    
    /// The value representing one millionth.
    public static var millionth: Self {
        return 1e-6
    }
    
    /// The value representing one billionth.
    public static var billionth: Self {
        return 1e-6
    }
    
    /// The value representing one trillionth.
    public static var trillionth: Self {
        return 1e-12
    }
    
    /// The value representing one quadrillionth.
    public static var quadrillionth: Self {
        return 1e-15
    }
    
    /// The value representing one quintillionth.
    public static var quintillionth: Self {
        return 1e-18
    }
    
    /// The value representing one sextillionth.
    public static var sextillionth: Self {
        return 1e-21
    }
    
    /// The value representing one septillionth.
    public static var septillionth: Self {
        return 1e-24
    }
    
    /// The value representing one octillionth.
    public static var octillionth: Self {
        return 1e-27
    }
    
    /// The value representing one nonillionth.
    public static var nonillionth: Self {
        return 1e-30
    }
    
    /// The value representing one decillionth.
    public static var decillionth: Self {
        return 1e-33
    }
    
    /// The value representing one undecillionth.
    public static var undecillionth: Self {
        return 1e-36
    }
    
    /// The value representing one duodecillionth.
    public static var duodecillionth: Self {
        return 1e-39
    }
    
    /// The value representing one tredecillionth.
    public static var tredecillionth: Self {
        return 1e-42
    }
    
    /// The value representing one quatttuordecillionth.
    public static var quatttuordecillionth: Self {
        return 1e-45
    }
    
    /// The value representing one quindecillionth.
    public static var quindecillionth: Self {
        return 1e-48
    }
    
    /// The value representing one sexdecillionth.
    public static var sexdecillionth: Self {
        return 1e-51
    }
    
    /// The value representing one septendecillionth.
    public static var septendecillionth: Self {
        return 1e-54
    }
    
    /// The value representing one octodecillionth.
    public static var octodecillionth: Self {
        return 1e-57
    }
    
    /// The value representing one novemdecillionth.
    public static var novemdecillionth: Self {
        return 1e-60
    }
    
    /// The value representing one vigintillionth.
    public static var vigintillionth: Self {
        return 1e-63
    }
}
