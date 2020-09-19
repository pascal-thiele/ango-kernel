# hardware thread byte layout
# 0 break thread execution flag
# 1 -
# 2 thread identifier
# 4 extensions
# 8 mvendorid
# 16 marchid
# 24 mimpid
# 32 mhartid
# 40 msip address
# 48 mtimecmp address
# 56 external interrupt address
# 64 external interrupt claim/complete address
# 72 scratch space
# 320 stack
# 832

.align 4


# does not utilize the stack
# out
# a0 status
.label hardware_thread_register
lbu t0 hardware_thread_table_size
addi t1 zero 255
beq t0 t1 hardware_thread_register_failure
addi t0 t0 1
sb t0 hardware_thread_table_size t1
# calculate the address of the first unused element
addi t1 zero 832
mul t0 t0 t1
li t1 hardware_thread_table
add t0 t0 t1
csrrw zero t0 mscratch
addi sp t0 824
# write element
csrrs t1 zero misa
sw t1 t0 4
csrrs t1 zero mvendorid
sd t1 t0 8
csrrs t1 zero marchid
sd t1 t0 16
csrrs t1 zero mimpid
sd t1 t0 24
csrrs t1 zero mhartid
sd t1 t0 32
# success
lui a0 0
jalr zero ra 0
.label hardware_thread_register_failure
addi a0 zero 1
jalr zero ra 0


.label hardware_thread_table_size
.byte 0

.align 8
.label hardware_thread_table
.zero 212992