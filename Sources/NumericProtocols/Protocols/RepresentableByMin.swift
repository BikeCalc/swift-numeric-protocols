//
// RepresentableByMin.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by a minimum.
public protocol RepresentableByMin {
	/// The representation of the minimum.
	static var min: Self { get }
}

extension RepresentableByMin
where Self: Equatable {
	/// A boolean value indicating whether this instance is the minimum.
	public var isMin: Bool {
		return self == .min
	}
}
