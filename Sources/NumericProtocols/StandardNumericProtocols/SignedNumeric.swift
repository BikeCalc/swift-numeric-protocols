//
// SignedNumeric.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension SignedNumeric
where Self: Negateable {
    public mutating func negate() {
        self = 0 - self
    }
}
