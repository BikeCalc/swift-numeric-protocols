//
// CanonicallyEquatable.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be canonically equatable.
public protocol CanonicallyEquatable {
	/// Returns a boolean value indicating whether the two specified instances are canonically equatable.
	///
	/// - Parameter rhs: An instance to compare.
	/// - Returns: `true` if is canonically equatable, and `false` otherwise.
	func isCanonicallyEquatable(to rhs: Self) -> Bool
}
