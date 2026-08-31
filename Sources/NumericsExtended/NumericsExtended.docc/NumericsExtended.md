# ``NumericsExtended``

Small numeric protocols, standard-library conformances, and experimental numeric types.

## Overview

Numerics Extended explores Swift numerics in layers, from tiny operator protocols to experimental integer types that
make low-level behavior easier to inspect.

Use the package when you want to experiment with numeric abstractions, study how Swift's standard numeric protocols fit
together, or inspect small numeric types such as `Int4`, `UInt4`, and `Roman`.

The package is exposed through a public umbrella module. Import `NumericsExtended` to access the core protocol layer,
standard-library conformances, and experimental numeric types from one place.

## Topics

### Start Here

- <doc:Installation>
- <doc:PackageArchitecture>
- <doc:NumericProtocolHierarchy>

### Articles

- <doc:UnderstandingFourBitIntegers>
- <doc:UnderstandingRationalTypes>
- <doc:UnderstandingRomanNumerals>

### Operations

- ``/CoreNumericProtocols/Operatable``
- ``/CoreNumericProtocols/Addable``
- ``/CoreNumericProtocols/Subtractable``
- ``/CoreNumericProtocols/Multipliable``
- ``/CoreNumericProtocols/Divisible``
- ``/CoreNumericProtocols/Negateable``
- ``/CoreNumericProtocols/Raisable``

### Relations

- ``/CoreNumericProtocols/CanonicallyEquatable``

### Representations

- ``/CoreNumericProtocols/RepresentableByZero``
- ``/CoreNumericProtocols/RepresentableByMin``
- ``/CoreNumericProtocols/RepresentableByMax``
- ``/CoreNumericProtocols/RepresentableByInfinity``
- ``/CoreNumericProtocols/RepresentableByNaN``

### Transformations

- ``/CoreNumericProtocols/Canonicalizable``
- ``/CoreNumericProtocols/Roundable``
- ``/CoreNumericProtocols/Truncatable``

### Adjustments

- ``/CoreNumericProtocols/Increasable``
- ``/CoreNumericProtocols/Decreasable``

### Overflow Reporting

- ``/CoreNumericProtocols/ReportableAsOverflow``

### Experimental Numeric Protocols

- ``/ExperimentalNumericProtocols/Rational``
- ``/ExperimentalNumericProtocols/SymbolicInteger``

### Experimental Numeric Types

- ``/ExperimentalNumericTypes/Fraction``
- ``/ExperimentalNumericTypes/Int4``
- ``/ExperimentalNumericTypes/UInt4``
- ``/ExperimentalNumericTypes/Roman``

### Wrappers

- ``/CoreNumericProtocols/Canonicalized``
