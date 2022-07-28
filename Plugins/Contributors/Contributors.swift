// Contributors.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import PackagePlugin

#if canImport(Foundation)
import Foundation

@main
internal struct Contributors: CommandPlugin {
	internal func performCommand(
		context: PluginContext,
		arguments: Array<String>
	) async throws {
		let process: Process = .init()
		process.executableURL = .init(fileURLWithPath: "/usr/bin/git")
		process.arguments = ["log", "--pretty=format:- %aN <%aE>"]
		
		let outputPipe: Pipe = .init()
		process.standardOutput = outputPipe
		
		try process.run()
		process.waitUntilExit()
		
		let outputData: Data = outputPipe.fileHandleForReading.readDataToEndOfFile()
		let output: String = .init(decoding: outputData, as: UTF8.self)
		
		let contributors: Array<String> = output
			.components(separatedBy: .newlines)
			.reduce(into: []) { (partialResult, element) in
				if partialResult.contains(element) == false {
					partialResult.append(element)
				}
			}
			.filter { (contributor) in
				contributor.isEmpty == false
			}
			.sorted()
		
		try contributors
			.joined(separator: "\n")
			.write(toFile: "CONTRIBUTORS.txt", atomically: true, encoding: .utf8)
	}
}
#endif
