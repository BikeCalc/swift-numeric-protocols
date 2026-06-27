//
// UInt64.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension UInt64: Addable {}

// MARK: - Divisible

extension UInt64: Divisible {}

// MARK: - Multipliable

extension UInt64: Multipliable {}

// MARK: - Raisable

extension UInt64: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension UInt64: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension UInt64: RepresentableByZero {}

// MARK: - Subtractable

extension UInt64: Subtractable {}
