//
// UInt4ReportableAsOverflowTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("UInt4 ReportableAsOverflow Tests")
internal struct UInt4ReportableAsOverflowTests {
    @Test(
        "Adding reporting overflow",
        arguments: [
            (2, 4, 6, false),
            (14, 1, 15, false),
            (15, 1, 0, true),
            (15, 2, 1, true)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func addingReportingOverflow(
        augend: UInt4,
        addend: UInt4,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = augend.addingReportingOverflow(addend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Subtracting reporting overflow",
        arguments: [
            (6, 4, 2, false),
            (1, 1, 0, false),
            (0, 1, 15, true),
            (0, 2, 14, true)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func subtractingReportingOverflow(
        minuend: UInt4,
        subtrahend: UInt4,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = minuend.subtractingReportingOverflow(subtrahend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Multiplied reporting overflow",
        arguments: [
            (2, 3, 6, false),
            (15, 1, 15, false),
            (15, 2, 14, true),
            (8, 2, 0, true),
            (4, 4, 0, true),
            (15, 15, 1, true)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func multipliedReportingOverflow(
        multiplicand: UInt4,
        multiplier: UInt4,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = multiplicand.multipliedReportingOverflow(by: multiplier)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Divided reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (6, 2, 3, false),
            (7, 2, 3, false),
            (15, 1, 15, false),
            (15, 0, 15, true)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func dividedReportingOverflow(
        dividend: UInt4,
        divisor: UInt4,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = dividend.dividedReportingOverflow(by: divisor)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Remainder reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (7, 2, 1, false),
            (15, 1, 0, false),
            (15, 15, 0, false),
            (15, 0, 15, true)
        ] as Array<(UInt4, UInt4, UInt4, Bool)>
    )
    internal func remainderReportingOverflow(
        dividend: UInt4,
        divisor: UInt4,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = dividend.remainderReportingOverflow(dividingBy: divisor)

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
            (2, 3, 8, false),
            (15, 2, 1, true),
            (15, 3, 1, true),
            (4, 2, 0, true)
        ] as Array<(UInt4, UInt4.Exponent, UInt4, Bool)>
    )
    internal func raisedReportingOverflow(
        base: UInt4,
        exponent: UInt4.Exponent,
        partialValue: UInt4,
        overflow: Bool
    ) {
        let report: UInt4.Report = base.raisedReportingOverflow(to: exponent)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }
}
