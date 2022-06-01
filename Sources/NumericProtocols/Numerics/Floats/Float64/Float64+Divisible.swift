// Float64+Divisible.swift
// ProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Float64: Divisible {
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		return lhs.truncatingRemainder(dividingBy: rhs)
	}
}
