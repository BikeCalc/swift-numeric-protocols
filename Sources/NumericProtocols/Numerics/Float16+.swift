//
// Float16+.swift
// NumericProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if swift(>=5.3) && !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Addable {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Decreasable {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Divisible {
    public static func % (_ lhs: Self, _ rhs: Self) -> Self {
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Increasable {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Multipliable {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Negateable {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: RepresentableByInfinity {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: RepresentableByNaN {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: RepresentableByZero {}

@available(iOS 14, macCatalyst 14.5, macOS 11, tvOS 14, watchOS 7, *)
extension Float16: Subtractable {}
#endif
