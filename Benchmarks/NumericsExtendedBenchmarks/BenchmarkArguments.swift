// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors

import Foundation

internal struct BenchmarkArguments {
    internal let outputURL: URL?

    internal init(_ arguments: Array<String>) throws {
        switch arguments.count {
        case 0:
            self.outputURL = nil
        case 2 where arguments[0] == "--output":
            self.outputURL = .init(fileURLWithPath: arguments[1])
        default:
            throw BenchmarkCommandError.invalidArguments
        }
    }
}
