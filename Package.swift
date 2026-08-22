// swift-tools-version:6.3

import PackageDescription

let package = Package(
    name: "swift-numerics-extended",
    defaultLocalization: "en",
    products: [
        .library(
            name: "NumericsExtended",
            targets: [
                "NumericsExtended"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-docc-plugin.git",
            from: "1.5.0"
        )
    ],
    targets: [
        .target(
            name: "CoreNumericOperators"
        ),
        .target(
            name: "CoreNumericProtocols",
            dependencies: [
                "CoreNumericOperators"
            ]
        ),
        .target(
            name: "ExperimentalNumericConstants"
        ),
        .target(
            name: "ExperimentalNumericTypes",
            dependencies: [
                "CoreNumericOperators",
                "CoreNumericProtocols",
                "StandardNumericProtocols",
                "StandardNumericTypes"
            ]
        ),
        .target(
            name: "NumericsExtended",
            dependencies: [
                "CoreNumericOperators",
                "CoreNumericProtocols",
                "ExperimentalNumericConstants",
                "ExperimentalNumericTypes",
                "StandardNumericProtocols",
                "StandardNumericTypes"
            ]
        ),
        .target(
            name: "StandardNumericProtocols",
            dependencies: [
                "CoreNumericOperators",
                "CoreNumericProtocols"
            ]
        ),
        .target(
            name: "StandardNumericTypes",
            dependencies: [
                "CoreNumericOperators",
                "CoreNumericProtocols",
                "StandardNumericProtocols"
            ]
        ),
        .testTarget(
            name: "NumericsExtendedTests",
            dependencies: [
                "NumericsExtended"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
