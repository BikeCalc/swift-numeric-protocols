//
// RomanReportableAsOverflowTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Roman ReportableAsOverflow Tests")
internal struct RomanReportableAsOverflowTests {
    @Test(
        "Adding reporting overflow",
        arguments: [
            (2, 4, 6, false),
            (Roman.max - 1, 1, Roman.max, false),
            (Roman.max, 1, Roman.min, true),
            (Roman.max, 2, Roman.min + 1, true)
        ] as Array<(Roman, Roman, Roman, Bool)>
    )
    internal func addingReportingOverflow(
        augend: Roman,
        addend: Roman,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = augend.addingReportingOverflow(addend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Subtracting reporting overflow",
        arguments: [
            (6, 4, 2, false),
            (1, 1, Roman.min, false),
            (Roman.min + 1, 1, Roman.min, false),
            (Roman.min, 1, Roman.max, true),
            (Roman.min, 2, Roman.max - 1, true)
        ] as Array<(Roman, Roman, Roman, Bool)>
    )
    internal func subtractingReportingOverflow(
        minuend: Roman,
        subtrahend: Roman,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = minuend.subtractingReportingOverflow(subtrahend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Multiplied reporting overflow",
        arguments: [
            (2, 3, 6, false),
            (Roman.max, 1, Roman.max, false),
            (Roman.max, 2, Roman.max - 1, true),
            (2000, 2, Roman.min, true),
            (1000, 4, Roman.min, true)
        ] as Array<(Roman, Roman, Roman, Bool)>
    )
    internal func multipliedReportingOverflow(
        multiplicand: Roman,
        multiplier: Roman,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = multiplicand.multipliedReportingOverflow(by: multiplier)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Divided reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (6, 2, 3, false),
            (7, 2, 3, false),
            (Roman.max, 1, Roman.max, false),
            (Roman.max, 0, Roman.max, true)
        ] as Array<(Roman, Roman, Roman, Bool)>
    )
    internal func dividedReportingOverflow(
        dividend: Roman,
        divisor: Roman,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = dividend.dividedReportingOverflow(by: divisor)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Remainder reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (7, 2, 1, false),
            (Roman.max, 1, Roman.min, false),
            (Roman.max, Roman.max, Roman.min, false),
            (Roman.max, 0, Roman.max, true)
        ] as Array<(Roman, Roman, Roman, Bool)>
    )
    internal func remainderReportingOverflow(
        dividend: Roman,
        divisor: Roman,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = dividend.remainderReportingOverflow(dividingBy: divisor)

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
            (15, 3, 3375, false),
            (Roman.max, 2, 1, true),
            (Roman.max, 3, 1, true),
            (16, 3, 96, true)
        ] as Array<(Roman, Roman.Exponent, Roman, Bool)>
    )
    internal func raisedReportingOverflow(
        base: Roman,
        exponent: Roman.Exponent,
        partialValue: Roman,
        overflow: Bool
    ) {
        let report: Roman.Report = base.raisedReportingOverflow(to: exponent)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }
}
