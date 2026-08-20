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
repository's [issues](https://github.com/bikecalc/swift-numeric-protocols/issues).

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

Substantial code changes should normally start with an issue so the problem, design, and scope can
be discussed before implementation begins.

Use public intake templates to report unrefined ideas and problems:

- Use **Request a feature** to propose a capability or improvement for consideration.
- Use **Report a bug** to provide reproducible incorrect or unexpected behavior.
- Use **Request documentation** to propose new documentation or an improvement to existing
  documentation.

After triage, maintainers should use **Plan a task** for accepted work that is ready for delivery,
whether it originated from a public request or was identified internally. Planned tasks describe
intent: the overview explains why the work matters, the acceptance criteria define what must be
delivered, and the testing scenarios define how the expected behavior will be verified.

#### Acceptance Criteria

Acceptance criteria define the observable outcomes, capabilities, and constraints that must be
satisfied before an issue can be closed. They should describe what must be delivered without
prescribing implementation details unless those details are intentional requirements.

#### Testing Scenarios

Testing scenarios define the representative behaviors, boundaries, failure conditions, and edge
cases used to verify the acceptance criteria. A scenario may be verified manually or through an
automated test. A single scenario may require multiple test functions to separate successful
behavior, failure behavior, edge cases, or rule-specific behavior. One parameterized test function
may also exercise many cases within the same scenario.

In Swift Testing, a scenario often corresponds to an `@Test` function while its test cases are the
values supplied through `arguments`. This is a useful mapping, not a structural requirement;
organize scenarios according to behavior rather than the testing framework.

Do not duplicate every test case in an issue unless each case represents a distinct requirement or
risk. When examples make a scenario easier to refine or verify, add them as a nested list beneath
the scenario. Use nested checkboxes only when each case must be verified independently.

For example, document a testing scenario and its cases as follows:

```text
- [ ] Prevent form submission when required information is invalid.
  - A required value is missing.
  - A value uses an unsupported format.
    - An email address is malformed.
    - A date does not use the expected format.
  - Text length is outside the allowed range.
    - Character count is below the minimum.
    - Character count exceeds the maximum.
```

#### Sub-Issues

Use native GitHub sub-issues when a unit of work can be owned, reviewed, deferred, or closed
independently. Keep closely related code, tests, and documentation in one planned task when
they are developed together.

#### Issue Metadata

Use GitHub's structured fields instead of repeating metadata in the issue description. Complete or
update the fields as information becomes available during triage, refinement, scheduling, and
implementation:

- Assign the person responsible for the issue when ownership is known.
- Set the issue type to **Bug**, **Feature**, or **Task**.
- Set the priority to **Urgent**, **High**, **Medium**, or **Low**.
- Add optional start and target dates when the work is scheduled.
- Set the effort to **High**, **Medium**, or **Low** when it can be estimated.
- Assign the issue to a milestone when it is included in a release.
- Add parent, blocked-by, blocking, and related-to relationships when they apply.
- Link the development branch when implementation begins.

Use short, imperative issue titles that start with a verb. Issue titles should describe the work in
human language; branch names should describe the route. For example, an issue titled
`Add DocC documentation` could use the branch `docs/add-docc-documentation`.

Use sentence case for issue titles. Capitalize proper nouns, acronyms, and API names such as
`DocC`, `UInt4`, `Roman`, and `Swift Testing`.

Release issues should use the form:

```text
Prepare <semantic version> release
```

### Milestones

Normally, create and refine issues before assigning them to a release. Once the scope of a release
begins to take shape, create a milestone using the semantic version of that release:

```text
<major>.<minor>.<patch>
```

Create one release issue, assign it and every issue included in the release to the milestone, and
make those issues sub-issues of the release issue. The release issue should summarize the included
outcomes and other release-wide work in a high-level checklist without duplicating the detailed
acceptance criteria or testing scenarios tracked by its sub-issues.

### Branches

Branch names should follow [Conventional Branch](https://conventionalbranch.org/).

Use lowercase branch names in the form:

```text
<type>/<description>
```

The `main` branch is protected and represents the released package history. Release branches are
also protected and should use the form:

```text
release/<semantic version>
```

Use `feature`, `bugfix`, `chore`, `docs`, or `test` branches for regular work. These branches
should be merged into a release branch. Use `hotfix` branches only for urgent fixes that need to be
merged directly into `main`.

Delete short-lived branches after they are merged.

Allowed pull request routes are:

- `release/*` or `hotfix/*` into `main`.
- `feature/*`, `bugfix/*`, `chore/*`, `docs/*`, or `test/*` into `release/*`.

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

Indent Swift source code with four spaces per level. Do not use tabs for indentation.

#### Declaration Order

Organize declarations by their role and relationship rather than alphabetically or by access
level. Use the following order as a baseline, but keep closely related declarations, overloads,
and paired operations together when that makes the API easier to understand. Within each
category, place fundamental behavior before convenience behavior.

Within a concrete type, use the following order when applicable:

1. Enumeration cases
2. Type aliases
3. Nested types
4. Stored instance properties
5. Initializers
6. Deinitializers
7. Computed instance properties
8. Type properties
9. Instance subscripts
10. Type subscripts
11. Instance functions
12. Type functions and operators

Apply the same relative order to protocols and extensions, omitting categories that do not apply.
Protocols place associated types alongside type aliases at the beginning. Order
protocol-conformance extensions alphabetically by protocol name, and follow the applicable
declaration order within each extension while keeping related requirements and implementations
together.

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

Protocol and protocol-extension documentation should describe requirements and guarantees without
Swift examples that assume a particular conforming type's behavior. Place examples only on public
concrete types and their public declarations, where their results are guaranteed. Keep examples
short and focused on illustrating ordinary usage; use tests instead for comprehensive cases and
edge conditions. Introduce every example with `For example:` on its own documentation line. Print
the demonstrated value and show the expected output with a `// Prints "..."` comment.

For example, document a public declaration as follows:

````text
/// For example:
///
/// ```swift
/// let value = 2 + 2
///
/// print(value)
/// // Prints "4"
/// ```
````

### Commits

Commit messages should follow [Conventional Commits](https://www.conventionalcommits.org/).

Use the form:

```text
<type>[optional scope]: <description>
```

When a scope is included, enclose it in parentheses. Append `!` after the type or scope to indicate
a breaking change.

Allowed types are `fix`, `feat`, `build`, `chore`, `ci`, `docs`, `style`, `refactor`, `perf`, and
`test`.

### Pull Requests

When creating a pull request, use the pull request template. Briefly explain its outcome in the
Overview section and summarize reviewer-relevant additions, updates, and removals in the Changes
section without restating the issue or describing line-by-line implementation details.

Use the Conventional Commit form described above for the pull request title:

```text
<type>[optional scope]: <description>
```

Link the pull request to its issue in GitHub. Configured workflows run automatically, and their
results appear on the pull request, so do not repeat them in its description.

Each issue included in a release should normally have its own pull request into the release branch.
If work is already present without a dedicated pull request, create or update the issue to document
the delivered outcome, assign it to the appropriate milestone and parent release issue when
applicable, and close it once the outcome has been confirmed. Do not create a retrospective pull
request solely to reproduce a relationship that did not exist during implementation.

Once the release checklist is complete and its sub-issues are closed, open a pull request from the
release branch into `main` and link it to the release issue.

Pull requests must target a branch allowed by the branch routing rules.

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

Create a version tag matching the release milestone after a release is merged into `main`. Create
a version tag after a hotfix is merged into `main`.
