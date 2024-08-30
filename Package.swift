// swift-tools-version:5.9

import PackageDescription

let package: Package = .init(
	name: "swift-numeric-protocols",
	defaultLocalization: "en",
	products: [
		.library(name: "NumericProtocols", targets: ["NumericProtocols"])
	],
	dependencies: [
        .package(url:  "https://github.com/swiftlang/swift-docc-plugin.git", from: "1.4.2")
	],
	targets: [
        .target(
            name: "NumericProtocols",
            path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        ),
        .testTarget(
            name: "NumericProtocolsTests",
            dependencies: ["NumericProtocols"],
            path: "Tests",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        )
	],
	swiftLanguageVersions: [.v5]
)
