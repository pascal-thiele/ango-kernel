# page byte layout
# 0 succeeding page
# 8

# always set lowermost 8 bits of page table entries to
# 00000000 if empty
# 00000001 if non-leaf
# 11011111 if leaf

.align 4


# ensure "size in bytes" is greater than zero
# in
# a0 root page table address
# a1 size in bytes
# out
# a0 status
# a1 address range virtual address
.label page_table_allocate
addi sp sp -48
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
sd s2 sp 24
sd s3 sp 32
sd s4 sp 40

# seek sufficient empty page range
lui t0 0 # byte count
lui t1 0 # third level index
.label page_table_allocate_seek_third_level
slli t2 t1 3
add t2 t2 a0
ld t2 t2 0
andi t3 t2 1
bne t3 zero page_table_allocate_seek_third_level_entry
lui t3 262144
add t0 t0 t3
bltu t0 a1 page_table_allocate_seek_third_level_next
sub t0 t0 t3
slli t1 t1 30
sub s0 t1 t0
jal zero page_table_allocate_calculate_space
.label page_table_allocate_seek_third_level_entry
andi t3 t2 1023
xor t2 t2 t3
slli t2 t2 2
lui t3 0 # second level index

.label page_table_allocate_seek_second_level
slli t4 t3 3
add t4 t4 t2
ld t4 t4 0
andi t5 t4 1
bne t5 zero page_table_allocate_seek_second_level_entry
lui t5 512
add t0 t0 t5
bltu t0 a1 page_table_allocate_seek_second_level_next
sub t0 t0 t5
slli t1 t1 30
slli t3 t3 21
add t1 t1 t3
sub s0 t1 t0
jal zero page_table_allocate_calculate_space
.label page_table_allocate_seek_second_level_entry
andi t5 t4 1023
xor t4 t4 t5
slli t4 t4 2
lui t5 0 # first level index

.label page_table_allocate_seek_first_level
slli t6 t5 3
add t6 t6 t4
ld t6 t6 0
andi t6 t6 1
bne t6 zero page_table_allocate_seek_first_level_entry
lui t6 1
add t0 t0 t6
bltu t0 a1 page_table_allocate_seek_first_level_next
sub t0 t0 t6
slli t1 t1 30
slli t3 t3 21
add t1 t1 t3
slli t5 t5 12
add t1 t1 t5
sub s0 t1 t0
jal zero page_table_allocate_calculate_space
.label page_table_allocate_seek_first_level_entry
lui t0 0

.label page_table_allocate_seek_first_level_next
addi t5 t5 1
addi t6 zero 512
bne t5 t6 page_table_allocate_seek_first_level

.label page_table_allocate_seek_second_level_next
addi t3 t3 1
addi t4 zero 512
bne t3 t4 page_table_allocate_seek_second_level

.label page_table_allocate_seek_third_level_next
addi t1 t1 1
addi t2 zero 512
bne t1 t2 page_table_allocate_seek_third_level

# no sufficient virtual address space
addi a0 zero 1
jal zero page_table_allocate_return

.label page_table_allocate_calculate_space
# round up size to a multiple of four kibibytes
lui t0 1
addi t1 t0 -1
and t2 a1 t1
sub t0 t0 t2
and t0 t0 t1
add t0 t0 a1
addi s1 t0 0 # rounded size
# add the amount of page tables needed to contain all pages
srli t0 t0 12
srli t1 t0 9
add t0 t0 t1
srli t1 t1 9
add t0 t0 t1
# check free space
ld t1 page_list_size
bgeu t1 t0 page_table_allocate_fill
addi a0 zero 1
jal zero page_table_allocate_return

.label page_table_allocate_fill
# to do

# success
lui a0 0
addi a1 s0 0
.label page_table_allocate_return
ld s4 sp 40
ld s3 sp 32
ld s2 sp 24
ld s1 sp 16
ld s0 sp 8
ld ra sp 0
addi sp sp 48
jalr zero ra 0


# in
# a0 root page table address
# a1 address range virtual address
# a2 address range size in bytes
.label page_table_free
# shrink address range to page boundaries
# to do


# in
# a0 root page table address
# a1 virtual address
# out
# a0 status
# a1 physical address
.label page_table_translate
# first level
lui t0 1
addi t0 t0 -8
srli t1 a1 27
and t1 t1 t0
add t1 t1 a0
ld t1 t1 0
andi t2 t1 1
beq t3 zero page_table_translate_failure
andi t2 t1 1023
xor t1 t1 t2
slli t1 t1 2
# second level
srli t2 a1 18
and t2 t2 t0
add t1 t1 t2
ld t1 t1 0
andi t2 t1 1
beq t2 zero page_table_translate_failure
andi t2 t1 1023
xor t1 t1 t2
slli t1 t1 2
# third level
srli t2 a1 9
and t2 t2 t0
add t1 t1 t2
ld t1 t1 0
andi t2 t1 1
beq t2 zero page_table_translate_failure
andi t2 t1 1023
xor t1 t1 t2
slli t1 t1 2
# add page offset
addi t0 t0 7
and a1 a1 t0
add a1 a1 t1
# success
lui a0 0
jalr zero ra 0
.label page_table_translate_failure
addi a0 zero 1
jalr zero ra 0


# in
# a0 address range address
# a1 address range size
.label page_insert
lui t0 1
bltu a1 t0 page_insert_return
# shrink address range to page boundaries
remu t1 a0 t0
sub t1 t0 t1
add a0 a0 t1
sub a1 a1 t1
addi t1 t0 -1
and t1 t1 a1
xor a1 a1 t1
beq a1 zero page_insert_return
# concatenate new pages in page list
ld t1 page_list_address
ld t2 page_list_size
.label page_insert_repeat
sub a1 a1 t0
add t3 a0 a1
sd t1 t3 0
addi t1 t3 0
addi t2 t2 1
bne a1 zero page_insert_repeat
sd t1 page_list_address
sd t2 page_list_size
.label page_insert_return
jalr zero ra 0


# ensure page list size is greater than zero
# out
# a0 address
.label page_allocate
ld a0 page_list_address
ld t0 a0 0
sd t0 page_list_address t1
ld t0 page_list_size
addi t0 t0 -1
sd t0 page_list_size t1
jalr zero ra 0


# in
# a0 address
.label page_free
ld t0 page_list_address
sd t0 a0 0
sd a0 page_list_address
ld t0 page_list_size
addi t0 t0 1
sd t0 page_list_size
jalr zero ra 0


.align 8
.label page_list_address
.doubleword 0
.label page_list_size
.doubleword 0