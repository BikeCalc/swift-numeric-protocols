# ``NumericsExtended``

Small numeric protocols, standard-library conformances, and experimental numeric types.

## Overview

Numerics Extended explores Swift numerics in layers, from tiny operator protocols to experimental integer types that make low-level behavior easier to inspect.

Use the package when you want to experiment with numeric abstractions, study how Swift's standard numeric protocols fit together, or inspect small numeric types such as `Int4`, `UInt4`, and `Roman`.

The package is exposed through a public umbrella module. Import `NumericsExtended` to access the core protocol layer, standard-library conformances, and experimental numeric types from one place.

## Topics

### Start Here

- <doc:Installation>
- <doc:PackageArchitecture>

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

- ``Canonicalizable``
- ``Roundable``
- ``Truncatable``

### Wrappers

- ``Canonicalized``

### Adjustments

- ``Increasable``
- ``Decreasable``

### Overflow Reporting

- ``ReportableAsOverflow``

### Experimental Numeric Protocols

- ``Rational``

### Experimental Numeric Types

- ``Int4``
- ``UInt4``
- ``Roman``
