// RepresentableByZero.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by zero.
public protocol RepresentableByZero: Equatable {
	
	// MARK: - Zero Values
	
	/// The value representing zero.
	static var zero: Self { get }
}

extension RepresentableByZero {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this instance is zero.
	public var isZero: Bool {
		return self == .zero
	}
}
