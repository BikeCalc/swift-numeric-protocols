//
// UInt.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols
import StandardNumericProtocols

// MARK: - Addable

extension UInt: Addable {}

// MARK: - Divisible

extension UInt: Divisible {}

// MARK: - Multipliable

extension UInt: Multipliable {}

// MARK: - Raisable

extension UInt: Raisable {
    public typealias Exponent = Self
}

// MARK: - ReportableAsOverflow

extension UInt: ReportableAsOverflow {}

// MARK: - RepresentableByZero

extension UInt: RepresentableByZero {}

// MARK: - Subtractable

extension UInt: Subtractable {}
