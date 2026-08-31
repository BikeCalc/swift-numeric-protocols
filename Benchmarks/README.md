# Benchmarks

The performance benchmarks use XCTest without adding dependencies to the main package. They live in a separate package
so ordinary correctness tests do not run them.

Run the benchmarks from the repository root:

```shell
swift test --package-path Benchmarks --configuration release
```

Each XCTest measurement contains 10,000 operations and is repeated ten times. XCTest reports the wall-clock duration of
each sample together with its average and relative standard deviation.

## Continuous Integration

The `Benchmark` GitHub Actions workflow runs on pushes to `main` and release branches, on pull requests targeting those
branches, and when started manually.

For a pull request, the workflow compares its measurements with the target branch. For a push, it compares the pushed
revision with the commit immediately before it. Both revisions run sequentially on the same GitHub Actions runner. The
workflow publishes the approximate time per operation and percentage difference in its job summary.

Performance differences are informational and do not cause the workflow to fail. The workflow fails only when the
package or performance tests cannot build or run. When the comparison revision does not contain Fraction, the summary
contains measurements for only the current revision.

The workflow formats its job summary with `Scripts/CompareBenchmarkResults.swift`. Keeping this tool at the repository
root makes the same comparison available to other workflows and local scripts without tying it to the benchmark package.

Run the comparison from the repository root with a current XCTest log and, optionally, a target log:

```shell
swift Scripts/CompareBenchmarkResults.swift --current <current-log> [--target <target-log>]
```
