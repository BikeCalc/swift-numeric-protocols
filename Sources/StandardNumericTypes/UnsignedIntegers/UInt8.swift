//
// UInt8.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension UInt8: Addable {}

// MARK: - Divisible

extension UInt8: Divisible {}

// MARK: - Multipliable

extension UInt8: Multipliable {}

// MARK: - Raisable

extension UInt8: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension UInt8: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension UInt8: RepresentableByZero {}

// MARK: - Subtractable

extension UInt8: Subtractable {}
