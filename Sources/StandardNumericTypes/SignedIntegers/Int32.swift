//
// Int32.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension Int32: Addable {}

// MARK: - Divisible

extension Int32: Divisible {}

// MARK: - Multipliable

extension Int32: Multipliable {}

// MARK: - Negateable

extension Int32: Negateable {}

// MARK: - Raisable

extension Int32: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension Int32: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension Int32: RepresentableByZero {}

// MARK: - Subtractable

extension Int32: Subtractable {}
