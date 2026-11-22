# Bitwise Calculation — W

**Branch:** `feature/calculate-w`  
**Status:** Pending implementation.

## Responsibility

Implement the bitwise expression:

```text
W = (x | z) & (x ^ 15)
```

- Read `x` from `$s0` and `z` from `$s2`.
- Apply bitwise OR (`or`), XOR (`xor` / `xori`), and AND (`and`).
- Store the final result in `$s4`.
- Provide a callable `calculate_w` routine returning via `jr $ra`.
- Verify results in MARS for positive, zero, and negative integers.

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

Do not overwrite the input registers or define a second `main` entry point in the final integrated program. Output printing is handled by the input/output module.

## Definition of done

Code reviewed, test cases verified in MARS, and ready for a pull request into `main`.
