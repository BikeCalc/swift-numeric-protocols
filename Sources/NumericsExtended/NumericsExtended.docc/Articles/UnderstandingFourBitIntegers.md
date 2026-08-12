# Understanding Four-Bit Integers

Learn how binary integers store values, wrap around, and interpret bit patterns by using integer types small enough to inspect by hand.

## Overview

Swift's standard integer types are usually too large to reason about visually. A `UInt64` has 64 bits, which means there are 18,446,744,073,709,551,616 possible bit patterns. That is too many patterns to list, too many values to count by hand, and too much machinery to see at once.

A four-bit integer has only 16 possible bit patterns. That tiny range makes `UInt4` and `Int4` useful learning types. They behave like fixed-width integers, but their entire value space fits in one table.

This article focuses on the binary model itself: bits, unsigned interpretation, signed interpretation, truncation, overflow, and bitwise operations.

## Start With Bits

A bit is a value with two possible states: `0` or `1`.

A four-bit value is a group of four bits:

```text
0000
0001
0010
0011
```

Each position can independently be `0` or `1`. Because there are four positions and two choices for each position, there are 16 possible patterns:

```text
2 * 2 * 2 * 2 = 16
```

That means a four-bit integer can represent exactly 16 distinct values. The interesting part is that the same 16 patterns can mean different things depending on how a type interprets them.

## Use Binary Place Values

Binary numbers use place values, just like decimal numbers. Decimal uses powers of ten. Binary uses powers of two.

For four bits, the place values are:

```text
8 4 2 1
```

So the bit pattern `1011` means:

```text
1 0 1 1
8 + 0 + 2 + 1 = 11
```

The bit pattern `1111` turns on every place value:

```text
1 1 1 1
8 + 4 + 2 + 1 = 15
```

That is why an unsigned four-bit integer can represent values from `0` through `15`.

## Interpret Unsigned and Signed Values

`UInt4` and `Int4` use the same 16 bit patterns, but they interpret those patterns differently.

`UInt4` is unsigned. It reads every bit pattern as a nonnegative value from `0` through `15`.

`Int4` is signed. It uses two's-complement representation, so `0000` through `0111` represent `0` through `7`, while `1000` through `1111` represent `-8` through `-1`.

| Bits | `UInt4` | `Int4` |
| ---- | ------: | -----: |
| `0000` | `0` | `0` |
| `0001` | `1` | `1` |
| `0010` | `2` | `2` |
| `0011` | `3` | `3` |
| `0100` | `4` | `4` |
| `0101` | `5` | `5` |
| `0110` | `6` | `6` |
| `0111` | `7` | `7` |
| `1000` | `8` | `-8` |
| `1001` | `9` | `-7` |
| `1010` | `10` | `-6` |
| `1011` | `11` | `-5` |
| `1100` | `12` | `-4` |
| `1101` | `13` | `-3` |
| `1110` | `14` | `-2` |
| `1111` | `15` | `-1` |

The leftmost bit is the sign bit for `Int4`. If it is `0`, the signed value is nonnegative. If it is `1`, the signed value is negative.

This is why signed integer ranges are asymmetric. `Int4` has one more negative value than positive value: the range is `-8...7`.

The bit pattern `1111` is `15` for `UInt4`, but `-1` for `Int4`. The stored bits are the same; the interpretation is different.

## Understand Truncation

Truncation keeps the low bits of a source value and discards the rest. For a four-bit integer, that means keeping only the last four bits.

The decimal value `16` is binary `1 0000`:

```text
1 0000
  0000
```

Keeping only the low four bits leaves `0000`, so the four-bit result is zero.

The decimal value `17` is binary `1 0001`:

```text
1 0001
  0001
```

Keeping only the low four bits leaves `0001`, so the four-bit result is one.

For signed values, the same low four bits are interpreted through two's-complement rules:

| Source | Low Four Bits | `UInt4` Interpretation | `Int4` Interpretation |
| -----: | ------------- | ---------------------: | --------------------: |
| `7` | `0111` | `7` | `7` |
| `8` | `1000` | `8` | `-8` |
| `15` | `1111` | `15` | `-1` |
| `16` | `0000` | `0` | `0` |
| `17` | `0001` | `1` | `1` |

Truncation is not the same as asking whether a value fits. It is a bit-level operation: keep the low bits, then let the destination type interpret them.

## Understand Overflow

Overflow happens when an arithmetic result does not fit in the type's representable range.

For `UInt4`, the largest value is `15`. Adding one more cannot produce `16`, because `16` is outside the range. In a four-bit unsigned domain, the values wrap after `15`:

```text
0, 1, 2, 3, ..., 14, 15, 0, 1, ...
```

So `15 + 1` wraps to `0`.

For `Int4`, the largest value is `7`. Adding one more produces the bit pattern `1000`, which `Int4` interprets as `-8`:

| Operation | Bit Pattern | Interpretation |
| --------- | ----------- | -------------- |
| `7 + 1` | `1000` | `-8` |
| `-8 - 1` | `0111` | `7` |

This is the same four-bit wrap, but viewed through signed interpretation.

## Inspect Bitwise Operations

Bitwise operations work directly on bit patterns.

The bitwise AND operator, `&`, keeps a `1` only when both input bits are `1`:

```text
1100
1010
----
1000
```

The bitwise OR operator, `|`, keeps a `1` when either input bit is `1`:

```text
1100
1010
----
1110
```

The bitwise XOR operator, `^`, keeps a `1` when the input bits are different:

```text
1100
1010
----
0110
```

Signed values still have bit patterns. For example, `-1` as `Int4` is `1111`. If you apply the mask `0011`, only the selected low bits remain:

```text
1111
0011
----
0011
```

This is a useful reminder: signed integers are still bit patterns first. The type decides how to interpret those patterns as numeric values.

## Understand Fixed-Width Properties

Fixed-width integer types expose information about their bit patterns.

For the four-bit pattern `1100`:

| Property | Result | Reason |
| -------- | -----: | ------ |
| Nonzero bit count | `2` | Two bits are `1`. |
| Leading zero bit count | `0` | The first bit is already `1`. |
| Trailing zero bit count | `2` | The last two bits are `0`. |

These properties are simple on a four-bit value, which makes them useful for understanding the same APIs on larger fixed-width integers.
