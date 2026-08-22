// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Testing
@testable import NumericsExtended

@Suite("UInt4 Equatable Tests")
internal struct UInt4EquatableTests {
    private static let equalityArguments: Array<(UInt4, UInt4)> = [
        (1, 1),
        (1, 2)
    ]

    @Test(
        "Equality predicates",
        arguments: Self.equalityArguments
    )
    internal func equalityPredicates(
        lhs: UInt4,
        rhs: UInt4
    ) {
        #expect(lhs.isEqual(to: rhs) == (lhs == rhs))
        #expect(lhs.isUnequal(to: rhs) == (lhs != rhs))
    }
}

// MARK: - Integer Rules

extension UInt4EquatableTests {
    @Test(
        "Zero equality follows integer rules",
        arguments: [
            (0, 0, true),
            (0, 1, false)
        ] as Array<(UInt4, UInt4, Bool)>
    )
    internal func zeroEqualityFollowsIntegerRules(
        lhs: UInt4,
        rhs: UInt4,
        result: Bool
    ) {
        #expect(lhs.isEqual(to: rhs) == result)
        #expect(lhs.isUnequal(to: rhs) == !result)
    }
}
