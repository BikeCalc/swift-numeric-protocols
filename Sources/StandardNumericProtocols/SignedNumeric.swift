//
// SignedNumeric.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols

extension SignedNumeric
where Self: Negateable {
    public mutating func negate() {
        self = 0 - self
    }
}
