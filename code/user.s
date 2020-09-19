# user byte layout
# 0 existence flag
# 1 password flag
# 2 -
# 8 name
# 264 password
# 520

# to do

.label user_table_size
.byte 0

.align 8
.label user_table
.zero 8320