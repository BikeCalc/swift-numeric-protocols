![](Assets/GitHubBanner.png)

# swift-numerics-extended

A Swift package extending numeric protocols, standard numeric types, and experimental numeric types.

## Overview

Numerics Extended provides a layered set of numeric protocols and utilities for Swift. It includes core numeric operators, core numeric protocols, extensions for standard library numeric protocols, standard numeric type conformances, experimental numeric constants, and experimental numeric types such as `Roman`, `Int4`, and `UInt4`.

Experimental numeric types are included for exploration and documentation, and their APIs may evolve across major releases.

## Requirements

- Swift 6.3+

Numerics Extended is written in Swift and avoids platform-specific APIs where possible.

## Installation

1. Add Numerics Extended to the dependencies in your `Package.swift` file:

    ```swift
    let package: Package = .init(
        dependencies: [
            .package(
                url: "https://github.com/bikecalc/swift-numerics-extended.git", 
                from: "2.0.0"
            )
        ]
    )
    ```

2. Add the package product as a dependency on your target:

    ```swift
    let package: Package = .init(
        targets: [
            .target(
                name: "MyTarget",
                dependencies: [
                    .product(
                        name: "NumericsExtended", 
                        package: "swift-numerics-extended"
                    )
                ]
            )
        ]
    )
    ```

3. Import the package in your source code:

    ```swift
    import NumericsExtended
    ```

## Documentation

You can read more about this package by visiting the [documentation](https://bikecalc.github.io/swift-numerics-extended/documentation/numericsextended).

## Contributing

Everyone is welcome to contribute to Numerics Extended. See `CONTRIBUTING.md` for contribution guidelines, branch conventions, pull request expectations, and testing instructions.

If you find a bug, please create an [issue](https://github.com/bikecalc/swift-numerics-extended/issues). Security vulnerabilities should be reported using the instructions in `SECURITY.md`.

## Code of Conduct

This project follows a code of conduct. See `CODE_OF_CONDUCT.md` for more information.

## License

Distributed under Apache License v2.0 with Runtime Library Exception. See `LICENSE.md` for more information.
