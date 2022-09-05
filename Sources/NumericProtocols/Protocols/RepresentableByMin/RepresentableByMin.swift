// RepresentableByMin.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by a minium.
public protocol RepresentableByMin {
	
	// MARK: - Minimum Values
	
	/// The representation of the minimum.
	static var min: Self { get }
}

extension RepresentableByMin
where Self: Equatable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this instance is the minimum.
	public var isMin: Bool {
		return self == .min
	}
}
