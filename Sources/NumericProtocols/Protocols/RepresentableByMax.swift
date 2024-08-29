//
// RepresentableByMax.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be represented by a maximum.
public protocol RepresentableByMax {
	/// The representation of the maximum.
	static var max: Self { get }
}

extension RepresentableByMax
where Self: Equatable {
	/// A boolean value indicating whether this instance is the maximum.
	public var isMax: Bool {
		return self == .max
	}
}
