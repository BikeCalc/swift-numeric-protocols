//
// Int4ReportableAsOverflowTests.swift
// NumericsExtendedTests
//
// Copyright © 2021-2026 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Testing
@testable import NumericsExtended

@Suite("Int4 ReportableAsOverflow Tests")
internal struct Int4ReportableAsOverflowTests {
    @Test(
        "Adding reporting overflow",
        arguments: [
            (2, 4, 6, false),
            (-2, 4, 2, false),
            (6, 1, 7, false),
            (7, 1, -8, true),
            (7, 2, -7, true),
            (-8, -1, 7, true),
            (-8, -2, 6, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func addingReportingOverflow(
        augend: Int4,
        addend: Int4,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = augend.addingReportingOverflow(addend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Subtracting reporting overflow",
        arguments: [
            (6, 4, 2, false),
            (-6, 1, -7, false),
            (-7, 1, -8, false),
            (-8, 1, 7, true),
            (-8, 2, 6, true),
            (7, -1, -8, true),
            (7, -2, -7, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func subtractingReportingOverflow(
        minuend: Int4,
        subtrahend: Int4,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = minuend.subtractingReportingOverflow(subtrahend)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Multiplied reporting overflow",
        arguments: [
            (2, 3, 6, false),
            (-2, 3, -6, false),
            (7, 1, 7, false),
            (7, 2, -2, true),
            (-8, 2, 0, true),
            (-8, -1, -8, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func multipliedReportingOverflow(
        multiplicand: Int4,
        multiplier: Int4,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = multiplicand.multipliedReportingOverflow(by: multiplier)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Divided reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (6, 2, 3, false),
            (-6, 2, -3, false),
            (7, 1, 7, false),
            (7, 0, 7, true),
            (-8, -1, -8, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func dividedReportingOverflow(
        dividend: Int4,
        divisor: Int4,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = dividend.dividedReportingOverflow(by: divisor)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }

    @Test(
        "Remainder reporting overflow",
        arguments: [
            (0, 1, 0, false),
            (7, 2, 1, false),
            (-7, 2, -1, false),
            (7, 1, 0, false),
            (7, 0, 7, true),
            (-8, -1, 0, true)
        ] as Array<(Int4, Int4, Int4, Bool)>
    )
    internal func remainderReportingOverflow(
        dividend: Int4,
        divisor: Int4,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = dividend.remainderReportingOverflow(dividingBy: divisor)

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
            (2, 2, 4, false),
            (2, 3, -8, true),
            (7, 2, 1, true),
            (-8, 2, 0, true)
        ] as Array<(Int4, Int4.Exponent, Int4, Bool)>
    )
    internal func raisedReportingOverflow(
        base: Int4,
        exponent: Int4.Exponent,
        partialValue: Int4,
        overflow: Bool
    ) {
        let report: Int4.Report = base.raisedReportingOverflow(to: exponent)

        #expect(report.partialValue == partialValue)
        #expect(report.overflow == overflow)
    }
}
