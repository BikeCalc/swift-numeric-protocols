//
// Float64.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

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

extension Float64: Raisable {
    public typealias Exponent = Int
}

// MARK: - RepresentableByInfinity

extension Float64: RepresentableByInfinity {}

// MARK: - RepresentableByNaN

extension Float64: RepresentableByNaN {}

// MARK: - RepresentableByZero

extension Float64: RepresentableByZero {}

// MARK: - Roundable

extension Float64: Roundable {
    public typealias DecimalPlace = UInt
}

// MARK: - Subtractable

extension Float64: Subtractable {}

// MARK: - Subtractable

extension Float64: Truncatable {}
