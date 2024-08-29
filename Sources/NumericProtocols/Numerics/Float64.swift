//
// Float64.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

// MARK: - Addable

extension Float64: Addable {}

// MARK: - Decreasable

extension Float64: Decreasable {}

// MARK: - Divisible

extension Float64: Divisible {
    public static func % (_ lhs: Self, _ rhs: Self) -> Self {
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}

// MARK: - Increasable

extension Float64: Increasable {}

// MARK: - Multipliable

extension Float64: Multipliable {}

// MARK: - Negateable

extension Float64: Negateable {}

// MARK: - Raisable

extension Float64: Raisable {}

// MARK: - RepresentableByInfinity

extension Float64: RepresentableByInfinity {}

// MARK: - RepresentableByNaN

extension Float64: RepresentableByNaN {}

// MARK: - RepresentableByZero

extension Float64: RepresentableByZero {}

// MARK: - Subtractable

extension Float64: Subtractable {}
