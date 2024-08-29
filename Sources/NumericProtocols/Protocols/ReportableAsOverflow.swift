//
// ReportableAsOverflow.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be reported as overflow.
public protocol ReportableAsOverflow: Operatable, Raisable {
	/// Returns the sum after adding the specified value to this instance, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to add to this instance.
	/// - returns: A tuple containing the result of the addition along with a boolean value indicating whether overflow occurred.
	func addingReportingOverflow(_ rhs: Self) -> Self.Report
	
	/// Returns the difference after subtracting the specified value to this instance, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to subtract from this instance.
	/// - returns: A tuple containing the result of the subtraction along with a boolean value indicating whether overflow occurred.
	func subtractingReportingOverflow(_ rhs: Self) -> Self.Report
	
	/// Returns the product after multiplying this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to multiply this instance by.
	/// - returns: A tuple containing the result of the multiplication along with a boolean value indicating whether overflow occurred.
	func multipliedReportingOverflow(by rhs: Self) -> Self.Report
	
	/// Returns the quotient after dividing this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to divide this instance by.
	/// - returns: A tuple containing the result of the division along with a boolean value indicating whether overflow occurred.
	func dividedReportingOverflow(by rhs: Self) -> Self.Report
	
	/// Returns the remainder after dividing this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to divide this instance by.
	/// - returns: A tuple containing the result of the division along with a boolean value indicating whether overflow occurred.
	func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report
	
	/// Returns the power after raising this instance to the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to raise this instance to.
	/// - returns: A tuple containing the result of the exponentiation along with a boolean value indicating whether overflow occurred.
	func raisedReportingOverflow(to rhs: Self) -> Self.Report
}

extension ReportableAsOverflow {
	/// The overflow report.
	public typealias Report = (partialValue: Self, overflow: Bool)
}

extension ReportableAsOverflow
where Self: FixedWidthInteger {
	/// Returns the power after raising this instance to the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - parameter rhs: The value to raise this instance to.
	/// - returns: A tuple containing the result of the exponentiation along with a boolean value indicating whether overflow occurred.
	public func raisedReportingOverflow<Exponent>(to rhs: Exponent) -> Self.Report
	where Exponent: BinaryInteger, Exponent.Stride: SignedInteger {
		switch rhs {
		case ..<2:
			let result: Self = self ** rhs
			return (result, false)
		
		default:
			var result: Self = self
			
			for _ in 2...rhs {
				let report: (partialValue: Self, overflow: Bool) = result.multipliedReportingOverflow(by: self)
				
				guard report.overflow == false else {
					return report
				}
				
				result = report.partialValue
			}
			
			return (result, false)
		}
	}
}
