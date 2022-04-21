// Equivalentable.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

// FIXME: change name of protocol.
/// Representing values that can be equivalent.
public protocol Equivalentable {
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether the two specified instances are equivalent.
	///
	/// - parameter rhs: An instance to compare.
	/// - returns: `true` if is equivalent, and `false` otherwise.
	func isEquivalent(to rhs: Self) -> Bool
}
