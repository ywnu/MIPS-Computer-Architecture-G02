# CNE401 - Computer Architecture & Organization
# Group 02 - Input and Output Module
# MARS MIPS Assembly
#
# Shared register contract:
#   $s0 = x, $s1 = y, $s2 = z
#   $s3 = f (calculated by feature/calculate-f)
#   $s4 = W (calculated by feature/calculate-w)
#
# This branch is an independently runnable I/O test.
# Integration: replace the 'j program_exit' line in main with:
#   jal calculate_f
#   jal calculate_w
#   jal print_results
#   j program_exit
# The calculation modules must preserve $s0-$s2 and return via jr $ra.

.data
prompt_x: .asciiz "Enter x: "
prompt_y: .asciiz "Enter y: "
prompt_z: .asciiz "Enter z: "
input_ok: .asciiz "\nInputs received successfully.\n"
label_x:  .asciiz "x = "
label_y:  .asciiz "y = "
label_z:  .asciiz "z = "
label_f:  .asciiz "f = "
label_w:  .asciiz "W = "
newline:  .asciiz "\n"

.text
.globl main
main:
    # Read integer x into $s0.
    li $v0, 4
    la $a0, prompt_x
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    # Read integer y into $s1.
    li $v0, 4
    la $a0, prompt_y
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    # Read integer z into $s2.
    li $v0, 4
    la $a0, prompt_z
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    # I/O-only test: confirm that all three inputs were saved.
    li $v0, 4
    la $a0, input_ok
    syscall

    li $v0, 4
    la $a0, label_x
    syscall
    move $a0, $s0
    li $v0, 1
    syscall
    jal print_newline

    li $v0, 4
    la $a0, label_y
    syscall
    move $a0, $s1
    li $v0, 1
    syscall
    jal print_newline

    li $v0, 4
    la $a0, label_z
    syscall
    move $a0, $s2
    li $v0, 1
    syscall
    jal print_newline

    # Calculation modules will be called here after integration.
    j program_exit

# Print calculated f and W after the calculation modules set $s3/$s4.
print_results:
    li $v0, 4
    la $a0, label_f
    syscall
    move $a0, $s3
    li $v0, 1
    syscall
    # Save return address because print_newline uses jal.
    addiu $sp, $sp, -4
    sw $ra, 0($sp)
    jal print_newline

    li $v0, 4
    la $a0, label_w
    syscall
    move $a0, $s4
    li $v0, 1
    syscall
    jal print_newline
    lw $ra, 0($sp)
    addiu $sp, $sp, 4
    jr $ra

print_newline:
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

program_exit:
    li $v0, 10
    syscall
