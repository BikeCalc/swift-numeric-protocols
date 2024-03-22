//
// Raisable.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
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

extension Raisable
where Self: BinaryInteger {
    /// Returns the power of raising the first specified value to the second.
    ///
    /// ```swift
    /// print(2 ** 3)
    /// // Prints "8"
    /// ```
    ///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    /// - returns: The power.
    public static func ** <Exponent>(lhs: Self, rhs: Exponent) -> Self
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
        switch rhs {
        case ..<0:
            return 0
        case 0 where lhs < 0:
            return -1
        case 0 where 0 <= lhs:
            return 1
        case 1:
            return lhs
        
        default:
            return (2...rhs)
                .reduce(lhs) { (result, _) in
                    result * lhs
                }
        }
    }
}

extension Raisable
where Self: FloatingPoint {
    /// Returns the power of raising the first specified value to the second.
    ///
    /// ```swift
    /// print(2 ** 3)
    /// // Prints "8"
    /// ```
    ///
    /// - parameter lhs: The base.
    /// - parameter rhs: The exponent.
    /// - returns: The power.
    public static func ** <Exponent>(lhs: Self, rhs: Exponent) -> Self
    where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
        guard lhs.isNaN == false else {
            return .nan
        }
        
        guard lhs.isInfinite == false else {
            return lhs * .init(rhs)
        }
        
        switch rhs {
        case ..<0:
            return 1 / lhs ** (rhs * -1)
        case 0 where lhs < 0:
            return -1
        case 0 where 0 <= lhs:
            return 1
        case 1:
            return lhs
        
        default:
            return (2...rhs)
                .reduce(lhs) { (result, _) in
                    result * lhs
                }
        }
    }
}


extension Raisable
where Self: ExpressibleByIntegerLiteral {
    
    // MARK: - Other Values
    
    /// The value representing one vigintillion.
    public static var vigintillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one novemdecillion.
    public static var novemdecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one octodecillion.
    public static var octodecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one septendecillion.
    public static var septendecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one sexdecillion.
    public static var sexdecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one quindecillion.
    public static var quindecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one quatttuordecillion.
    public static var quatttuordecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one tredecillion.
    public static var tredecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one duodecillion.
    public static var duodecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one undecillion.
    public static var undecillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one decillion.
    public static var decillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one nonillion.
    public static var nonillion: Self {
        return 1_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one octillion.
    public static var octillion: Self {
        return 1_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one septillion.
    public static var septillion: Self {
        return 1_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one sextillion.
    public static var sextillion: Self {
        return 1_000_000_000_000_000_000_000
    }
    
    /// The value representing one quintillion.
    public static var quintillion: Self {
        return 1_000_000_000_000_000_000
    }
    
    /// The value representing one quadrillion.
    public static var quadrillion: Self {
        return 1_000_000_000_000_000
    }
    
    /// The value representing one trillion.
    public static var trillion: Self {
        return 1_000_000_000_000
    }
    
    /// The value representing one billion.
    public static var billion: Self {
        return 1_000_000_000
    }
    
    /// The value representing one million.
    public static var million: Self {
        return 1_000_000
    }
    
    /// The value representing one hundred thousand.
    public static var hundredThousand: Self {
        return 100_000
    }
    
    /// The value representing one thousand.
    public static var tenThousand: Self {
        return 10_000
    }
    
    /// The value representing one thousand.
    public static var thousand: Self {
        return 1_000
    }
    
    /// The value representing one hundred.
    public static var hundred: Self {
        return 100
    }
    
    /// The value representing ten.
    public static var ten: Self {
        return 10
    }
    
    /// The value representing one.
    public static var one: Self {
        return 1
    }
}
