//
// AdditiveArithmetic.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols

extension AdditiveArithmetic
where Self: Addable {
    public static func += (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs + rhs
    }
}

extension AdditiveArithmetic
where Self: Subtractable {
    public static func -= (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs - rhs
    }
}
