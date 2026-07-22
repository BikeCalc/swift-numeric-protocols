//
// RomanSymbolError.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a Roman symbol error.
internal enum RomanSymbolError: Error {
    /// The Roman symbol is unconcatenable.
    case isUnconcatenable

    /// The Roman symbol is inseparable.
    case isInseparable
}
