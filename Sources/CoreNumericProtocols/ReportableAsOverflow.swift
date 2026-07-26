// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

/// Representing values that can be reported as overflow.
public protocol ReportableAsOverflow: Operatable, Raisable {
	/// Returns the sum after adding the specified value to this instance, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to add to this instance.
	/// - Returns: A tuple containing the result of the addition along with a boolean value indicating whether overflow occurred.
	func addingReportingOverflow(_ rhs: Self) -> Self.Report

	/// Returns the difference after subtracting the specified value to this instance, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to subtract from this instance.
	/// - Returns: A tuple containing the result of the subtraction along with a boolean value indicating whether overflow occurred.
	func subtractingReportingOverflow(_ rhs: Self) -> Self.Report

	/// Returns the product after multiplying this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to multiply this instance by.
	/// - Returns: A tuple containing the result of the multiplication along with a boolean value indicating whether overflow occurred.
	func multipliedReportingOverflow(by rhs: Self) -> Self.Report

	/// Returns the quotient after dividing this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to divide this instance by.
	/// - Returns: A tuple containing the result of the division along with a boolean value indicating whether overflow occurred.
	func dividedReportingOverflow(by rhs: Self) -> Self.Report

	/// Returns the remainder after dividing this instance by the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to divide this instance by.
	/// - Returns: A tuple containing the result of the division along with a boolean value indicating whether overflow occurred.
	func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report

	/// Returns the power after raising this instance to the specified value, along with a boolean value indicating whether overflow occurred in the operation.
	///
	/// - Parameter rhs: The value to raise this instance to.
	/// - Returns: A tuple containing the result of the exponentiation along with a boolean value indicating whether overflow occurred.
	func raisedReportingOverflow(to rhs: Self.Exponent) -> Self.Report
}

extension ReportableAsOverflow {
	/// The overflow report.
	public typealias Report = (partialValue: Self, overflow: Bool)
}
