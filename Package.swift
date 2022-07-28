// swift-tools-version:5.6

import PackageDescription

let package: Package = .init(
	name: "swift-numeric-protocols",
	defaultLocalization: "en",
	products: [
		.library(name: "NumericProtocols", targets: ["NumericProtocols"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMinor(from: "1.0.0"))
	],
	targets: [
		.plugin(
			name: "Contributors",
			capability: .command(
				intent: .custom(
					verb: "regenerate-contributors",
					description: "Generates the CONTRIBUTORS.txt file based on Git logs."
				),
				permissions: [
					.writeToPackageDirectory(reason: "This command writes the new CONTRIBUTORS.txt file.")
				]
			)
		),
		.target(name: "NumericProtocols", path: "Sources"),
		.testTarget(name: "NumericProtocolsTests", dependencies: ["NumericProtocols"], path: "Tests")
	],
	swiftLanguageVersions: [.v5]
)
