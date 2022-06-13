![](Assets/GitHubBanner.png)

# swift-numeric-protocols

A package containing numeric protocols, for the Swift programming language.

## Overview

No overview available.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- macCatalyst 15.0+
- macOS 10.15+
- watchOS 6.0+

## Installation

The Swift Package Manager is a tool for managing the distribution of Swift code and is integrated into the swift compiler.

1. Add the package to the dependencies in your `Package.swift` file.

    ```swift
    let package: Package = .init(
        ...
        dependencies: [
            .package(url: "https://github.com/alexandrehsaad/swift-numeric-protocols.git", branch: "main")
        ],
        ...
    )
    ```

2. Add the package as a dependency on your target in your `Package.swift` file.

    ```swift
    let package: Package = .init(
        ...
        targets: [
            .target(name: "MyTarget", dependencies: [
                .product(name: "NumericProtocols", package: "swift-numeric-protocols")
            ]),
        ],
        ...
    )
    ```

3. Import the package in your source code.

    ```swift
    import NumericProtocols
    ```

## Documentation

You can read more about this package by visiting the [documentation page].

## Contribution

### Reporting a bug

If you find a bug, please create an [issue].

### Contacting the maintainers

The current code owner of this repository is Alex ([@alexandrehsaad]). If you want to share your thoughts or feedback on how to improve this repository, you can contact him by writing an email to alexandresaad at icloud dot com.

### Supporting this repository

If this repository has been useful to you in some way, show your support by starring it.

## Code of Conduct

To be a truly great community, we welcome developers from all walks of life, with different backgrounds, and with a wide range of experience. A diverse and friendly community will have more great ideas, more unique perspectives, and produce more great code. We will work diligently to make this community welcoming to everyone. See the `CODE_OF_CONDUCT.md` file for more information.

## License

Distributed under Apache License v2.0 with Runtime Library Exception. See the `LICENSE.md` file for more information.

[documentation page]: https://alexandrehsaad.github.io/swift-numeric-protocols/documentation/numeric-protocols
[issue]: https://github.com/alexandrehsaad/swift-numeric-protocols/issues
[@alexandrehsaad]: https://github.com/alexandrehsaad
