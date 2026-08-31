// swift-tools-version:6.3

import PackageDescription

let package = Package(
    name: "numerics-extended-benchmarks",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(
            path: ".."
        )
    ],
    targets: [
        .testTarget(
            name: "NumericsExtendedBenchmarks",
            dependencies: [
                .product(
                    name: "NumericsExtended",
                    package: "swift-numeric-protocols"
                )
            ],
            path: "NumericsExtendedBenchmarks"
        )
    ],
    swiftLanguageModes: [.v6]
)
