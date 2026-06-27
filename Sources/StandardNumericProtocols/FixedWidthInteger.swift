//
// FixedWidthInteger.swift
// NumericsExtended
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import CoreNumericOperators
import CoreNumericProtocols

extension FixedWidthInteger
where Self: ReportableAsOverflow {
    /// Returns the power after raising this instance to the specified value, along with a boolean value indicating whether overflow occurred in the operation.
    ///
    /// - parameter rhs: The value to raise this instance to.
    /// - returns: A tuple containing the result of the exponentiation along with a boolean value indicating whether overflow occurred.
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
                let report: (partialValue: Self, overflow: Bool) = result.multipliedReportingOverflow(by: self)
                
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
