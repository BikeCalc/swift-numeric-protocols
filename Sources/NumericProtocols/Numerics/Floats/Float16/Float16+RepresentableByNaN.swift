// Float16+RepresentableByNaN.swift
// ProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if swift(>=5.3) && !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: RepresentableByNaN {}
#endif
