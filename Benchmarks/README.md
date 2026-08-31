# Benchmarks

The benchmarks use `ContinuousClock` in the `NumericsExtendedBenchmarks` executable target. The target belongs to the
main package, so ordinary package builds can detect compilation errors in the benchmark code. Performance measurements
run only when the executable itself is invoked.

Run the benchmarks from the repository root:

```shell
swift run --configuration release NumericsExtendedBenchmarks
```

This form prints the JSON report to the terminal; it does not create a file.

Write the machine-readable report to the ignored package build directory with:

```shell
swift run --configuration release NumericsExtendedBenchmarks \
    --output .build/benchmark-results.json
```

An output path is resolved relative to the directory where the command is run. After a successful run, the executable
prints the resolved path of the generated report.

Each benchmark performs 10,000 operations per sample after one warm-up sample. The reported value is the median duration
per operation across ten measured samples. Always use a release build when measuring performance; debug builds are not
representative of optimized package performance.

Shared Fraction and Canonicalized Fraction benchmarks use equivalent preconstructed operands. Canonicalized arithmetic
copies a preconstructed wrapper before each operation and includes the canonicalization performed when the result is
assigned back to `wrappedValue`. Initial operand construction is not included in either measurement.

## Continuous Integration

The `Benchmark` workflow runs the `NumericsExtendedBenchmarks` executable for the current revision and, when available,
a baseline revision on the same GitHub Actions runner. Pull requests use their base branch as the baseline, while pushes
use the preceding revision. Manual runs report only the selected revision.

If the baseline revision predates the executable target, the workflow reports only the current measurements. Once the
executable target exists in the baseline, both revisions use the current benchmark definitions so that their
measurements remain comparable.

The workflow is informational: performance differences do not fail the job. Build failures, execution failures, and
invalid reports do fail it.

`Scripts/CompareBenchmarkResults.swift` compares the JSON reports and prints the Markdown used for the job summary. Run
it locally with:

```shell
swift Scripts/CompareBenchmarkResults.swift \
    --current current-results.json \
    --baseline baseline-results.json
```
