# ``NumericsExtended``

Small numeric protocols, standard-library conformances, and experimental numeric types.

## Overview

Numerics Extended explores Swift numerics in layers, from tiny operator protocols to experimental integer types that make low-level behavior easier to inspect.

The package is organized around four ideas:

- Core numeric protocols describe individual capabilities such as addition, division, comparison, representation, rounding, truncation, and overflow reporting.
- Standard numeric protocols connect those capabilities to Swift's standard library protocols such as `AdditiveArithmetic`, `BinaryFloatingPoint`, `BinaryInteger`, `FixedWidthInteger`, `FloatingPoint`, `Numeric`, `SignedInteger`, `SignedNumeric`, and `UnsignedInteger`.
- Standard numeric types extend familiar Swift types such as `Int`, `Int8`, `Int16`, `Int32`, `Int64`, `UInt`, `UInt8`, `UInt16`, `UInt32`, `UInt64`, `Float16`, `Float32`, and `Float64`.
- Experimental numeric types provide compact, inspectable examples such as `Int4`, `UInt4`, and `Roman`.

`Int4` and `UInt4` are especially useful for teaching. A four-bit integer has only 16 possible bit patterns, so overflow, truncation, two's-complement interpretation, and bitwise operations can be shown in a small table instead of hidden inside a 64-bit value.

### Core Protocol Families

The protocol layer is intentionally small and composable:

- Operations: `Addable`, `Subtractable`, `Multipliable`, `Divisible`, `Negateable`, and `Raisable`.
- Relations: `Equatable`, `Comparable`, and `CanonicallyEquatable`.
- Representations: `RepresentableByZero`, `RepresentableByMin`, `RepresentableByMax`, `RepresentableByInfinity`, and `RepresentableByNaN`.
- Transformations and adjustments: `Roundable`, and `Truncatable`.
- Adjustments: `Increasable`, and `Decreasable`.
- Overflow reporting: `ReportableAsOverflow`.

### Experimental Numeric Types

The experimental type layer currently includes:

- `Int4`, a signed four-bit integer with values from `-8` through `7`.
- `UInt4`, an unsigned four-bit integer with values from `0` through `15`.
- `Roman`, a Roman numeral type with parser-backed validation and arithmetic behavior with values from `0` through `3999`.

## Topics

### Start Here

- <doc:Installation>

### Articles

- <doc:UnderstandingFourBitIntegers>
- <doc:UnderstandingRomanNumerals>

### Operations

- ``Operatable``
- ``Addable``
- ``Subtractable``
- ``Multipliable``
- ``Divisible``
- ``Negateable``
- ``Raisable``

### Relations

- ``CanonicallyEquatable``

### Representations

- ``RepresentableByZero``
- ``RepresentableByMin``
- ``RepresentableByMax``
- ``RepresentableByInfinity``
- ``RepresentableByNaN``

### Transformations

- ``Roundable``
- ``Truncatable``

### Adjustments

- ``Increasable``
- ``Decreasable``

### Overflow Reporting

- ``ReportableAsOverflow``

### Experimental Numeric Types

- ``Int4``
- ``UInt4``
- ``Roman``
