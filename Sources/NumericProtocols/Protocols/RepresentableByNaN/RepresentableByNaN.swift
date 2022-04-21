// RepresentableByNaN.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by not a number.
public protocol RepresentableByNaN {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this instance is not a number.
	var isNaN: Bool { get }
	
	// MARK: - NaN Values
	
	/// The representation of not a number.
	static var nan: Self { get }
}
