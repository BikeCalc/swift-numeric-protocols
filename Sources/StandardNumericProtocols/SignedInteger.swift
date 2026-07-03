//
// SignedInteger.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericProtocols

extension SignedInteger
where Self: Divisible {
    /// Returns the reciprocal of this instance.
    public var reciprocal: Self? {
        guard self.isInvertible else {
            return nil
        }
        
        return self
    }
    
    /// A boolean value indicating whether this instance is invertible.
    public var isInvertible: Bool {
        return self == 1
            || self == -1
    }
}
