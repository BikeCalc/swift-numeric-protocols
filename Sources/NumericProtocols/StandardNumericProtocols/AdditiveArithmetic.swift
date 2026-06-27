//
// AdditiveArithmetic.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
