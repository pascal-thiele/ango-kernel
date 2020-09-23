# note check if free pages are sufficient outside of following functions and assume no page tables are allocated to contain allocated pages


# in
# a0 root page table address
# a1 size in bytes
# out
# a0 status
# a1 address range virtual address
.label page_table_seek
addi sp sp -48
sd ra sp 0
sd s0 sp 8
sd s1 sp 16
sd s2 sp 24
sd s3 sp 32
sd s4 sp 40

# calculate the amount of pages to contain size
lui s0 1
addi t0 s0 -1
and t1 a1 t0
sub s0 s0 t1
and s0 s0 t0
add s0 s0 a1
srli s0 s0 12

# seek sufficient empty page range
lui s1 0 # virtual address
lui t0 0 # page count
lui t1 0 # page table count
.label page_table_seek_third_level
srli t2 s1 30
andi t2 t2 ???


# in
# a0 root page table address
# a1 virtual address
# a2 physical address
# a3 address range size
.label page_table_map
# to do


# in
# a0 root page table address
# a1 address range virtual address
.label page_table_unmap
# to do