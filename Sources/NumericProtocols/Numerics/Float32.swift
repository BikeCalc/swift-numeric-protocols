//
// Float32.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

// MARK: - Addable

extension Float32: Addable {}

// MARK: - Decreasable

extension Float32: Decreasable {}

// MARK: - Divisible

extension Float32: Divisible {
    public static func % (_ lhs: Self, _ rhs: Self) -> Self {
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}

// MARK: - Increasable

extension Float32: Increasable {}

// MARK: - Multipliable

extension Float32: Multipliable {}

// MARK: - Negateable

extension Float32: Negateable {}

// MARK: - Raisable

extension Float32: Raisable {}

// MARK: - RepresentableByInfinity

extension Float32: RepresentableByInfinity {}

// MARK: - RepresentableByNaN

extension Float32: RepresentableByNaN {}

// MARK: - RepresentableByZero

extension Float32: RepresentableByZero {}

// MARK: - Subtractable

extension Float32: Subtractable {}
