// swift-tools-version:6.3

import PackageDescription

let package: Package = .init(
	name: "swift-numeric-protocols",
	defaultLocalization: "en",
	products: [
		.library(name: "NumericProtocols", targets: ["NumericProtocols"])
	],
	dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin.git", from: "1.5.0")
	],
	targets: [
        .target(
            name: "NumericProtocols",
            path: "Sources"
        ),
        .testTarget(
            name: "NumericProtocolsTests",
            dependencies: ["NumericProtocols"],
            path: "Tests"
        )
	],
    swiftLanguageModes: [.v6]
)

