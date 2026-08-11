# Understanding Roman Numerals

Learn how Roman numerals are written, how Numerics Extended validates them, and how the `Roman` type behaves as an experimental numeric type.

## Overview

Roman numerals describe whole numbers with symbols instead of positional decimal digits. A decimal number such as `2026` uses place value: `2` thousands, `0` hundreds, `2` tens, and `6` ones. A Roman numeral such as `MMXXVI` is built from symbols whose values are added or subtracted according to Roman numeral rules.

Numerics Extended models this with `Roman`, a numeric type whose public values range from `0` through `3999`. The type stores a numeric value internally, but its public string representation follows Roman numeral notation.

## Learn the Symbols

The Roman symbols in this package are:

| Symbol | Value | Notes |
| -----: | ----: | ----- |
| `N` | `0` | Represents nulla, or zero. |
| `I` | `1` | Repeatable up to three times. |
| `V` | `5` | Not repeatable. |
| `X` | `10` | Repeatable up to three times. |
| `L` | `50` | Not repeatable. |
| `C` | `100` | Repeatable up to three times. |
| `D` | `500` | Not repeatable. |
| `M` | `1000` | Repeatable up to three times in this package because `Roman.max` is `3999`. |

The package also recognizes canonical subtractive pairs:

| Pair | Value | Meaning |
| ---: | ----: | ------- |
| `IV` | `4` | One before five. |
| `IX` | `9` | One before ten. |
| `XL` | `40` | Ten before fifty. |
| `XC` | `90` | Ten before one hundred. |
| `CD` | `400` | One hundred before five hundred. |
| `CM` | `900` | One hundred before one thousand. |

These subtractive pairs are treated as single Roman units by the parser. That makes `IV` valid, while forms such as `IIV`, `VX`, and `IC` remain invalid.

## Use Additive Notation

Most Roman numerals are additive. Symbols are written from largest to smallest, and their values are added together.

| Roman | Decimal | Breakdown |
| ----: | ------: | --------- |
| `II` | `2` | `I + I` |
| `VI` | `6` | `V + I` |
| `XVI` | `16` | `X + V + I` |
| `XXVI` | `26` | `X + X + V + I` |
| `MDC` | `1600` | `M + D + C` |
| `MMXXVI` | `2026` | `M + M + X + X + V + I` |

The ordering rule matters. `XVI` is valid because the values descend from `X` to `V` to `I`. `VX` is invalid because `V` cannot appear before a larger `X` to make five-before-ten.

## Use Subtractive Notation

Subtractive notation handles values that would otherwise require four repeated symbols. Instead of writing `IIII`, Roman numerals write `IV`. Instead of writing `XXXX`, they write `XL`.

| Decimal | Valid Roman | Invalid Alternative |
| ------: | ----------: | ------------------: |
| `4` | `IV` | `IIII` |
| `9` | `IX` | `VIIII` |
| `40` | `XL` | `XXXX` |
| `90` | `XC` | `LXXXX` |
| `400` | `CD` | `CCCC` |
| `900` | `CM` | `DCCCC` |

Only `I`, `X`, and `C` can be used subtractively, and each one can only subtract from the next two larger symbols in the Roman scale. `I` can subtract from `V` and `X`, but not from `L`, `C`, `D`, or `M`. That is why `IX` is valid and `IC` is invalid.

## Respect Repetition Rules

Some symbols can repeat, and some cannot.

`I`, `X`, `C`, and `M` can repeat up to three times in a row:

```swift
"III".isRomanNumeral  // true
"XXX".isRomanNumeral  // true
"CCC".isRomanNumeral  // true
"MMM".isRomanNumeral  // true
```

Four repetitions are not canonical:

```swift
"IIII".isRomanNumeral // false
"XXXX".isRomanNumeral // false
"CCCC".isRomanNumeral // false
"MMMM".isRomanNumeral // false
```

`V`, `L`, and `D` do not repeat:

```swift
"VV".isRomanNumeral // false
"LL".isRomanNumeral // false
"DD".isRomanNumeral // false
```

`N` represents zero and must stand alone. `N` is valid, but `IN`, `NI`, and `NN` are invalid.

## Parse Roman Numerals

Use `StringProtocol.isRomanSymbol` to check whether a string is one recognized Roman symbol or subtractive pair.

```swift
"I".isRomanSymbol   // true
"IV".isRomanSymbol  // true
"VI".isRomanSymbol  // false
"ABC".isRomanSymbol // false
```

Use `StringProtocol.isRomanNumeral` to check whether a full string is a valid Roman numeral.

```swift
"MMXXVI".isRomanNumeral    // true
"MMMCMXCIX".isRomanNumeral // true
"IIV".isRomanNumeral       // false
"IXI".isRomanNumeral       // false
"iv".isRomanNumeral        // false
```

The parser validates symbols, order, recurrence, subtractive prefixes, and subtractive suffixes. That means a string must be built from Roman symbols, must be ordered correctly, must not repeat nonrepeatable symbols, must not repeat repeatable symbols more than three times, and must not reuse the smaller part of a subtractive pair on either side of that pair.

## Convert Between Roman and Decimal Forms

`Roman` conforms to `LosslessStringConvertible`, so it can be initialized from a Roman numeral string.

```swift
let four = Roman("IV")
let year = Roman("MMXXVI")
let invalid = Roman("IIV")

print(four)    // Optional(IV)
print(year)    // Optional(MMXXVI)
print(invalid) // nil
```

The initializer also accepts decimal strings inside the representable range.

```swift
Roman("0")    // Optional(N)
Roman("01")   // Optional(I)
Roman("3999") // Optional(MMMCMXCIX)
Roman("4000") // nil
```

When a `Roman` value is printed, it uses the canonical Roman representation.

```swift
let value: Roman = 44

print(value) // XLIV
```

## Understand the Range

This package defines the Roman range as `0...3999`.

`N` provides a representation for zero. The maximum value is `MMMCMXCIX`, or `3999`.

```swift
print(Roman.min) // N
print(Roman.max) // MMMCMXCIX
```

The upper bound keeps the type aligned with common Roman numeral notation, where thousands are represented by repeating `M` up to three times and larger values require extra notation that this package does not model.

## Use Roman as a Numeric Type

`Roman` supports arithmetic through the package's numeric protocols.

```swift
let two: Roman = 2
let three: Roman = 3
let seven: Roman = 7

print(two + three) // V
print(three - two) // I
print(two * three) // VI
print(seven / two) // III
print(seven % two) // I
print(two ** three) // VIII
```

The representation is Roman, but the arithmetic is still whole-number arithmetic. Division truncates toward zero because `Roman` cannot represent fractions.

## Handle Roman Overflow

The normal arithmetic operators expect representable results. Overflow-reporting operations let you inspect what happens near the edge of the Roman range.

```swift
let report = Roman.max.addingReportingOverflow(1)

print(report.partialValue) // N
print(report.overflow)     // true
```

For addition and multiplication, the partial value wraps inside the `0...3999` domain. For division and remainder, dividing by zero reports overflow and returns the original value as the partial value.

```swift
let report = Roman.max.dividedReportingOverflow(by: 0)

print(report.partialValue) // MMMCMXCIX
print(report.overflow)     // true
```

Exponentiation follows the same overflow-reporting idea. `0 ** 0` returns `1`, matching the package's integer-style exponentiation rules.

## Know What Roman Is Not

`Roman` is intentionally experimental. It is not a replacement for `Int`, `UInt`, or any fixed-width integer type. It does not model signed values, binary storage, bitwise operations, or fractional values.

Instead, it is a compact example of a numeric type whose rules come from a representation domain rather than from hardware integer behavior. That makes it useful for exploring how parsing, validation, arithmetic, overflow, and display can all belong to the same value type while still following Roman numeral rules.
