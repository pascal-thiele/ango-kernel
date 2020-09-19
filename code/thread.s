# thread byte layout
# 0 existence flag
# 1 status
# 2 process identifier
# 4 preceding scheduled thread identifier
# 6 succeeding scheduled thread identifier
# 8 pc
# 16 x1
# 24 x2
# 32 x3
# 40 x4
# 48 x5
# 56 x6
# 64 x7
# 72 x8
# 80 x9
# 88 x10
# 96 x11
# 104 x12
# 112 x13
# 120 x14
# 128 x15
# 136 x16
# 144 x17
# 152 x18
# 160 x19
# 168 x20
# 176 x21
# 184 x22
# 192 x23
# 200 x24
# 208 x25
# 216 x26
# 224 x27
# 232 x28
# 240 x29
# 248 x30
# 256 x31
# 264 fcsr
# 268 -
# 272 f0
# 288 f1
# 304 f2
# 320 f3
# 336 f4
# 352 f5
# 368 f6
# 384 f7
# 400 f8
# 416 f9
# 432 f10
# 448 f11
# 464 f12
# 480 f13
# 496 f14
# 512 f15
# 528 f16
# 544 f17
# 560 f18
# 576 f19
# 592 f20
# 608 f21
# 624 f22
# 640 f23
# 656 f24
# 672 f25
# 688 f26
# 704 f27
# 720 f28
# 736 f29
# 752 f30
# 768 f31
# 784


.align 2
.label thread_table_size
.halfword 0

.align 8
.label thread_quantum
.doubleword 0

.label thread_table
.zero 51380224 # 65536 threads