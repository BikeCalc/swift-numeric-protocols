//
// RepresentableByNaN.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by not a number.
public protocol RepresentableByNaN {
	/// A boolean value indicating whether this instance is not a number.
	var isNaN: Bool { get }

	/// The representation of not a number.
	static var nan: Self { get }
}
