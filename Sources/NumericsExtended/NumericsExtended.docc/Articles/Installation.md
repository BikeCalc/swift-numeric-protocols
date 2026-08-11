# Installation

Add Numerics Extended to a Swift package and import the public product.

## Overview

Numerics Extended is distributed as a Swift package. Add it as a dependency, attach the `NumericsExtended` product to your target, and import the module in source files that use the protocols or experimental numeric types.

### Add the Package Dependency

Add the package to the dependencies in your `Package.swift` file.

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/bikecalc/swift-numerics-extended.git", branch: "main")
    ],
    ...
)
```

### Attach the Product to a Target

Add the package as a dependency on your target in your `Package.swift` file.

```swift
let package = Package(
    ...
    targets: [
        .target(name: "MyTarget", dependencies: [
            .product(name: "NumericsExtended", package: "swift-numerics-extended")
        ]),
    ],
    ...
)
```

### Import the Module

Import the package in your source code.

```swift
import NumericsExtended
```
