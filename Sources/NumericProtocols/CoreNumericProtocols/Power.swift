//
// Power.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Returns the power of raising the first specified value to the second.
///
/// ```swift
/// print(pow(2, 4))
/// // Prints "16"
/// ```
/// - parameter lhs: The base.
/// - parameter rhs: The exponent.
/// - returns: The power.
public func pow<Value>(_ lhs: Value, _ rhs: Value.Exponent) -> Value
where Value: Raisable {
	return lhs ** rhs
}
