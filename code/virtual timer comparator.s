.align 4


.label virtual_timer_comparator_free
sh zero virtual_timer_comparator_process_identifier t0
sb zero virtual_timer_comparator_enable t0
jalr zero ra 0


# in
# a0 time
.label virtual_timer_comparator_write
sd a0 virtual_timer_comparator t0
addi t0 zero 1
sb t0 virtual_timer_comparator_enable t1
jalr zero ra 0


.label virtual_timer_comparator_check_time
addi sp sp -8
sd ra sp 0
csrrs t0 zero time
ld t1 virtual_timer_comparator
bltu t0 t1 virtual_timer_comparator_check_time_return
sb zero virtual_timer_comparator_enable t0
# to do dispatch a message to process
.label virtual_timer_comparator_check_time_return
ld ra sp 0
addi sp sp 8
jalr zero ra 0


.label virtual_timer_comparator_enable
.byte 0

# can be written directly to reserve
.align 2
.label virtual_timer_comparator_process_identifier
.halfword 0

.align 8
.label virtual_timer_comparator
.doubleword 0