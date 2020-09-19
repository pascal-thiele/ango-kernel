# free address ranges are concatenated into a linked list
# the size of the address range is written to the address range

# memory byte layout
# 0 succeeding address range address
# 8 address range size
# 16

.align 4


# in
# a0 address
# a1 size
.label memory_insert
# shrink address range to page boundaries
lui t0 1
bltu a1 t0 memory_insert_return
remu t1 a0 t0
sub t1 t0 t1
add a0 a0 t1
sub a1 a1 t1
addi t0 t0 -1
xor a1 a1 t0
beq a1 zero memory_insert_return

ld t0 memory_size
beq t0 zero memory_insert_empty
ld t1 memory_address
bltu a0 t1 memory_insert_front
lui t2 0
.label memory_insert_sort
addi t2 t2 1
beq t2 t0 memory_insert_back
addi t3 t1 0
ld t1 t3 0
bgeu a0 t1 memory_insert_sort
# try merge
ld t2 t3 8
add t4 t3 t2
bgeu t4 a0 memory_insert_merge_preceding
add t2 a0 a1
bgeu t2 t1 memory_insert_merge_succeeding
sd a0 t3 0
sd t1 a0 0
sd a1 a0 8
addi t0 t0 1
sd t0 memory_size t1
.label memory_insert_return
jalr zero ra 0
.label memory_insert_merge_preceding
add t4 a0 a1
bgeu memory_insert_merge_surrounding
add t2 t2 a1
sd t2 t3 8
jalr zero ra 0
.label memory_insert_merge_surrounding
ld t4 t1 0
sd t4 t3 0
add t2 t2 a1
ld t1 t1 8
add t2 t2 t1
sd t2 t3 8
addi t0 t0 -1
sd t0 memory_size t1
jalr zero ra 0
.label memory_insert_merge_succeeding
sd a0 t3 0
ld t0 t1 0
sd t0 a0 0
ld t0 t1 8
add t0 t0 a1
sd t0 a0 8
jalr zero ra 0

.label memory_insert_empty
sd a1 a0 8
sd a0 memory_address t1
addi t0 t0 1
sd t0 memory_size t1
jalr zero ra 0

.label memory_insert_front
add t2 a0 a1
bgeu t2 t1 memory_insert_front_merge
sd t1 a0 0
sd a1 a0 8
sd a0 memory_address t1
addi t0 t0 1
sd t0 memory_size t1
jalr zero ra 0
.label memory_insert_front_merge
ld t0 t1 0
sd t0 a0 0
ld t0 t1 8
add t0 t0 a1
sd t0 a0 8
sd a0 memory_address t0
jalr zero ra 0

.label memory_insert_back
ld t2 t1 8
add t3 t2 t1
bgeu t3 a0 memory_insert_back_merge
sd a0 t1 0
sd a1 a0 8
addi t0 t0 1
sd t0 memory_size t1
jalr zero ra 0
.label memory_insert_back_merge
add t2 t2 a1
sd t2 t1 8
jalr zero ra 0


# in
# a0 address
# a1 size
.label memory_release
ld t0 memory_size
beq t0 zero memory_release_return

# grow address range to page boundaries
lui t1 1
remu t2 a0 t1
sub a0 a0 t2
add a1 a1 t2
remu t2 a1 t1
sub t2 t1 t2
add a1 a1 t2

# seek overlapping address ranges
# if (address_a < address_b)
## size_a > (address_b - address_a)
# else
## size_b >= (address_a - address_b)

ld t2 memory_address
.label memory_release_inner
addi t3 t2 0
ld t2 t3 0
ld t4 t3 8
bltu a0 t3 memory_release_outer
sub t5 a0 t3
bgeu t5 t4 memory_release_next
bltu t5 t1 memory_release_inner_front
sd t5 t3 8
add t5 t5 a1
add t6 t5 t1
bltu t4 t6 memory_release_next
add t6 t3 t5
sd t6 t3 0
sd t2 t6 0
sub t4 t4 t5
sd t4 t6 8
ld t3 memory_size
addi t3 t3 1
sd t3 memory_size t4
# to do
jal zero memory_release_next

.label memory_release_inner_front
# to do

.label memory_release_outer
sub t5 t3 a0
bgeu t5 a1 memory_release_next
# to do

.label memory_release_next
addi t0 t0 -1
bne t0 zero memory_release_inner
.label memory_release_return
jalr zero ra 0


# out
# a0 status
# a1 address
.label memory_allocate
# to do
# allocate from lowermost element
# allocate lowermost addresses
# allocate one page
# relocate element variables
# page alignment and size is handled at insertion
# only fails if all memory has been allocated already


# in
# a0 address
.label memory_free
# to do
# free one page
# assume page alignment


# out
# a0 amount of free memory in bytes
.label memory_total
lui a0 0
ld t0 memory_size
beq t0 zero memory_total_return
ld t1 memory_address
ld t2 t1 8
add a0 a0 t2
addi t0 t0 -1
beq t0 zero memory_total_return
.label memory_total_repeat
ld t1 t1 0
ld t2 t1 8
add a0 a0 t2
addi t0 t0 -1
bne t0 zero memory_total_repeat
.label memory_total_return
jalr zero ra 0


.align 8
.label memory_address
.doubleword 0
.label memory_size # counts memory elements
.doubleword 0