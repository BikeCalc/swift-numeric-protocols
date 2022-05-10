// Point+CustomDebugStringConvertible.swift
// NumericProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

@testable import NumericProtocols

extension Point: CustomDebugStringConvertible {
	var debugDescription: String {
		return "x: \(self.x), y: \(self.y), z: \(self.z)"
	}
}
