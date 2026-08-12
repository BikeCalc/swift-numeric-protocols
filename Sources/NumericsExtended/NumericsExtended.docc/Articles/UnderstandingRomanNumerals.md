# Understanding Roman Numerals

Learn how Roman numerals are written, why some forms are valid, and how the notation represents whole numbers.

## Overview

Roman numerals describe whole numbers with symbols instead of positional decimal digits. A decimal number such as `2026` uses place value: `2` thousands, `0` hundreds, `2` tens, and `6` ones. A Roman numeral such as `MMXXVI` is built from symbols whose values are added or subtracted according to Roman numeral rules.

The `Roman` type in Numerics Extended follows these rules for values from `0` through `3999`. This article focuses on the notation itself: the symbols, the order, the subtractive forms, and the rules that make one Roman numeral valid and another invalid.

## Learn the Symbols

The root Roman symbols are:

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

The notation also uses canonical subtractive pairs:

| Pair | Value | Meaning |
| ---: | ----: | ------- |
| `IV` | `4` | One before five. |
| `IX` | `9` | One before ten. |
| `XL` | `40` | Ten before fifty. |
| `XC` | `90` | Ten before one hundred. |
| `CD` | `400` | One hundred before five hundred. |
| `CM` | `900` | One hundred before one thousand. |

Subtractive pairs behave as single units in a canonical Roman numeral. That makes `IV` valid, while forms such as `IIV`, `VX`, and `IC` remain invalid.

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

| Roman | Valid | Reason |
| ----: | :---: | ------ |
| `III` | Yes | `I` appears three times. |
| `XXX` | Yes | `X` appears three times. |
| `CCC` | Yes | `C` appears three times. |
| `MMM` | Yes | `M` appears three times. |

Four repetitions are not canonical:

| Roman | Valid | Reason |
| ----: | :---: | ------ |
| `IIII` | No | Use `IV` instead. |
| `XXXX` | No | Use `XL` instead. |
| `CCCC` | No | Use `CD` instead. |
| `MMMM` | No | The package range stops at `3999`. |

`V`, `L`, and `D` do not repeat:

| Roman | Valid | Reason |
| ----: | :---: | ------ |
| `VV` | No | `V` is not repeatable. |
| `LL` | No | `L` is not repeatable. |
| `DD` | No | `D` is not repeatable. |

## Respect Ordering Rules

Canonical Roman numerals are written from larger values to smaller values, except for the six valid subtractive pairs.

| Roman | Valid | Reason |
| ----: | :---: | ------ |
| `XVI` | Yes | `X`, `V`, and `I` descend in value. |
| `XLIV` | Yes | `XL` and `IV` are valid subtractive pairs. |
| `VX` | No | `V` cannot subtract from `X`. |
| `IC` | No | `I` cannot subtract from `C`. |
| `IIV` | No | A subtractive pair cannot be built from repeated prefixes. |
| `IXI` | No | The smaller part of a subtractive pair cannot be reused immediately after the pair. |

These rules keep the notation canonical. They make sure a value has one expected spelling, such as `IX` for nine instead of `VIIII` or `IIV`.

## Represent Zero

Classical Roman numerals did not have a positional zero like decimal notation. Numerics Extended supports `N`, from nulla, to represent zero.

`N` must stand alone:

| Roman | Valid | Reason |
| ----: | :---: | ------ |
| `N` | Yes | `N` represents zero. |
| `IN` | No | `N` cannot be combined with other symbols. |
| `NI` | No | `N` cannot be combined with other symbols. |
| `NN` | No | `N` is not repeatable. |

This gives the `Roman` type a real zero value while keeping zero visually distinct from positive Roman numerals.

## Understand the Range

Numerics Extended defines the Roman range as `0...3999`.

The minimum value is `N`, or zero. The maximum value is `MMMCMXCIX`, or `3999`.

The upper bound keeps the type aligned with common Roman numeral notation, where thousands are represented by repeating `M` up to three times and larger values require extra notation that this package does not model.
