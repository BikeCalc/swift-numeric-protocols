//
// Int.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

// MARK: - Addable

extension Int: Addable {}

// MARK: - Divisible

extension Int: Divisible {}

// MARK: - Multipliable

extension Int: Multipliable {}

// MARK: - Negateable

extension Int: Negateable {}

// MARK: - Raisable

extension Int: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension Int: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension Int: RepresentableByZero {}

// MARK: - Subtractable

extension Int: Subtractable {}
