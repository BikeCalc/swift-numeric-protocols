// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be canonically equatable.
public protocol CanonicallyEquatable {
	/// Returns a boolean value indicating whether the two specified instances are canonically equatable.
	///
	/// - Parameter rhs: An instance to compare.
	/// - Returns: `true` if is canonically equatable, and `false` otherwise.
	func isCanonicallyEquatable(to rhs: Self) -> Bool
}
