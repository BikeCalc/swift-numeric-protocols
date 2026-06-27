//
// Int8.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension Int8: Addable {}

// MARK: - Divisible

extension Int8: Divisible {}

// MARK: - Multipliable

extension Int8: Multipliable {}

// MARK: - Negateable

extension Int8: Negateable {}

// MARK: - Raisable

extension Int8: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension Int8: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension Int8: RepresentableByZero {}

// MARK: - Subtractable

extension Int8: Subtractable {}
