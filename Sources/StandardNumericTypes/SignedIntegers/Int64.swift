//
// Int64.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension Int64: Addable {}

// MARK: - Divisible

extension Int64: Divisible {}

// MARK: - Multipliable

extension Int64: Multipliable {}

// MARK: - Negateable

extension Int64: Negateable {}

// MARK: - Raisable

extension Int64: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension Int64: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension Int64: RepresentableByZero {}

// MARK: - Subtractable

extension Int64: Subtractable {}
