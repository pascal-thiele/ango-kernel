# mscratch contains the address of the executing hardware threads element in the hardware thread table

.align 4
.label exception_handler
csrrw x1 x1 mscratch
sd x2 x1 64
sd x3 x1 72
sd x4 x1 80
sd x5 x1 88
sd x6 x1 96
sd x7 x1 104
sd x8 x1 112
sd x9 x1 120
sd x10 x1 128
sd x11 x1 136
sd x12 x1 144
sd x13 x1 152
sd x14 x1 160
sd x15 x1 168
sd x16 x1 176
sd x17 x1 184
sd x18 x1 192
sd x19 x1 200
sd x20 x1 208
sd x21 x1 216
sd x22 x1 224
sd x23 x1 232
sd x24 x1 240
sd x25 x1 248
sd x26 x1 256
sd x27 x1 264
sd x28 x1 272
sd x29 x1 280
sd x30 x1 288
sd x31 x1 296
csrrw x2 x1 mscratch
sd x2 x1 56
addi sp x1 808
csrrs t0 zero mcause

# instruction address misaligned
bne t0 zero exception_handler_instruction_access_fault
# to do

.label exception_handler_instruction_access_fault
addi t1 zero 1
bne t0 t1 exception_handler_illegal_instruction
# to do

.label exception_handler_illegal_instruction
addi t1 zero 2
bne t0 t1 exception_handler_breakpoint
# to do

.label exception_handler_breakpoint
addi t1 zero 3
bne t0 t1 exception_handler_load_address_misaligned
# to do

.label exception_handler_load_address_misaligned
addi t1 zero 4
bne t0 t1 exception_handler_load_access_fault
# to do

.label exception_handler_load_access_fault
addi t1 zero 5
bne t0 t1 exception_handler_store_amo_address_misaligned
# to do

.label exception_handler_store_amo_address_misaligned
addi t1 zero 6
bne t0 t1 exception_handler_store_amo_access_fault
# to do

.label exception_handler_store_amo_access_fault
addi t1 zero 7
bne t0 t1 exception_handler_environment_call_from_user_mode
# to do

.label exception_handler_environment_call_from_user_mode
addi t1 zero 8
bne t0 t1 exception_handler_environment_call_from_supervisor_mode
# to do

.label exception_handler_environment_call_from_supervisor_mode
addi t1 zero 9
bne t0 t1 exception_handler_environment_call_from_machine_mode
# to do

.label exception_handler_environment_call_from_machine_mode
addi t1 zero 11
bne t0 t1 exception_handler_instruction_page_fault
# to do

.label exception_handler_instruction_page_fault
addi t1 zero 12
bne t0 t1 exception_handler_load_page_fault
# to do

.label exception_handler_load_page_fault
addi t1 zero 13
bne t0 t1 exception_handler_store_amo_page_fault
# to do

.label exception_handler_store_amo_page_fault
addi t1 zero 15
bne t0 t1 exception_handler_user_software
# to do

.label exception_handler_user_software
lui t1 1
slli t1 t1 51
bne t0 t1 exception_handler_supervisor_software
# to do

.label exception_handler_supervisor_software
addi t1 t1 1
bne t0 t1 exception_handler_machine_software
# to do

.label exception_handler_machine_software
lui t1 1
slli t1 t1 51
addi t1 t1 3
bne t0 t1 exception_handler_user_timer
# to do

.label exception_handler_user_timer
addi t1 t1 1
bne t0 t1 exception_handler_supervisor_timer
# to do

.label exception_handler_supervisor_timer
addi t1 t1 1
bne t0 t1 exception_handler_machine_timer
# to do

.label exception_handler_machine_timer
lui t1 1
slli t1 t1 51
addi t1 t1 7
bne t0 t1 exception_handler_user_external
# to do

.label exception_handler_user_external
addi t1 t1 1
bne t0 t1 exception_handler_supervisor_external
# to do

.label exception_handler_supervisor_external
addi t1 t1 1
bne t0 t1 exception_handler_machine_external
# to do

.label exception_handler_machine_external
lui t1 1
slli t1 t1 51
addi t1 t1 11
bne t0 t1 exception_handler_restore
# to do

.label exception_handler_restore
csrrs x1 zero mscratch
ld x2 x1 64
ld x3 x1 72
ld x4 x1 80
ld x5 x1 88
ld x6 x1 96
ld x7 x1 104
ld x8 x1 112
ld x9 x1 120
ld x10 x1 128
ld x11 x1 136
ld x12 x1 144
ld x13 x1 152
ld x14 x1 160
ld x15 x1 168
ld x16 x1 176
ld x17 x1 184
ld x18 x1 192
ld x19 x1 200
ld x20 x1 208
ld x21 x1 216
ld x22 x1 224
ld x23 x1 232
ld x24 x1 240
ld x25 x1 248
ld x26 x1 256
ld x27 x1 264
ld x28 x1 272
ld x29 x1 280
ld x30 x1 288
ld x31 x1 296
ld x1 x1 56
mret