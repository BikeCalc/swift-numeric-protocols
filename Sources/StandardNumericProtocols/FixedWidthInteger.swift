// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import CoreNumericOperators
import CoreNumericProtocols

extension FixedWidthInteger
where Self: ReportableAsOverflow {
    /// Returns the power after raising this instance to the specified value, along with a boolean value indicating whether overflow occurred in the operation.
    ///
    /// - Parameter rhs: The value to raise this instance to.
    /// - Returns: A tuple containing the result of the exponentiation along with a boolean value indicating whether overflow occurred.
    public func raisedReportingOverflow(to rhs: Self.Exponent) -> Self.Report
    where Self.Exponent: BinaryInteger {
        switch rhs {
        case ..<2:
            let result: Self = self ** rhs
            return (result, false)
        default:
            var result: Self = self
            var exponent: Self.Exponent = 2

            while exponent <= rhs {
                let report: Self.Report = result.multipliedReportingOverflow(by: self)

                guard report.overflow == false else {
                    return report
                }

                result = report.partialValue
                exponent += 1
            }

            return (result, false)
        }
    }
}
