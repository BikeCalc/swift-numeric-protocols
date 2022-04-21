# Installation

A demonstration on how to install this package.

## Overview

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

## Installing this package

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


3. Import the package in your source code.

	```swift
	import NumericProtocols
	```
