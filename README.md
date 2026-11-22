# MIPS Computer Architecture — Group 02

**Course:** CNE 401 — Computer Architecture & Organization  
**University:** Shaqra University  
**Implementation:** MIPS Assembly (MARS simulator)  
**Team:** Four students (names and GitHub accounts to be added)

## Project overview

Develop a MIPS assembly program that reads three integers (`x`, `y`, `z`), computes and prints two results, and completes a separate MIPS instruction classification and binary-encoding task.

### Required calculations

- `f = ((x * y + 5) / (2 * z)) - (z / x)` using integer arithmetic.
- `W = (x | z) & (x ^ 15)` using bitwise OR, XOR, and AND.

The implementation must handle division by zero safely. Integer division semantics and intermediate arithmetic should be checked against the assignment and MARS behavior.

### Instruction classification

Classify the instructions specified in the assignment as R-Type, I-Type, or J-Type, and represent their binary fields (opcode, registers, shamt, funct, immediate, or target as applicable). The specific instruction list must be confirmed from the original assignment before completing this section.

## Branches and responsibilities

| Branch | Scope | Status |
|---|---|---|
| [`feature/input-output`](../../tree/feature/input-output) | Read `x`, `y`, `z`; print input checks and calculated outputs | I/O module committed; MARS test pending |
| [`feature/calculate-f`](../../tree/feature/calculate-f) | Implement integer arithmetic for `f` and guard division by zero | Pending |
| [`feature/calculate-w`](../../tree/feature/calculate-w) | Implement bitwise expression for `W` | Pending |
| [`feature/instruction-encoding`](../../tree/feature/instruction-encoding) | Instruction type classification and binary encoding | Pending instruction list |

`main` is the integration and final-submission branch. Do not commit incomplete feature work directly to `main`.

## Shared register convention

| Register | Purpose |
|---|---|
| `$s0` | Input `x` |
| `$s1` | Input `y` |
| `$s2` | Input `z` |
| `$s3` | Calculated `f` |
| `$s4` | Calculated `W` |

Calculation modules should preserve the input registers and return with `jr $ra`. Coordinate temporary-register use before integration.

## Workflow

1. Work in your assigned feature branch.
2. Keep changes focused and use descriptive commit messages.
3. Open a pull request into `main` when your part is ready.
4. Review interfaces and test the combined assembly in MARS before merging/finalizing.
5. Record final test inputs and outputs.

## Run in MARS

1. Open the integrated `main.asm` file in MARS.
2. Select **Assemble**, then **Run**.
3. Enter three integer values when prompted.
4. Check both calculated outputs and edge cases, including zero denominators.

**Current state:** The standalone input/output module is available on its feature branch. The complete integrated program is not ready yet.

## Submission

- One `.asm` file containing the complete working program.
- One `.jpg` screenshot of the MARS console showing test inputs and outputs.

**Due:** Weeks 14–15 (per assignment sheet).

## Team

Names, GitHub usernames, and individual ownership will be added after the team confirms them.

## Repository visibility

This repository is temporarily public for collaboration. Review access and change visibility to **Private** after the project is completed, as requested by the team.
