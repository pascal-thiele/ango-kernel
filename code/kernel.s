# in
# a1 flatted device tree address
.label kernel_start
addi s0 a1 0

# check if extensions aimsu are supported
csrrs t0 zero misa
lui t1 321
addi t1 t1 257
and t0 t0 t1
bne t0 t1 idle

# check for page-based 39-bit virtual addressing
lui t0 8
slli t0 t0 48
csrrw zero t0 satp
csrrs t1 zero satp
bne t0 t1 idle

# initialize control and status registers
li t0 21483094203
csrrc zero t0 mstatus
li t0 85899352320
csrrs zero t0 mstatus
li t0 exception_handler
csrrw zero t0 mtvec
csrrw zero zero medeleg
csrrw zero zero mideleg
addi t0 zero 819
csrrc zero t0 mie
addi t0 zero -1
csrrw zero t0 mcounteren
csrrw zero t0 scounteren
addi t0 zero -8
csrrw zero t0 mcountinhibit
csrrw zero zero mcycle
csrrw zero zero minstret
csrrw zero zero pmpcfg0
csrrw zero zero pmpcfg2

# register the hardware thread
li s1 kernel_semaphore
addi t0 zero 1
.label register_hardware_thread_lock
amoswapw t1 s1 t0
bne t1 zero register_hardware_thread_lock
call ra hardware_thread_register
beq a0 zero read_flattened_device_tree_17
fence rw rw
sw zero s1 0
jal zero idle

.label read_flattened_device_tree_17
addi a0 s0 0
call ra flattened_device_tree_17_local
bne a0 zero idle
lbu t0 hardware_thread_table_size
addi t1 zero 1
bne t0 t1 load_payload
addi a0 s0 0
call ra flattened_device_tree_17_global
bne a0 zero idle
# to do

.label load_payload
# to do construct a process for the payload
# to do end initialization by executing the payload thread

# no return
.label idle
wfi
jal zero idle


.align 4
.label kernel_semaphore
.word 0