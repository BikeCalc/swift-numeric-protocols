# Package Architecture

Understand how the targets in Numerics Extended are organized and how they depend on one another.

## Overview

Numerics Extended separates fundamental operators and protocols from standard-library conformances and experimental APIs. `NumericsExtended` collects every source target into the package's public library.

```text
                                  +-------------------------------+
                                  |        NumericsExtended       |
                                  +---------------+---------------+
                                                  |
                                 +----------------+----------------+
                                 |                                 |
                                 v                                 v
                 +-------------------------------+ +-------------------------------+
                 |   ExperimentalNumericTypes    | | ExperimentalNumericConstants  |
                 +---------------+---------------+ +-------------------------------+
                                 |
                +----------------+----------------+
                |                                 |
                v                                 v
+-------------------------------+ +-------------------------------+
|     StandardNumericTypes      | | ExperimentalNumericProtocols  |
+---------------+---------------+ +---------------+---------------+
                |                                 |
                v                                 |
+-------------------------------+                 |
|   StandardNumericProtocols    |                 |
+---------------+---------------+                 |
                |                                 |
                +----------------+----------------+
                                 |
                                 v
                 +-------------------------------+
                 |     CoreNumericProtocols      |
                 +---------------+---------------+
                                 |
                                 v
                 +-------------------------------+
                 |     CoreNumericOperators      |
                 +-------------------------------+
```

The diagram uses downward arrows to emphasize representative dependency paths through those layers. Each arrow shown is a direct dependency, but some direct edges are omitted to keep the routes readable. The absence of an arrow does not necessarily mean that two targets have no direct relationship. Consult the package manifest for the complete, authoritative target definitions.
