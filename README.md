# Input & Output Module — Group 02

**Branch:** `feature/input-output`  
**File:** `main.asm`  
**Status:** Implemented and committed; local MARS execution not yet verified.

## Responsibility

- Prompt for three integers: `x`, `y`, and `z`.
- Read each input with MIPS syscall `5` and store it in a saved register.
- Print input values for standalone testing using syscalls `4` (strings) and `1` (integers).
- Provide a `print_results` routine to print calculated `f` and `W` after integration.
- Exit using syscall `10`.

## Shared register convention

| Register | Purpose |
|---|---|
| `$s0` | Input `x` |
| `$s1` | Input `y` |
| `$s2` | Input `z` |
| `$s3` | Calculated `f` |
| `$s4` | Calculated `W` |

Calculation modules should preserve the input registers and return with `jr $ra`. Coordinate temporary-register use before integration.

## Integration contract

The current `main.asm` runs as an **I/O-only test**: it reads and echoes inputs. It intentionally does **not** compute or print `f` and `W` yet. The calculation branches must implement routines `calculate_f` and `calculate_w`, storing their results in `$s3` and `$s4` respectively. At integration, call those routines, then `print_results`, before program exit. Only the integrated version should be used for the final screenshot.

## Manual test in MARS

1. Open `main.asm` from this branch.
2. Assemble and Run.
3. Enter `4`, `6`, and `2` when prompted.
4. Verify the echoed values are `x = 4`, `y = 6`, and `z = 2`.
5. Repeat with negative and zero inputs to verify input handling (calculation-specific zero checks are a separate task).

**Test status:** Awaiting a real MARS console run and screenshot.
