# device interface byte layout
# 0 address range array size
# 1 interrupt identifier array size
# 2 process identifier
# 4 -
# 8 address range array
# 248 interrupt identifier array
# 752

.align 4


# populate device interface table in flattened device tree routines


# in
# a0 device interface identifier
# a1 process identifier
.label device_interface_reserve
addi t0 zero 752
mul t0 t0 a0
li t1 device_interface_table
add t0 t0 t1
sh a1 t0 2
jalr zero ra 0


# in
# a0 address
# out
# a0 device interface identifier
.label device_interface_seek_by_address
li t0 device_interface_table
lbu t1 device_interface_table_size
lui t2 0
.label device_interface_seek_by_address_next
beq t2 t1 device_interface_seek_by_address_failure
addi t0 t0 752
addi t2 t2 1
# 1
lbu t3 t0 0
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 8
bltu a0 t4 device_interface_seek_by_address_2
sub t4 a0 t4
ld t5 t0 16
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_2
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 24
bltu a0 t4 device_interface_seek_by_address_3
sub t4 a0 t4
ld t5 t0 32
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_3
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 40
bltu a0 t4 device_interface_seek_by_address_4
sub t4 a0 t4
ld t5 t0 48
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_4
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 56
bltu a0 t4 device_interface_seek_by_address_5
sub t4 a0 t4
ld t5 t0 64
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_5
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 72
bltu a0 t4 device_interface_seek_by_address_6
sub t4 a0 t4
ld t5 t0 80
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_6
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 88
bltu a0 t4 device_interface_seek_by_address_7
sub t4 a0 t4
ld t5 t0 96
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_7
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 104
bltu a0 t4 device_interface_seek_by_address_8
sub t4 a0 t4
ld t5 t0 112
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_8
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 120
bltu a0 t4 device_interface_seek_by_address_9
sub t4 a0 t4
ld t5 t0 128
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_9
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 136
bltu a0 t4 device_interface_seek_by_address_10
sub t4 a0 t4
ld t5 t0 144
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_10
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 152
bltu a0 t4 device_interface_seek_by_address_11
sub t4 a0 t4
ld t5 t0 160
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_11
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 168
bltu a0 t4 device_interface_seek_by_address_12
sub t4 a0 t4
ld t5 t0 176
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_12
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 184
bltu a0 t4 device_interface_seek_by_address_13
sub t4 a0 t4
ld t5 t0 192
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_13
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 200
bltu a0 t4 device_interface_seek_by_address_14
sub t4 a0 t4
ld t5 t0 208
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_14
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 216
bltu a0 t4 device_interface_seek_by_address_15
sub t4 a0 t4
ld t5 t0 224
bltu t4 t5 device_interface_seek_by_address_success
.label device_interface_seek_by_address_15
addi t3 t3 -1
beq t3 zero device_interface_seek_by_address_next
ld t4 t0 232
bltu a0 t4 device_interface_seek_by_address_next
sub t4 a0 t4
ld t5 t0 240
bgeu t4 t5 device_interface_seek_by_address_next
.label device_interface_seek_by_address_success
addi a0 t2 0
jalr zero ra 0
.label device_interface_seek_by_address_failure
lui a0 0
jalr zero ra 0


# in
# a0 interrupt identifier
# out
# a0 device interface identifier
.label device_interface_seek_by_interrupt_identifier
li t0 device_interface_table
lbu t1 device_interface_table_size
lui t2 0
.label device_interface_seek_by_interrupt_identifier_next
beq t2 t1 device_interface_seek_by_interrupt_identifier_failure
addi t0 t0 752
addi t2 t2 1
# 1
lbu t3 t0 1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 248
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 2
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 256
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 3
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 264
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 4
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 272
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 5
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 280
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 6
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 288
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 7
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 296
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 8
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 304
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 9
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 312
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 10
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 320
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 11
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 328
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 12
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 336
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 13
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 344
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 14
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 352
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 15
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 360
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 16
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 368
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 17
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 376
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 18
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 384
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 19
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 392
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 20
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 400
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 21
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 408
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 22
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 416
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 23
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 424
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 24
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 432
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 25
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 440
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 26
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 448
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 27
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 456
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 28
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 464
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 29
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 472
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 30
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 480
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 31
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 488
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 32
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 496
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 33
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 504
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 34
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 512
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 35
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 520
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 36
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 528
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 37
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 536
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 38
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 544
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 39
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 552
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 40
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 560
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 41
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 568
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 42
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 576
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 43
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 584
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 44
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 592
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 45
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 600
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 46
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 608
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 47
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 616
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 48
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 624
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 49
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 632
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 50
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 640
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 51
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 648
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 52
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 656
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 53
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 664
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 54
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 672
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 55
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 680
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 56
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 688
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 57
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 696
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 58
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 704
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 59
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 712
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 60
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 720
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 61
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 728
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 62
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 736
beq t4 a0 device_interface_seek_by_interrupt_identifier_success
# 63
addi t3 t3 -1
beq t3 zero device_interface_seek_by_interrupt_identifier_next
ld t4 t0 744
bne t4 a0 device_interface_seek_by_interrupt_identifier_next
.label device_interface_seek_by_interrupt_identifier_success
addi a0 t2 0
jalr zero ra 0
.label device_interface_seek_by_interrupt_identifier_failure
lui a0 0
jalr zero ra 0


.label device_interface_table_size
.byte 0

.align 8
.label device_interface_table
.zero 192512