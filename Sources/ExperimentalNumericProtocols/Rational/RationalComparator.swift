// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// A namespace for comparing rational values without cross-multiplication.
package enum RationalComparator {
    /// The ordering of two rational values.
    package enum Ordering {
        case ascending
        case equivalent
        case descending

        /// The ordering produced by exchanging the two operands.
        fileprivate var reversed: Self {
            switch self {
            case .ascending:
                return .descending
            case .equivalent:
                return .equivalent
            case .descending:
                return .ascending
            }
        }
    }

    /// Returns the ordering of the specified rational values.
    ///
    /// This comparison evaluates continued-fraction terms using unsigned magnitudes rather than cross-multiplying the stored terms. NaN is unordered and produces `nil`.
    ///
    /// - Parameter lhs: The first rational value.
    /// - Parameter rhs: The second rational value.
    /// - Returns: The ordering of the values, or `nil` when either value is NaN.
    package static func compare<Value>(
        _ lhs: Value,
        to rhs: Value
    ) -> Ordering?
    where Value: Rational {
        guard lhs.isNaN == false && rhs.isNaN == false else {
            return nil
        }

        switch (lhs.isInfinite, rhs.isInfinite) {
        case (true, true):
            if lhs.numerator < 0 {
                return rhs.numerator < 0 ? .equivalent : .ascending
            } else {
                return rhs.numerator < 0 ? .descending : .equivalent
            }
        case (true, false):
            return lhs.numerator < 0 ? .ascending : .descending
        case (false, true):
            return rhs.numerator < 0 ? .descending : .ascending
        case (false, false):
            break
        }

        let lhsIsNegative: Bool = lhs.numerator != 0
            && (lhs.numerator < 0) != (lhs.denominator < 0)

        let rhsIsNegative: Bool = rhs.numerator != 0
            && (rhs.numerator < 0) != (rhs.denominator < 0)

        if lhsIsNegative != rhsIsNegative {
            return lhsIsNegative ? .ascending : .descending
        }

        let ordering: Ordering = self.compareMagnitudes(
            lhs.numerator.magnitude,
            over: lhs.denominator.magnitude,
            to: rhs.numerator.magnitude,
            over: rhs.denominator.magnitude
        )

        return lhsIsNegative ? ordering.reversed : ordering
    }

    /// Returns the ordering of two nonnegative rational magnitudes.
    ///
    /// - Parameter lhsNumerator: The first numerator magnitude.
    /// - Parameter lhsDenominator: The first denominator magnitude.
    /// - Parameter rhsNumerator: The second numerator magnitude.
    /// - Parameter rhsDenominator: The second denominator magnitude.
    /// - Returns: The ordering of the two rational magnitudes.
    /// - Precondition: Both denominators must be greater than zero.
    private static func compareMagnitudes<Magnitude>(
        _ lhsNumerator: Magnitude,
        over lhsDenominator: Magnitude,
        to rhsNumerator: Magnitude,
        over rhsDenominator: Magnitude
    ) -> Ordering
    where Magnitude: BinaryInteger {
        precondition(
            lhsDenominator > 0 && rhsDenominator > 0,
            "Rational comparison denominators must be positive."
        )

        var lhsDividend: Magnitude = lhsNumerator
        var lhsDivisor: Magnitude = lhsDenominator
        var rhsDividend: Magnitude = rhsNumerator
        var rhsDivisor: Magnitude = rhsDenominator
        var isReversed: Bool = false

        while true {
            let lhsQuotient: Magnitude = lhsDividend / lhsDivisor
            let lhsRemainder: Magnitude = lhsDividend % lhsDivisor
            let rhsQuotient: Magnitude = rhsDividend / rhsDivisor
            let rhsRemainder: Magnitude = rhsDividend % rhsDivisor

            if lhsQuotient != rhsQuotient {
                let ordering: Ordering = lhsQuotient < rhsQuotient
                    ? .ascending
                    : .descending

                return isReversed ? ordering.reversed : ordering
            }

            switch (lhsRemainder == 0, rhsRemainder == 0) {
            case (true, true):
                return .equivalent
            case (true, false):
                return isReversed ? .descending : .ascending
            case (false, true):
                return isReversed ? .ascending : .descending
            case (false, false):
                lhsDividend = lhsDivisor
                lhsDivisor = lhsRemainder
                rhsDividend = rhsDivisor
                rhsDivisor = rhsRemainder
                isReversed.toggle()
            }
        }
    }
}
