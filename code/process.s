# process byte layout
# 0 existence flag
# 1 superuser flag
# 2 priority
# 3 -
# 4 parent process identifier
# 6  -
# 8 root page table address
# 16 message array virtual address
# 24 message array size
# 32 program name
# 288

.align 2
.label process_table_size
.halfword 0

.align 8
.label process_table
.zero 4718592 # 16384 processes