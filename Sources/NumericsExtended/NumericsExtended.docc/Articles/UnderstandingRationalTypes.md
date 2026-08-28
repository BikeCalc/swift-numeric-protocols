# Understanding Rational Types

Learn how rational numbers represent exact values, why the same value can have different forms, and how fractions are
simplified, normalized, and canonicalized.

## Overview

A rational number is a value that can be expressed as one integer divided by another. The upper integer is the
numerator, and the lower integer is the denominator. Together, they describe a ratio such as one half, three quarters,
or five thirds.

Fractions are useful when a ratio needs to remain exact. The value `1/3` cannot be written as a finite decimal, but it
can be stored exactly as the two terms `1` and `3`. Calculations can continue to use those terms without first rounding
the value to a decimal approximation.

The `Fraction` type also preserves the terms used to create a finite value. This means that `1/2`, `2/4`, and `50/100`
can remain distinct representations even though they describe the same rational value. This article focuses on that
model: represented values, stored terms, signs, canonical forms, and special values.

## Build a Value From Two Terms

The numerator counts parts. The denominator describes the size of those parts.

| Fraction | Numerator | Denominator | Meaning |
| -------: | --------: | ----------: | ------- |
| `1/2` | `1` | `2` | One of two equal parts. |
| `3/4` | `3` | `4` | Three of four equal parts. |
| `5/3` | `5` | `3` | Five thirds, or one and two thirds. |
| `8/4` | `8` | `4` | Eight quarters, which represent two. |

A numerator may be larger than its denominator. A fraction does not need to describe a value between zero and one.
Whole values can also be written as fractions because any integer divided by one keeps its value. For example, `3/1`
represents three.

## Separate Values From Representations

Multiplying or dividing both terms by the same nonzero integer does not change the represented value. This creates many
possible representations of one rational number.

| Representation | Rational value | Same terms as `1/2`? | Same rational value as `1/2`? |
| -------------: | -------------: | :------------------: | :--------------------------: |
| `1/2` | One half | Yes | Yes |
| `2/4` | One half | No | Yes |
| `50/100` | One half | No | Yes |
| `1/-2` | Negative one half | No | No |

`Fraction` keeps this distinction visible. Two fractions are ordinarily equal only when their stored numerators and
denominators match. A separate canonical comparison can determine whether different representations describe the same
rational value.

Preserving terms is useful when the representation carries information. The ratios `1/2` and `50/100` may be
mathematically equivalent, but the second form may better communicate a percentage or the scale of an original
measurement.

## Understand the Sign

A finite fraction is negative when exactly one of its terms is negative. It is positive when both terms have the same
sign.

| Fraction | Sign | Rational value |
| -------: | :--: | -------------- |
| `1/2` | Positive | One half |
| `-1/2` | Negative | Negative one half |
| `1/-2` | Negative | Negative one half |
| `-1/-2` | Positive | One half |

The sign can therefore appear in the numerator, the denominator, or both. These forms may represent the same value
without having the same stored terms.

## Simplify a Fraction

Simplification removes factors shared by the numerator and denominator. Both terms are divided by their greatest common
divisor, so the rational value does not change.

| Before | Common divisor | After |
| -----: | -------------: | ----: |
| `2/4` | `2` | `1/2` |
| `12/18` | `6` | `2/3` |
| `-8/12` | `4` | `-2/3` |
| `-8/-12` | `4` | `-2/-3` |

Simplification does not move a sign. The last example remains `-2/-3`, even though it represents positive two thirds.
Its terms have no remaining common factor, so it is simplified despite its negative denominator.

## Normalize a Fraction

Normalization gives the sign a consistent location. When a denominator is negative, both terms change sign so that the
denominator becomes positive.

| Before | After | Rational value |
| -----: | ----: | -------------- |
| `1/-2` | `-1/2` | Negative one half |
| `-1/-2` | `1/2` | One half |
| `2/-4` | `-2/4` | Negative one half |

Normalization does not remove common factors. The value `2/-4` becomes `-2/4`, not `-1/2`. It is normalized because
its denominator is positive, but it is not simplified.

## Canonicalize a Fraction

Canonicalization combines simplification and normalization. It first removes common factors and then moves any negative
sign to the numerator. The result is a single preferred representation of a finite rational value.

| Original | Simplified | Canonical |
| -------: | ---------: | --------: |
| `2/4` | `1/2` | `1/2` |
| `2/-4` | `1/-2` | `-1/2` |
| `-2/-4` | `-1/-2` | `1/2` |

A canonical finite fraction has no common factor greater than one and has a positive denominator. Canonicalization is
useful when one stable representation matters more than preserving the original terms. It also provides a common form
for deciding whether differently stored fractions represent the same value.

## Distinguish Positive and Negative Zero

Every finite fraction with a zero numerator represents zero, provided its denominator is not zero. The sign of the
denominator can preserve a distinction between positive and negative stored zero.

| Representation | Stored zero | Canonical form |
| -------------: | ----------- | -------------: |
| `0/1` | Positive zero | `0/1` |
| `0/10` | Positive zero with a different scale | `0/1` |
| `0/-1` | Negative zero | `0/1` |
| `0/-10` | Negative zero with a different scale | `0/1` |

Positive and negative zero describe the same rational value. Their distinct representations can still preserve the sign
of a calculation. Canonicalization removes that representational distinction and produces `0/1`.

## Extend Fractions With Nonfinite Values

In the ordinary definition of a rational number, the denominator cannot be zero. `Fraction` extends that model so that
division by zero can produce infinity or an indeterminate value instead of requiring a finite ratio.

| Representation | Classification | Meaning |
| -------------: | -------------- | ------- |
| `1/0` | Positive infinity | A positive nonzero value divided by zero. |
| `-1/0` | Negative infinity | A negative nonzero value divided by zero. |
| `0/0` | NaN | An indeterminate value, read as “not a number.” |

Every positive nonzero numerator over zero is stored as `1/0`, and every negative numerator over zero is stored as
`-1/0`. Unlike finite values, infinities therefore use a single representation for each sign. The value `0/0` remains
distinct because zero divided by zero has no determined result.

Positive infinity is greater than every finite value, and negative infinity is less than every finite value. NaN is
unordered: comparisons involving it do not establish that either value is less than, equal to, or greater than the
other. NaN is also not equal to itself.

## Classify Finite Fractions

Several familiar categories describe the shape or value of a finite fraction.

| Category | Description | Examples |
| -------- | ----------- | -------- |
| Whole | A nonnegative value with no fractional remainder. | `0/3`, `4/2`, `8/4` |
| Proper | A nonzero value whose magnitude is less than one. | `1/2`, `-2/3` |
| Improper | A value whose magnitude is at least one. | `3/2`, `-5/4`, `2/2` |
| Unit | A stored numerator of one with a positive denominator. | `1/2`, `1/5` |
| Like | Two stored fractions with the same denominator. | `1/4` and `3/4` |

Some categories describe the represented value, while others describe the stored form. For example, `-1/-2`
represents a positive unit fraction, but it does not have the stored form of a unit fraction until it is normalized to
`1/2`. Similarly, `1/2` and `2/4` are equivalent, but they are not like fractions because their stored denominators are
different.

Zero is neither proper nor improper. Infinity and NaN are nonfinite, so the finite classifications do not apply to
them.
