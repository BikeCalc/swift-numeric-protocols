//
// UInt16.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension UInt16: Addable {}

// MARK: - Divisible

extension UInt16: Divisible {}

// MARK: - Multipliable

extension UInt16: Multipliable {}

// MARK: - Raisable

extension UInt16: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension UInt16: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension UInt16: RepresentableByZero {}

// MARK: - Subtractable

extension UInt16: Subtractable {}
