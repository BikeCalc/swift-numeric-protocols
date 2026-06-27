//
// Float32.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

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

extension Float32: Raisable {
    public typealias Exponent = Int
}

// MARK: - RepresentableByInfinity

extension Float32: RepresentableByInfinity {}

// MARK: - RepresentableByNaN

extension Float32: RepresentableByNaN {}

// MARK: - RepresentableByZero

extension Float32: RepresentableByZero {}

// MARK: - Roundable

extension Float32: Roundable {
    public typealias DecimalPlace = UInt
}

// MARK: - Subtractable

extension Float32: Subtractable {}

// MARK: - Subtractable

extension Float32: Truncatable {}
