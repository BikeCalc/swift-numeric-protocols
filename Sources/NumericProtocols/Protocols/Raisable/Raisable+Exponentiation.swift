// Raisable+Exponentiation.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
