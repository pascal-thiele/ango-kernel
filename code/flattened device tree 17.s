.align 4


# in
# a0 flattened device tree 17 address
# out
# a0 status
.label flattened_device_tree_17_local
addi sp sp -48
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
sd s2 sp 24
sd s3 sp 32
sd s4 sp 40

# check magic
addi s0 a0 0
call ra flattened_device_tree_17_load_word
li t0 3490578157
bne a0 t0 flattened_device_tree_17_local_failure
# check version
addi a0 s0 20
call ra flattened_device_tree_17_load_word
addi t0 zero 17
bne a0 t0 flattened_device_tree_17_local_failure

# get structure block address
addi a0 s0 8
call ra flattened_device_tree_17_load_word
add s1 s0 a0
# get strings block address
addi a0 s0 12
call ra flattened_device_tree_17_load_word
add s0 s0 a0

# enter root node
addi a0 s1 0
call ra flattened_device_tree_17_seek_node
bne a0 zero flattened_device_tree_17_local_failure
addi a0 a1 0
call ra flattened_device_tree_17_enter_node
addi s1 a0 0

# enter cpus node
call ra flattened_device_tree_17_seek_node_cpus
bne a0 zero flattened_device_tree_17_local_failure
addi a0 s1 0
call ra flattened_device_tree_17_enter_node
addi s2 a0 0

# load cpus address cells
addi a1 s0 0
call ra flattened_device_tree_17_seek_property_address_cells
bne a0 zero flattened_device_tree_17_local_default_cpus_address_cells
addi a0 a1 12
call ra flattened_device_tree_17_load_word
addi s3 a0 0
jal zero flattened_device_tree_17_local_seek_cpus_cpu
.label flattened_device_tree_17_local_default_cpus_address_cells
addi s3 zero 2

.label flattened_device_tree_17_local_seek_cpus_cpu
addi a0 s2 0
call ra flattened_device_tree_17_seek_node_cpu
bne a0 zero flattened_device_tree_17_local_failure
# compare reg with hardware thread identifier
addi s2 a1 0
addi a0 a1 0
call ra flattened_device_tree_17_enter_node
addi a1 s0 0
call ra flattened_device_tree_17_seek_property_reg
bne a0 zero flattened_device_tree_17_local_next_cpus_cpu
addi a0 a1 12
addi a1 s3 0
call ra flattened_device_tree_17_load_cells
csrrs t0 zero mhartid
beq t0 a0 flattened_device_tree_17_local_seek_cpus_cpu_interrupt_controller
.label flattened_device_tree_17_local_next_cpus_cpu
addi a0 s2 0
call ra flattened_device_tree_17_jump_node
bne a0 zero flattened_device_tree_17_local_failure
addi s2 a1 0
jal zero flattened_device_tree_17_local_seek_cpus_cpu

.label flattened_device_tree_17_local_seek_cpus_cpu_interrupt_controller
addi a0 s2 0
call ra flattened_device_tree_17_enter_node
addi a1 s0 0
call ra flattened_device_tree_17_seek_node_interrupt_controller
bne a0 zero flattened_device_tree_17_local_failure
# load phandle
addi a0 a1 0
call ra flattened_device_tree_17_enter_node
addi s2 a0 0
addi a1 s0 0
call ra flattened_device_tree_17_seek_property_phandle
beq a0 zero flattened_device_tree_17_local_load_phandle
addi a0 s2 0
addi a1 s0 0
call ra flattened_device_tree_17_seek_property_linux_phandle
bne a0 zero flattened_device_tree_17_local_failure
.label flattened_device_tree_17_local_load_phandle
addi a0 a1 12
call ra flattened_device_tree_17_load_word
addi s2 a0 0

# continue here
# to do for each hardware thread
# msip address
# mtimecmp address
# external interrupt enables address
# external interrupt claim/complete address

# at hardware thread initialization
# clear interrupt enables
# clear priority threshold

# success
addi a0 zero 0
jal zero flattened_device_tree_17_local_return
.label flattened_device_tree_17_local_failure
addi a0 zero 1
.label flattened_device_tree_17_local_return
ld s4 sp 40
ld s3 sp 32
ld s2 sp 24
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 48
jalr zero ra 0


# in
# a0 flattened device tree 17 address
# out
# a0 status
.label flattened_device_tree_17_global
addi sp sp -64
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
sd s2 sp 24
sd s3 sp 32
sd s4 sp 40
sd s5 sp 48
sd s6 sp 56

# get structure block address
addi s0 a0 0
addi a0 a0 8
call ra flattened_device_tree_17_load_word
add s1 s0 a0
# get strings block address
addi a0 s0 12
call ra flattened_device_tree_17_load_word
add s2 s0 a0
# get memory reservation block address
addi a0 s0 16
call ra flattened_device_tree_17_load_word
add s0 s0 a0

# enter root node
addi a0 s1 0
call ra flattened_device_tree_17_seek_node
bne a0 zero flattened_device_tree_17_global_failure
addi a0 a1 0
call ra flattened_device_tree_17_enter_node
addi s1 a0 0

# extract timebase frequency
addi a1 s2 0
call ra flattened_device_tree_17_seek_property_address_cells
bne a0 zero flattened_device_tree_17_global_default_address_cells
addi a0 a1 12
call ra flattened_device_tree_17_load_word
addi s3 a0 0
jal zero flattened_device_tree_17_global_seek_cpus
.label flattened_device_tree_17_global_default_address_cells
addi s3 zero 2
.label flattened_device_tree_17_global_seek_cpus
addi a0 s1 0
call ra flattened_device_tree_17_seek_node_cpus
bne a0 zero flattened_device_tree_17_global_failure
addi a0 a1 0
call ra flattened_device_tree_17_enter_node
addi a1 s2 0
call ra flattened_device_tree_17_seek_property_timebase_frequency
bne a0 zero flattened_device_tree_17_global_failure
addi a0 a1 12
addi a1 s3 0
call ra flattened_device_tree_17_load_cells
# validate timebase frequency
addi t0 zero 10
bltu a0 t0 flattened_device_tree_17_global_failure
# define thread quantum
divu t0 a0 t0
sd t0 thread_quantum t1

# extract memory
# to do
# remove reserved memory
# to do
# load the first user program from permanent storage
# to do

.label flattened_device_tree_17_global_failure
addi a0 zero 1
.label flattened_device_tree_17_global_return
ld s6 sp 56
ld s5 sp 48
ld s4 sp 40
ld s3 sp 32
ld s2 sp 24
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 64
jalr zero ra 0


# in
# a0 start address
# out
# a0 status
# a1 node address
.label flattened_device_tree_17_seek_node_cpu
addi sp sp -8
sd ra sp 0
call ra flattened_device_tree_17_seek_node
bne a0 zero flattened_device_tree_17_seek_node_cpu_failure
.label flattened_device_tree_17_seek_node_cpu_compare
lbu t0 a1 4
addi t1 zero 99
bne t0 t1 flattened_device_tree_17_seek_node_cpu_next
lbu t0 a1 5
addi t1 zero 112
bne t0 t1 flattened_device_tree_17_seek_node_cpu_next
lbu t0 a1 6
addi t1 zero 117
bne t0 t1 flattened_device_tree_17_seek_node_cpu_next
lbu t0 a1 7
beq t0 zero flattened_device_tree_17_seek_node_cpu_success
addi t1 zero 64
bne t0 t1 flattened_device_tree_17_seek_node_cpu_next
.label flattened_device_tree_17_seek_node_cpu_success
lui a0 0
jal zero flattened_device_tree_17_seek_node_cpu_return
.label flattened_device_tree_17_seek_node_cpu_next
addi a0 a1 0
call ra flattened_device_tree_17_jump_node
bne a0 zero flattened_device_tree_17_seek_node_cpu_failure
addi a0 a1 0
call ra flattened_device_tree_17_seek_node
beq a0 zero flattened_device_tree_17_seek_node_cpu_compare
.label flattened_device_tree_17_seek_node_cpu_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_node_cpu_return
ld ra sp 0
addi sp sp 8
jalr zero ra 0


# in
# a0 start address
# out
# a0 status
# a1 node address
.label flattened_device_tree_17_seek_node_cpus
addi sp sp -8
sd ra sp 0
call ra flattened_device_tree_17_seek_node
bne a0 zero flattened_device_tree_17_seek_node_cpus_failure
.label flattened_device_tree_17_seek_node_cpus_compare
lbu t0 a1 4
addi t1 zero 99
bne t0 t1 flattened_device_tree_17_seek_node_cpus_next
lbu t0 a1 5
addi t1 zero 112
bne t0 t1 flattened_device_tree_17_seek_node_cpus_next
lbu t0 a1 6
addi t1 zero 117
bne t0 t1 flattened_device_tree_17_seek_node_cpus_next
lbu t0 a1 7
addi t1 zero 115
bne t0 t1 flattened_device_tree_17_seek_node_cpus_next
lbu t0 a1 8
bne t0 zero flattened_device_tree_17_seek_node_cpus_next
lui a0 0
jal zero flattened_device_tree_17_seek_node_cpus_return
.label flattened_device_tree_17_seek_node_cpus_next
addi a0 a1 0
call ra flattened_device_tree_17_jump_node
bne a0 zero flattened_device_tree_17_seek_node_cpus_failure
addi a0 a1 0
call ra flattened_device_tree_17_seek_node
beq a0 zero flattened_device_tree_17_seek_node_cpus_compare
.label flattened_device_tree_17_seek_node_cpus_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_node_cpus_return
ld ra sp 0
addi sp sp 8
jalr zero ra 0


# in
# a0 start address
# out
# a0 status
# a1 node address
.label flattened_device_tree_17_seek_node_interrupt_controller
addi sp sp -8
sd ra sp 0
call ra flattened_device_tree_17_seek_node
bne a0 zero flattened_device_tree_17_seek_node_interrupt_controller_failure
.label flattened_device_tree_17_seek_node_interrupt_controller_compare
lbu t0 a1 4
addi t1 zero 105
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 5
addi t1 zero 110
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 6
addi t1 zero 116
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 7
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 8
addi t1 zero 114
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 9
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 10
addi t1 zero 117
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 11
addi t1 zero 112
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 12
addi t1 zero 116
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 13
addi t1 zero 45
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 14
addi t1 zero 99
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 15
addi t1 zero 111
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 16
addi t1 zero 110
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 17
addi t1 zero 116
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 18
addi t1 zero 114
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 19
addi t1 zero 111
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 20
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 21
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 22
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 23
addi t1 zero 114
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
lbu t0 a1 24
beq t0 zero flattened_device_tree_17_seek_node_interrupt_controller_success
addi t1 zero 64
bne t0 t1 flattened_device_tree_17_seek_node_interrupt_controller_next
.label flattened_device_tree_17_seek_node_interrupt_controller_success
lui a0 0
jal zero flattened_device_tree_17_seek_node_interrupt_controller_return
.label flattened_device_tree_17_seek_node_interrupt_controller_next
addi a0 a1 0
call ra flattened_device_tree_17_jump_node
bne a0 zero flattened_device_tree_17_seek_node_interrupt_controller_failure
addi a0 a1 0
call ra flattened_device_tree_17_seek_node
beq a0 zero flattened_device_tree_17_seek_node_interrupt_controller_compare
.label flattened_device_tree_17_seek_node_interrupt_controller_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_node_interrupt_controller_return
ld ra sp 0
addi sp sp 8
jalr zero ra 0


# in
# a0 start address
# out
# a0 status
# a1 node address
.label flattened_device_tree_17_seek_node
addi sp sp -16
sd ra sp 0
sd s0 sp 8
addi s0 a0 0
.label flattened_device_tree_17_seek_node_token
call ra flattened_device_tree_17_load_word
# begin node
addi t0 zero 1
bne a0 t0 flattened_device_tree_17_seek_node_token_property
lui a0 0
addi a1 s0 0
jal zero flattened_device_tree_17_seek_node_return
.label flattened_device_tree_17_seek_node_token_property
addi t0 zero 3
bne a0 t0 flattened_device_tree_17_seek_node_token_nop
addi a0 s0 0
call ra flattened_device_tree_17_jump_property
addi s0 a0 0
jal zero flattened_device_tree_17_seek_node_token
.label flattened_device_tree_17_seek_node_token_nop
addi t0 zero 4
bne a0 t0 flattened_device_tree_17_seek_node_failure
addi s0 s0 4
addi a0 s0 0
jal zero flattened_device_tree_17_seek_node_token
.label flattened_device_tree_17_seek_node_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_node_return
ld s0 sp 8
ld ra sp 0
addi sp sp 16
jalr zero ra 0


# in
# a0 start address
# a1 strings block address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property_address_cells
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 a1 0
call ra flattened_device_tree_17_seek_property
bne a0 zero flattened_device_tree_17_seek_property_address_cells_failure
.label flattened_device_tree_17_seek_property_address_cells_compare
addi s1 a1 0
addi a0 a1 8
call ra flattened_device_tree_17_load_word
add a0 a0 s0
lbu t0 a0 0
addi t1 zero 35
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 1
addi t1 zero 97
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 2
addi t1 zero 100
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 3
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 4
addi t1 zero 114
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 5
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 6
addi t1 zero 115
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 7
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 8
addi t1 zero 45
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 9
addi t1 zero 99
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 10
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 11
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 12
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 13
addi t1 zero 115
bne t0 t1 flattened_device_tree_17_seek_property_address_cells_next
lbu t0 a0 14
bne t0 zero flattened_device_tree_17_seek_property_address_cells_next
lui a0 0
addi a1 s1 0
jal zero flattened_device_tree_17_seek_property_address_cells_return
.label flattened_device_tree_17_seek_property_address_cells_next
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
call ra flattened_device_tree_17_seek_property
beq a0 zero flattened_device_tree_17_seek_property_address_cells_compare
.label flattened_device_tree_17_seek_property_address_cells_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_address_cells_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 start address
# a1 strings block address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property_size_cells
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 a1 0
call ra flattened_device_tree_17_seek_property
bne a0 zero flattened_device_tree_17_seek_property_size_cells_failure
.label flattened_device_tree_17_seek_property_size_cells_compare
addi s1 a1 0
addi a0 a1 8
call ra flattened_device_tree_17_load_word
add a0 a0 s0
lbu t0 a0 0
addi t1 zero 35
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 1
addi t1 zero 115
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 2
addi t1 zero 105
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 3
addi t1 zero 122
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 4
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 5
addi t1 zero 45
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 6
addi t1 zero 99
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 7
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 8
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 9
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 10
addi t1 zero 115
bne t0 t1 flattened_device_tree_17_seek_property_size_cells_next
lbu t0 a0 11
bne t0 zero flattened_device_tree_17_seek_property_size_cells_next
lui a0 0
addi a1 s1 0
jal zero flattened_device_tree_17_seek_property_size_cells_return
.label flattened_device_tree_17_seek_property_size_cells_next
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
call ra flattened_device_tree_17_seek_property
beq a0 zero flattened_device_tree_17_seek_property_size_cells_compare
.label flattened_device_tree_17_seek_property_size_cells_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_size_cells_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 start address
# a1 strings block address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property_phandle
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 a1 0
call ra flattened_device_tree_17_seek_property
bne a0 zero flattened_device_tree_17_seek_property_phandle_failure
.label flattened_device_tree_17_seek_property_phandle_compare
addi s1 a1 0
addi a0 a1 8
call ra flattened_device_tree_17_load_word
add a0 a0 s0
lbu t0 a0 0
addi t1 zero 112
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 1
addi t1 zero 104
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 2
addi t1 zero 97
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 3
addi t1 zero 110
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 4
addi t1 zero 100
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 5
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 6
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_phandle_next
lbu t0 a0 7
bne t0 zero flattened_device_tree_17_seek_property_phandle_next
lui a0 0
addi a1 s1 0
jal zero flattened_device_tree_17_seek_property_phandle_return
.label flattened_device_tree_17_seek_property_phandle_next
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
call ra flattened_device_tree_17_seek_property
beq a0 zero flattened_device_tree_17_seek_property_phandle_compare
.label flattened_device_tree_17_seek_property_phandle_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_phandle_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 start address
# a1 strings block address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property_linux_phandle
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 a1 0
call ra flattened_device_tree_17_seek_property
bne a0 zero flattened_device_tree_17_seek_property_linux_phandle_failure
.label flattened_device_tree_17_seek_property_linux_phandle_compare
addi s1 a1 0
addi a0 a1 8
call ra flattened_device_tree_17_load_word
add a0 a0 s0
lbu t0 a0 0
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 1
addi t1 zero 105
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 2
addi t1 zero 110
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 3
addi t1 zero 117
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 4
addi t1 zero 120
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 5
addi t1 zero 44
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 6
addi t1 zero 112
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 7
addi t1 zero 104
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 8
addi t1 zero 97
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 9
addi t1 zero 110
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 10
addi t1 zero 100
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 11
addi t1 zero 108
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 12
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_linux_phandle_next
lbu t0 a0 13
bne t0 zero flattened_device_tree_17_seek_property_linux_phandle_next
lui a0 0
addi a1 s1 0
jal zero flattened_device_tree_17_seek_property_linux_phandle_return
.label flattened_device_tree_17_seek_property_linux_phandle_next
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
call ra flattened_device_tree_17_seek_property
beq a0 zero flattened_device_tree_17_seek_property_linux_phandle_compare
.label flattened_device_tree_17_seek_property_linux_phandle_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_linux_phandle_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 start address
# a1 strings block address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property_reg
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 a1 0
call ra flattened_device_tree_17_seek_property
bne a0 zero flattened_device_tree_17_seek_property_reg_failure
.label flattened_device_tree_17_seek_property_reg_compare
addi s1 a1 0
addi a0 a1 8
call ra flattened_device_tree_17_load_word
add a0 a0 s0
lbu t0 a0 0
addi t1 zero 114
bne t0 t1 flattened_device_tree_17_seek_property_reg_next
lbu t0 a0 1
addi t1 zero 101
bne t0 t1 flattened_device_tree_17_seek_property_reg_next
lbu t0 a0 2
addi t1 zero 103
bne t0 t1 flattened_device_tree_17_seek_property_reg_next
lbu t0 a0 3
bne t0 zero flattened_device_tree_17_seek_property_reg_next
lui a0 0
addi a1 s1 0
jal zero flattened_device_tree_17_seek_property_reg_return
.label flattened_device_tree_17_seek_property_reg_next
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
call ra flattened_device_tree_17_seek_property
beq a0 zero flattened_device_tree_17_seek_property_reg_compare
.label flattened_device_tree_17_seek_property_reg_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_reg_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 start address
# out
# a0 status
# a1 property address
.label flattened_device_tree_17_seek_property
addi sp sp -16
sd ra sp 0
sd s0 sp 8
addi s0 a0 0
.label flattened_device_tree_17_seek_property_token
call ra flattened_device_tree_17_load_word
# begin node
addi t0 zero 1
bne a0 t0 flattened_device_tree_17_seek_property_token_property
addi a0 s0 0
call ra flattened_device_tree_17_jump_node
bne a0 zero flattened_device_tree_17_seek_property_failure
addi s0 a0 0
jal zero flattened_device_tree_17_seek_property_token
.label flattened_device_tree_17_seek_property_token_property
addi t0 zero 3
bne a0 t0 flattened_device_tree_17_seek_property_token_nop
lui a0 0
addi a1 s0 0
jal zero flattened_device_tree_17_seek_property_return
.label flattened_device_tree_17_seek_property_token_nop
addi t0 zero 4
bne a0 t0 flattened_device_tree_17_seek_property_failure
addi s0 s0 4
addi a0 s0 0
jal zero flattened_device_tree_17_seek_property_token
.label flattened_device_tree_17_seek_property_failure
addi a0 zero 1
.label flattened_device_tree_17_seek_property_return
ld s0 sp 8
ld ra sp 0
addi sp sp 16
jalr zero ra 0


# in
# a0 node address
# out
# a0 status
# a1 first address after the node
.label flattened_device_tree_17_jump_node
addi sp sp -24
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
addi s0 zero 1 # node depth
call ra flattened_device_tree_17_enter_node
addi s1 a0 0
call ra flattened_device_tree_17_load_word

.label flattened_device_tree_17_jump_node_begin_node
addi t0 zero 1
bne a0 t0 flattened_device_tree_17_jump_node_end_node
addi s0 s0 1
addi a0 s1 0
call ra flattened_device_tree_17_enter_node
addi s1 a0 0
call ra flattened_device_tree_17_load_word
jal zero flattened_device_tree_17_jump_node_begin_node

.label flattened_device_tree_17_jump_node_end_node
addi t0 zero 2
bne a0 t0 flattened_device_tree_17_jump_node_property
addi s0 s0 -1
addi s1 s1 4
beq s0 zero flattened_device_tree_17_jump_node_success
addi a0 s1 0
call ra flattened_device_tree_17_load_word
jal zero flattened_device_tree_17_jump_node_begin_node

.label flattened_device_tree_17_jump_node_property
addi t0 zero 3
bne a0 t0 flattened_device_tree_17_jump_node_nop
addi a0 s1 0
call ra flattened_device_tree_17_jump_property
addi s1 a0 0
call ra flattened_device_tree_17_load_word
jal zero flattened_device_tree_17_jump_node_begin_node

.label flattened_device_tree_17_jump_node_nop
addi t0 zero 4
bne a0 t0 flattened_device_tree_17_jump_node_failure
addi s1 s1 4
addi a0 s1 0
call ra flattened_device_tree_17_load_word
jal zero flattened_device_tree_17_jump_node_begin_node

.label flattened_device_tree_17_jump_node_failure
addi a0 zero 1
jal zero flattened_device_tree_17_jump_node_return
.label flattened_device_tree_17_jump_node_success
lui a0 0
addi a1 s1 0
.label flattened_device_tree_17_jump_node_return
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 24
jalr zero ra 0


# in
# a0 property address
# out
# a0 first address after the property
.label flattened_device_tree_17_jump_property
addi sp sp -16
sd ra sp 0
sd s0 sp 8
addi s0 a0 0
addi a0 a0 4
call ra flattened_device_tree_17_load_word
addi a0 a0 12
andi t0 a0 3
beq t0 zero flattened_device_tree_17_jump_property_increment
xor a0 a0 t0
addi a0 a0 4
.label flattened_device_tree_17_jump_property_increment
add a0 a0 s0
ld s0 sp 8
ld ra sp 0
addi sp sp 16
jalr zero ra 0


# in
# a0 node address
# out
# a0 first address after the begin node
.label flattened_device_tree_17_enter_node
addi a0 a0 4
.label flattened_device_tree_17_enter_node_seek_null
lbu t0 a0 0
addi a0 a0 1
bne t0 zero flattened_device_tree_17_enter_node_seek_null
.label flattened_device_tree_17_enter_node_align
andi t0 a0 3
xor a0 a0 t0
addi a0 a0 4
jalr zero ra 0


# in
# a0 address
# a1 cells
# out
# a0 value
.label flattened_device_tree_17_load_cells
addi sp sp -8
sd ra sp 0
addi t0 zero 1
bne a1 t0 flattened_device_tree_17_load_cells_two
call ra flattened_device_tree_17_load_word
jal zero flattened_device_tree_17_load_cells_return
.label flattened_device_tree_17_load_cells_two
call ra flattened_device_tree_17_load_doubleword
.label flattened_device_tree_17_load_cells_return
ld ra sp 0
addi sp sp 8
jalr zero ra 0


# in
# a0 address
# out
# a0 word
.label flattened_device_tree_17_load_word
lbu t0 a0 0
lbu t1 a0 1
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 2
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 3
slli t0 t0 8
add t0 t0 t1
addi a0 t0 0
jalr zero ra 0


# in
# a0 address
# out
# a0 doubleword
.label flattened_device_tree_17_load_doubleword
lbu t0 a0 0
lbu t1 a0 1
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 2
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 3
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 4
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 5
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 6
slli t0 t0 8
add t0 t0 t1
lbu t1 a0 7
slli t0 t0 8
add t0 t0 t1
addi a0 t0 0
jalr zero ra 0