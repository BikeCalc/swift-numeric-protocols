# Contributing

Everyone is welcome to contribute to Numerics Extended. Contributing does not just mean submitting
pull requests. There are many different ways for you to get involved, including participating in
discussions, reporting or triaging bugs, and contributing code.

No matter how you want to get involved, please first learn what is expected of anyone who
participates in this project. If you are contributing code, you should also be comfortable writing
Swift and working with Swift Package Manager.

By submitting a pull request, you represent that you have the right to license your contribution
and agree that your contribution is licensed under the Apache License v2.0 with Runtime Library
Exception. See `LICENSE.md` for license information.

## Reporting Bugs

Reporting bugs is a great way for anyone to help improve Numerics Extended. This open source
project uses GitHub issues for tracking bugs.

When opening an issue, please use the bug report issue template and include the following:

- **A concise description of the problem.** Describe the behavior you were expecting to see, along
  with the behavior you actually observed.

- **A reproducible test case.** Double-check that your test case reproduces the issue. A relatively
  small sample (roughly within 50 lines of code) is best pasted directly into the description.
  Consider reducing the sample to the smallest amount of code; a smaller test case is easier to
  reason about and more appealing to contributors.

- **A description of the environment that reproduces the problem.** Include information about the
  Swift version, platform and platform version, deployment target if explicitly set, package tag,
  branch, or commit, and Xcode version if relevant.

Security vulnerabilities should not be reported through public issues. Follow the instructions in
`SECURITY.md` instead.

## Triaging Bugs

Reporting bugs is an important part of improving software. Nearly as important is triaging those
bugs to ensure that they are reproducible, small, and unique.

There are a number of things you can do to help triage bugs in the
[bug tracker](https://github.com/bikecalc/swift-numeric-protocols/issues).

- **Reproduce bugs.** For a bug to be actionable, it needs to be reproducible. If you cannot
  reproduce the bug, try to figure out why. Get in touch with the submitter if you need more
  information.

- **Reduce bugs.** Once a bug can be reproduced, reduce it to the smallest amount of code
  possible. Reasoning about a sample that reproduces a bug in just a few lines of code is easier
  than reasoning about a longer sample.

- **Eliminate duplicate bugs.** If two bug reports refer to the same underlying problem, leave a
  comment linking them together. Doing so allows others to work more effectively.

## Contributing Code

### Getting Started

It is highly recommended that you become familiar with using Swift in your own projects before
contributing directly to this project.

### Issues

Substantial code changes should start with an issue so the problem, design, and scope can be
discussed before implementation begins.

### Branches

Branch names should follow [Conventional Branch](https://conventionalbranch.org/).

Use lowercase branch names in the form:

```text
<type>/<description>
```

Long-lived branches such as `main` and `develop` do not need a prefix.

### Code Templates

The license and copyright protections for Numerics Extended code are called out at the top of every
source code file. On the rare occasion you contribute a change that includes a new source file,
ensure that the header is filled out appropriately.

For Swift source files the code header should look like this:

```swift
// This source file is part of the Numerics Extended open source project
//
// Copyright (c) 2021-2026 A. H. de Quatre Ltd. and the Numerics Extended project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.md for license information
// See CONTRIBUTORS.txt for the list of Numerics Extended project authors
```

`Package.swift` must keep the Swift tools version declaration as the first line.

### Source Code

Avoid importing Foundation unless it is required. When Foundation is only needed for a specific
platform or feature, prefer wrapping the import with `#if canImport(Foundation)`.

### Unit Tests

Changes to numeric behavior should include tests. New tests should use Swift Testing. Do not add
new XCTest suites. Prefer focused Swift Testing suites that match the existing structure by numeric
type and protocol.

When adding argument-based tests, keep the existing conventions in mind:

- Use small, readable values.
- Keep signed and unsigned examples aligned where possible.
- Keep floating-point and binary integer examples aligned where possible.
- Put special values such as zero, one, minimum, maximum, infinity, and NaN in rule-specific tests.
- Prefer explicit expected results over deriving expectations from the implementation being tested.

### Docs

Public APIs should have clear documentation comments. User-facing concepts, tutorials, and guides
should be documented with DocC in the `NumericsExtended.docc` catalog.

### Commits

Commit messages should follow [Conventional Commits](https://www.conventionalcommits.org/).

Use the form:

```text
<type>[optional scope]: <description>
```

### Pull Requests

When creating a pull request, please use the pull request template and include a link to the
related issues.

Before submitting a pull request, run the commands that apply to your change:

```sh
swift build
swift test
swift package generate-documentation --target NumericsExtended
```

### Code Reviews

Pull requests are reviewed for correctness, maintainability, test coverage, documentation, and fit
with the package architecture. Code review is part of the contribution process, and requested
changes are normal. A change may be declined or redirected if it does not fit the project's goals.

### Attribution of Changes

Contributors are credited through the Git history. Contributors may also be listed in
`CONTRIBUTORS.txt` when appropriate.

### Tags

Release versions should follow [Semantic Versioning](https://semver.org/).

Use the form:

```text
<major>.<minor>.<patch>
```
