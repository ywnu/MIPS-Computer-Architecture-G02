# Arithmetic Calculation — f

**Branch:** `feature/calculate-f`  
**Status:** Pending implementation.

## Responsibility

Implement the integer expression:

```text
f = ((x * y + 5) / (2 * z)) - (z / x)
```

- Read inputs from `$s0` (`x`), `$s1` (`y`), and `$s2` (`z`).
- Use suitable MIPS multiplication and division instructions (consult MARS help for supported pseudo-instructions such as `mulu` and `divu`).
- Guard against division by zero (`x = 0` or `z = 0`).
- Store the final result in `$s3`.
- Implement a callable `calculate_f` routine that returns with `jr $ra` on valid inputs.
- Document integer division behavior and test typical and edge cases.

## Shared register convention

| Register | Purpose |
|---|---|
| `$s0` | Input `x` |
| `$s1` | Input `y` |
| `$s2` | Input `z` |
| `$s3` | Calculated `f` |
| `$s4` | Calculated `W` |

Calculation modules should preserve the input registers and return with `jr $ra`. Coordinate temporary-register use before integration.

## Integration

Do not create a competing `main` entry point in the final integrated file. Coordinate how invalid input is reported and how calculation is skipped when a denominator is zero.

## Definition of done

Code reviewed, test cases verified in MARS, and ready for a pull request into `main`.
