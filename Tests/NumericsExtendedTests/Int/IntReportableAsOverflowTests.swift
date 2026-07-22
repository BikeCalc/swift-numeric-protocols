//
// IntReportableAsOverflowTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int ReportableAsOverflow Tests")
internal struct IntReportableAsOverflowTests {
    @Test(
        "Adding reporting overflow",
        arguments: [
            (2, 4, 6, false),
            (-2, 4, 2, false),
            (Int.max - 1, 1, Int.max, false),
            (Int.max, 1, Int.min, true),
            (Int.max, 2, Int.min + 1, true),
            (Int.min, -1, Int.max, true),
            (Int.min, -2, Int.max - 1, true)
        ]
    )
    internal func addingReportingOverflow(
        augend: Int,
        addend: Int,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = augend.addingReportingOverflow(addend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Subtracting reporting overflow",
        arguments: [
            (6, 4, 2, false),
            (-6, 4, -10, false),
            (Int.min + 1, 1, Int.min, false),
            (Int.min, 1, Int.max, true),
            (Int.min, 2, Int.max - 1, true),
            (Int.max, -1, Int.min, true),
            (Int.max, -2, Int.min + 1, true)
        ]
    )
    internal func subtractingReportingOverflow(
        minuend: Int,
        subtrahend: Int,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = minuend.subtractingReportingOverflow(subtrahend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Multiplied reporting overflow",
        arguments: [
            (2, 3, 6, false),
            (-2, 3, -6, false),
            (Int.max, 1, Int.max, false),
            (Int.max, 2, -2, true),
            (Int.min, 2, 0, true),
            (Int.min, -1, Int.min, true)
        ]
    )
    internal func multipliedReportingOverflow(
        multiplicand: Int,
        multiplier: Int,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = multiplicand.multipliedReportingOverflow(by: multiplier)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Divided reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (6, 2, 3, false),
            (-6, 2, -3, false),
            (Int.max, 1, Int.max, false),
            (Int.max, 0, Int.max, true),
            (Int.min, -1, Int.min, true)
        ]
    )
    internal func dividedReportingOverflow(
        dividend: Int,
        divisor: Int,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = dividend.dividedReportingOverflow(by: divisor)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Remainder reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (7, 2, 1, false),
            (-7, 2, -1, false),
            (Int.max, 1, 0, false),
            (Int.max, 0, Int.max, true),
            (Int.min, -1, 0, true)
        ]
    )
    internal func remainderReportingOverflow(
        dividend: Int,
        divisor: Int,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = dividend.remainderReportingOverflow(dividingBy: divisor)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Raised reporting overflow",
        arguments: [
            (0, 0, 1, false),
            (0, 1, 0, false),
            (0, 2, 0, false),
            (1, 0, 1, false),
            (1, 1, 1, false),
            (-2, 3, -8, false),
            (2, 3, 8, false),
            (Int.max, 2, 1, true),
            (Int.max, 3, 1, true),
            (Int.min, 2, 0, true)
        ]
    )
    internal func raisedReportingOverflow(
        base: Int,
        exponent: Int.Exponent,
        partialValue: Int,
        overflow: Bool
    ) {
        let report: Int.Report = base.raisedReportingOverflow(to: exponent)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }
}
