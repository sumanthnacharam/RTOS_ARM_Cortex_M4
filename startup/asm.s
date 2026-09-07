	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"startup.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "startup.c"
	.global	vector_table
	.section	.isr_vector,"aw"
	.align	2
	.type	vector_table, %object
	.size	vector_table, 64
vector_table:
	.word	537001984
	.word	Reset_Handler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	SysTick_Handler
	.text
	.align	1
	.global	Reset_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Reset_Handler, %function
Reset_Handler:
.LFB0:
	.loc 1 31 26
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 33 15
	ldr	r3, .L7
	str	r3, [r7, #4]
	.loc 1 34 15
	ldr	r3, .L7+4
	str	r3, [r7]
	.loc 1 36 11
	b	.L2
.L3:
	.loc 1 37 22
	ldr	r2, [r7, #4]
	adds	r3, r2, #4
	str	r3, [r7, #4]
	.loc 1 37 13
	ldr	r3, [r7]
	adds	r1, r3, #4
	str	r1, [r7]
	.loc 1 37 18
	ldr	r2, [r2]
	.loc 1 37 16
	str	r2, [r3]
.L2:
	.loc 1 36 16
	ldr	r3, [r7]
	ldr	r2, .L7+8
	cmp	r3, r2
	bcc	.L3
	.loc 1 41 9
	ldr	r3, .L7+12
	str	r3, [r7]
	.loc 1 42 11
	b	.L4
.L5:
	.loc 1 43 13
	ldr	r3, [r7]
	adds	r2, r3, #4
	str	r2, [r7]
	.loc 1 43 16
	movs	r2, #0
	str	r2, [r3]
.L4:
	.loc 1 42 16
	ldr	r3, [r7]
	ldr	r2, .L7+16
	cmp	r3, r2
	bcc	.L5
	.loc 1 47 5
	bl	main
.L6:
	.loc 1 49 11
	nop
	b	.L6
.L8:
	.align	2
.L7:
	.word	_sidata
	.word	_sdata
	.word	_edata
	.word	_sbss
	.word	_ebss
	.cfi_endproc
.LFE0:
	.size	Reset_Handler, .-Reset_Handler
	.align	1
	.global	Default_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Default_Handler, %function
Default_Handler:
.LFB1:
	.loc 1 52 28
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
.L10:
	.loc 1 53 11
	nop
	b	.L10
	.cfi_endproc
.LFE1:
	.size	Default_Handler, .-Default_Handler
.Letext0:
	.file 2 "C:/tools/arm-gnu-toolchain/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "C:/tools/arm-gnu-toolchain/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "../src/delay.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x141
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x1d
	.byte	0x3
	.4byte	0x31647
	.4byte	.LASF18
	.4byte	.LASF19
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x5a
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x4e
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x6
	.byte	0x11
	.4byte	0x7d
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x6
	.byte	0x1a
	.4byte	0x7d
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x6
	.byte	0x22
	.4byte	0x7d
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x7
	.byte	0x11
	.4byte	0x7d
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x7
	.byte	0x18
	.4byte	0x7d
	.uleb128 0x8
	.4byte	0xd0
	.4byte	0xd0
	.uleb128 0x9
	.4byte	0x76
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.4byte	0xd5
	.uleb128 0xa
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0xe
	.byte	0x8
	.4byte	0xc0
	.uleb128 0x5
	.byte	0x3
	.4byte	vector_table
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x3
	.byte	0xc
	.4byte	0x6f
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x4
	.byte	0x11
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13f
	.uleb128 0x5
	.ascii	"src\000"
	.byte	0x21
	.4byte	0x13f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.ascii	"dst\000"
	.byte	0x22
	.4byte	0x13f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.4byte	0x7d
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x90
	.uleb128 0xb
	.uleb128 0x91
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF18:
	.ascii	"startup.c\000"
.LASF12:
	.ascii	"_sdata\000"
.LASF14:
	.ascii	"_sbss\000"
.LASF15:
	.ascii	"_ebss\000"
.LASF23:
	.ascii	"Reset_Handler\000"
.LASF21:
	.ascii	"SysTick_Handler\000"
.LASF16:
	.ascii	"vector_table\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF13:
	.ascii	"_edata\000"
.LASF11:
	.ascii	"_sidata\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"GNU C23 15.2.1 20251203 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF20:
	.ascii	"main\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"Default_Handler\000"
.LASF2:
	.ascii	"short int\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF19:
	.ascii	"E:\\Library_PyjamaBrah\\FreeRTOS\\Nucleo\\nucleo-f4"
	.ascii	"46re\\startup\000"
	.ident	"GCC: (Arm GNU Toolchain 15.2.Rel1 (Build arm-15.86)) 15.2.1 20251203"
