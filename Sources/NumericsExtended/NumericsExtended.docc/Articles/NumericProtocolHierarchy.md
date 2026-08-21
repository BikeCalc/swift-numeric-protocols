# Numeric Protocol Hierarchy

Explore how Swift's numeric protocol hierarchy supports standard-library and Numerics Extended types.

## Overview

Swift's numeric protocols form several branches that converge on `Numeric`, including the floating-point, signed-integer, and binary-integer hierarchies. Numerics Extended adds package-owned entry points to that structure: `Fraction` conforms to `Rational`, while `Roman` conforms to `SymbolicInteger`.

`Fraction` also conditionally conforms to `SignedNumeric` when its `Term` conforms to `SignedInteger`. `Rational` and `SymbolicInteger` incorporate additional Core Numeric Protocol requirements, whereas standard-library protocols cannot be retroactively changed to refine those package protocols. Those orthogonal Core requirements therefore remain outside this refinement hierarchy.

```text
+---------------------+ +---------------------+             +---------------------+ +---------------------+             +---------------------+
|      Fraction       | |       Double        |             |         Int         | |        UInt         |             |        Roman        |
+----------+----------+ +----------+----------+             +----------+----------+ +----------+----------+             +----------+----------+
           |                       |                                   |                       |                                   |
           |                       |                       +-----------+---------->+<----------+-----------+                       |
           |                       |                       |                       |                       |                       |
           |                       v                       v                       v                       v                       v
           |            +---------------------+ +---------------------+ +---------------------+ +---------------------+ +---------------------+
           |            | BinaryFloatingPoint | |    SignedInteger    | |  FixedWidthInteger  | |   UnsignedInteger   | |   SymbolicInteger   |
           |            +----------+----------+ +----------+----------+ +----------+----------+ +----------+----------+ +----------+----------+
           |                       |                       |                       |                       |                       |
           |                       |                       +---------------------->+<----------------------+                       |
           |                       |                       |                       |                                               |
           |                       v                       |                       v                                               |
           |            +---------------------+            |            +---------------------+                                    |
           |            |    FloatingPoint    |            |            |    BinaryInteger    |                                    |
           |            +----------+----------+            |            +----------+----------+                                    |
           |                       |                       |                       |                                               |
           +---------------------->+---------->+<----------+                       |                                               |
           |                                   |                                   |                                               |
           v                                   v                                   |                                               |
+---------------------+             +---------------------+                        |                                               |
|      Rational       |             |    SignedNumeric    |                        |                                               |
+----------+----------+             +----------+----------+                        |                                               |
           |                                   |                                   |                                               |
           +---------------------------------->+---------------->+<----------------+<----------------------------------------------+
                                                                 |
                                                                 v
                                                      +---------------------+
                                                      |       Numeric       |
                                                      +----------+----------+
                                                                 |
                                                                 v
                                                      +---------------------+
                                                      | AdditiveArithmetic  |
                                                      +----------+----------+
                                                                 |
                                                                 v
                                                      +---------------------+
                                                      |      Equatable      |
                                                      +---------------------+
```

Read each arrow downward from a concrete type to a protocol or from a refining protocol to one of its requirements. Arrowheads at junctions clarify the direction of converging paths, while vertical placement minimizes line length and crossings rather than expressing semantic tiers. The diagram gives `Fraction`'s conditional `SignedNumeric` path no separate visual style and omits nonnumeric requirements such as literal conversion and hashing.
