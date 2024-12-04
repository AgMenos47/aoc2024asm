%include "macros/syscalls.mac"
%include "macros/helpers.mac"
%use smartalign

ALIGNMODE p6, -1
DEFAULT rel
BITS 64


section .bss
	alignb 64
	list1 resb 5000
	tlist1 resb 5000
et2:
	list2 resb 5000
	tlist2 resb 5000
et1:
	alignb 16
counts:
	counti0 resb 20
	counti1 resb 20
	counti2 resb 20
	counti3 resb 20
	counti4 resb 20
	counti5 resb 20
	counti6 resb 20
	counti7 resb 20
	counti8 resb 20
	counti9 resb 20
	resb 20
	output resb 10

section .rodata align=16
	align 32
	digimul dw 10000,1000,100,10,1,0,0,0
	align 32
	shuffler db 0,255,1,255,2,255,3,255,4,255,8,255,9,255,10,255,11,255,12,255,255,255,255,255,255,255,255,255,255,255,255,255
	shuffler2 db 0,255,1,255,2,255,3,255,4,255,255,255,255,255,255,255
	alignb 16
	char0 db 16 dup("0")
	num0 db 16 dup(0)
	num1 db 16 dup(1)
	num2 db 16 dup(2)
	num3 db 16 dup(3)
	num4 db 16 dup(4)
	num5 db 16 dup(5)
	num6 db 16 dup(6)
	num7 db 16 dup(7)
	num8 db 16 dup(8)
	num9 db 16 dup(9)


section .data
	input:
		incbin "inputs/day1.txt"

section .text
	global _start

_start:
	; n lines/4
	mov ecx,250
	lea rbx, input
	lea r14, tlist1
	lea r15, tlist2
	mov rax, 14
	mov rdx, 16
readline:
	movdqu xmm1, [rbx]
	movdqu xmm2, [rbx+14]
	movdqu xmm3, [rbx+28]
	movdqu xmm4, [rbx+42]
	psubb xmm1, [char0]
	psubb xmm2, [char0]
	psubb xmm3, [char0]
	psubb xmm4, [char0]
	pextrd [r14],xmm1,0
	pextrd [r15],xmm1,2
	pextrb [r14+4],xmm1,4
	pextrb [r15+4],xmm1,12
	pextrd [r14+5],xmm2,0
	pextrd [r15+5],xmm2,2
	pextrb [r14+9],xmm2,4
	pextrb [r15+9],xmm2,12
	pextrd [r14+10],xmm3,0
	pextrd [r15+10],xmm3,2
	pextrb [r14+14],xmm3,4
	pextrb [r15+14],xmm3,12
	pextrd [r14+15],xmm4,0
	pextrd [r15+15],xmm4,2
	pextrb [r14+19],xmm4,4
	pextrb [r15+19],xmm4,12

countxmm1:
	vpcmpestrm xmm1, [num0], 0x48
	vpaddb xmm6,xmm6,xmm0
	vpcmpestrm xmm1, [num1], 0x48
	vpaddb xmm7,xmm7,xmm0
	vpcmpestrm xmm1, [num2], 0x48
	vpaddb xmm8,xmm8,xmm0
	vpcmpestrm xmm1, [num3], 0x48
	vpaddb xmm9,xmm9,xmm0
	vpcmpestrm xmm1, [num4], 0x48
	vpaddb xmm10,xmm10,xmm0
	vpcmpestrm xmm1, [num5], 0x48
	vpaddb xmm11,xmm11,xmm0
	vpcmpestrm xmm1, [num6], 0x48
	vpaddb xmm12,xmm12,xmm0
	vpcmpestrm xmm1, [num7], 0x48
	vpaddb xmm13,xmm13,xmm0
	vpcmpestrm xmm1, [num8], 0x48
	vpaddb xmm14,xmm14,xmm0
	vpcmpestrm xmm1, [num9], 0x48
	vpaddb xmm15,xmm15,xmm0
countxmm2:
	
	vpcmpestrm xmm2, [num0], 0x48
	vpaddb xmm6,xmm6,xmm0
	vpcmpestrm xmm2, [num1], 0x48
	vpaddb xmm7,xmm7,xmm0
	vpcmpestrm xmm2, [num2], 0x48
	vpaddb xmm8,xmm8,xmm0
	vpcmpestrm xmm2, [num3], 0x48
	vpaddb xmm9,xmm9,xmm0
	vpcmpestrm xmm2, [num4], 0x48
	vpaddb xmm10,xmm10,xmm0
	vpcmpestrm xmm2, [num5], 0x48
	vpaddb xmm11,xmm11,xmm0
	vpcmpestrm xmm2, [num6], 0x48
	vpaddb xmm12,xmm12,xmm0
	vpcmpestrm xmm2, [num7], 0x48
	vpaddb xmm13,xmm13,xmm0
	vpcmpestrm xmm2, [num8], 0x48
	vpaddb xmm14,xmm14,xmm0
	vpcmpestrm xmm2, [num9], 0x48
	vpaddb xmm15,xmm15,xmm0
countxmm3:


	vpcmpestrm xmm3, [num0], 0x48
	vpaddb xmm6,xmm6,xmm0
	vpcmpestrm xmm3, [num1], 0x48
	vpaddb xmm7,xmm7,xmm0
	vpcmpestrm xmm3, [num2], 0x48
	vpaddb xmm8,xmm8,xmm0
	vpcmpestrm xmm3, [num3], 0x48
	vpaddb xmm9,xmm9,xmm0
	vpcmpestrm xmm3, [num4], 0x48
	vpaddb xmm10,xmm10,xmm0
	vpcmpestrm xmm3, [num5], 0x48
	vpaddb xmm11,xmm11,xmm0
	vpcmpestrm xmm3, [num6], 0x48
	vpaddb xmm12,xmm12,xmm0
	vpcmpestrm xmm3, [num7], 0x48
	vpaddb xmm13,xmm13,xmm0
	vpcmpestrm xmm3, [num8], 0x48
	vpaddb xmm14,xmm14,xmm0
	vpcmpestrm xmm3, [num9], 0x48
	vpaddb xmm15,xmm15,xmm0
countxmm4:

	vpcmpestrm xmm4, [num0], 0x48
	vpaddb xmm6,xmm6,xmm0
	vpcmpestrm xmm4, [num1], 0x48
	vpaddb xmm7,xmm7,xmm0
	vpcmpestrm xmm4, [num2], 0x48
	vpaddb xmm8,xmm8,xmm0
	vpcmpestrm xmm4, [num3], 0x48
	vpaddb xmm9,xmm9,xmm0
	vpcmpestrm xmm4, [num4], 0x48
	vpaddb xmm10,xmm10,xmm0
	vpcmpestrm xmm4, [num5], 0x48
	vpaddb xmm11,xmm11,xmm0
	vpcmpestrm xmm4, [num6], 0x48
	vpaddb xmm12,xmm12,xmm0
	vpcmpestrm xmm4, [num7], 0x48
	vpaddb xmm13,xmm13,xmm0
	vpcmpestrm xmm4, [num8], 0x48
	vpaddb xmm14,xmm14,xmm0
	vpcmpestrm xmm4, [num9], 0x48
	vpaddb xmm15,xmm15,xmm0

	add r14, 20
	add r15, 20
	add rbx, 56
	dec ecx
	jnz readline


	vpxor xmm5,xmm5,xmm5

indexcount:
	vpsubb xmm6,xmm5,xmm6
	vpsubb xmm7,xmm5,xmm7
	vpsubb xmm8,xmm5,xmm8
	vpsubb xmm9,xmm5,xmm9
	vpsubb xmm10,xmm5,xmm10
	vpsubb xmm11,xmm5,xmm11
	vpsubb xmm12,xmm5,xmm12
	vpsubb xmm13,xmm5,xmm13
	vpsubb xmm14,xmm5,xmm14
	vpsubb xmm15,xmm5,xmm15

duplicate:
	vmovdqa ymm5,[shuffler]
	vinserti128 ymm6,ymm6,xmm6,1
	vinserti128 ymm7,ymm7,xmm7,1
	vinserti128 ymm8,ymm8,xmm8,1
	vinserti128 ymm9,ymm9,xmm9,1
	vinserti128 ymm10,ymm10,xmm10,1
	vinserti128 ymm11,ymm11,xmm11,1
	vinserti128 ymm12,ymm12,xmm12,1
	vinserti128 ymm13,ymm13,xmm13,1
	vinserti128 ymm14,ymm14,xmm14,1
	vinserti128 ymm15,ymm15,xmm15,1
shuffleymm:
	vpshufb ymm6,ymm6,ymm5
	vpshufb ymm7,ymm7,ymm5
	vpshufb ymm8,ymm8,ymm5
	vpshufb ymm9,ymm9,ymm5
	vpshufb ymm10,ymm10,ymm5
	vpshufb ymm11,ymm11,ymm5
	vpshufb ymm12,ymm12,ymm5
	vpshufb ymm13,ymm13,ymm5
	vpshufb ymm14,ymm14,ymm5
	vpshufb ymm15,ymm15,ymm5
cumulativeadd:
	vpaddw ymm7,ymm7,ymm6
	vpaddw ymm8,ymm8,ymm7
	vpaddw ymm9,ymm9,ymm8
	vpaddw ymm10,ymm10,ymm9
	vpaddw ymm11,ymm11,ymm10
	vpaddw ymm12,ymm12,ymm11
	vpaddw ymm13,ymm13,ymm12
	vpaddw ymm14,ymm14,ymm13
	vpaddw ymm15,ymm15,ymm14

movers:
	vpextrw [counti0],xmm6,0
	vpextrw [counti1],xmm6,1
	vpextrw [counti2],xmm6,2
	vpextrw [counti3],xmm6,3
	vpextrw [counti4],xmm6,4
	vpextrw [counti5],xmm6,5
	vpextrw [counti6],xmm6,6
	vpextrw [counti7],xmm6,7
	vextracti128 xmm6, ymm6,1
	vpextrw [counti8],xmm6,0
	vpextrw [counti9],xmm6,1

	vpextrw [counti0+2],xmm7,0
	vpextrw [counti1+2],xmm7,1
	vpextrw [counti2+2],xmm7,2
	vpextrw [counti3+2],xmm7,3
	vpextrw [counti4+2],xmm7,4
	vpextrw [counti5+2],xmm7,5
	vpextrw [counti6+2],xmm7,6
	vpextrw [counti7+2],xmm7,7
	vextracti128 xmm7, ymm7,1
	vpextrw [counti8+2],xmm7,0
	vpextrw [counti9+2],xmm7,1
	
	vpextrw [counti0+4],xmm8,0
	vpextrw [counti1+4],xmm8,1
	vpextrw [counti2+4],xmm8,2
	vpextrw [counti3+4],xmm8,3
	vpextrw [counti4+4],xmm8,4
	vpextrw [counti5+4],xmm8,5
	vpextrw [counti6+4],xmm8,6
	vpextrw [counti7+4],xmm8,7
	vextracti128 xmm8, ymm8,1
	vpextrw [counti8+4],xmm8,0
	vpextrw [counti9+4],xmm8,1

	vpextrw [counti0+6],xmm9,0
	vpextrw [counti1+6],xmm9,1
	vpextrw [counti2+6],xmm9,2
	vpextrw [counti3+6],xmm9,3
	vpextrw [counti4+6],xmm9,4
	vpextrw [counti5+6],xmm9,5
	vpextrw [counti6+6],xmm9,6
	vpextrw [counti7+6],xmm9,7
	vextracti128 xmm9, ymm9,1
	vpextrw [counti8+6],xmm9,0
	vpextrw [counti9+6],xmm9,1

	vpextrw [counti0+8],xmm10,0
	vpextrw [counti1+8],xmm10,1
	vpextrw [counti2+8],xmm10,2
	vpextrw [counti3+8],xmm10,3
	vpextrw [counti4+8],xmm10,4
	vpextrw [counti5+8],xmm10,5
	vpextrw [counti6+8],xmm10,6
	vpextrw [counti7+8],xmm10,7
	vextracti128 xmm10, ymm10,1
	vpextrw [counti8+8],xmm10,0
	vpextrw [counti9+8],xmm10,1

	vpextrw [counti0+10],xmm11,0
	vpextrw [counti1+10],xmm11,1
	vpextrw [counti2+10],xmm11,2
	vpextrw [counti3+10],xmm11,3
	vpextrw [counti4+10],xmm11,4
	vpextrw [counti5+10],xmm11,5
	vpextrw [counti6+10],xmm11,6
	vpextrw [counti7+10],xmm11,7
	vextracti128 xmm11, ymm11,1
	vpextrw [counti8+10],xmm11,0
	vpextrw [counti9+10],xmm11,1

	vpextrw [counti0+12],xmm12,0
	vpextrw [counti1+12],xmm12,1
	vpextrw [counti2+12],xmm12,2
	vpextrw [counti3+12],xmm12,3
	vpextrw [counti4+12],xmm12,4
	vpextrw [counti5+12],xmm12,5
	vpextrw [counti6+12],xmm12,6
	vpextrw [counti7+12],xmm12,7
	vextracti128 xmm12, ymm12,1
	vpextrw [counti8+12],xmm12,0
	vpextrw [counti9+12],xmm12,1

	vpextrw [counti0+14],xmm13,0
	vpextrw [counti1+14],xmm13,1
	vpextrw [counti2+14],xmm13,2
	vpextrw [counti3+14],xmm13,3
	vpextrw [counti4+14],xmm13,4
	vpextrw [counti5+14],xmm13,5
	vpextrw [counti6+14],xmm13,6
	vpextrw [counti7+14],xmm13,7
	vextracti128 xmm13, ymm13,1
	vpextrw [counti8+14],xmm13,0
	vpextrw [counti9+14],xmm13,1

	vpextrw [counti0+16],xmm14,0
	vpextrw [counti1+16],xmm14,1
	vpextrw [counti2+16],xmm14,2
	vpextrw [counti3+16],xmm14,3
	vpextrw [counti4+16],xmm14,4
	vpextrw [counti5+16],xmm14,5
	vpextrw [counti6+16],xmm14,6
	vpextrw [counti7+16],xmm14,7
	vextracti128 xmm14, ymm14,1
	vpextrw [counti8+16],xmm14,0
	vpextrw [counti9+16],xmm14,1

	vpextrw [counti0+18],xmm15,0
	vpextrw [counti1+18],xmm15,1
	vpextrw [counti2+18],xmm15,2
	vpextrw [counti3+18],xmm15,3
	vpextrw [counti4+18],xmm15,4
	vpextrw [counti5+18],xmm15,5
	vpextrw [counti6+18],xmm15,6
	vpextrw [counti7+18],xmm15,7
	vextracti128 xmm15, ymm15,1
	vpextrw [counti8+18],xmm15,0
	vpextrw [counti9+18],xmm15,1

	xor r8,r8
	xor r9,r9
	xor r11,r11
	xor r12,r12
	mov ecx, 1000
	lea rbx, list1
	lea rsi, list2
	lea r14, tlist1
	lea r15, tlist2
	add r14, 5000
	add r15, 5000
	lea r13, counts
	mov r10, 5
readsort1:
	sub r14, 5
	sub r15, 5
	movq xmm1, [r14]
	movq xmm2, [r15]
	pextrb r8d, xmm1, 4
	pextrb r9d, xmm2, 4

	mov rax, 4
	imul rax, 10
	add rax, r8
	imul rax, 2
	add rax, r13

	mov rdx, 9
	imul rdx, 10
	add rdx, r9
	imul rdx, 2
	add rdx, r13

	mov r8w, word [rax]
	mov r9w, word [rdx]
	dec r8w
	dec r9w
	mov [rax],r8w
	mov [rdx],r9w

	xor rax,rax
	xor rdx, rdx
	mov rax, r10
	imul rax, r8
	add rax, rbx
	mov rdx, r10
	imul rdx, r9
	add rdx, rsi

	vpextrd [rax],xmm1,0
	vpextrb [rax+4], xmm1,4
	vpextrd [rdx],xmm2,0
	vpextrb [rdx+4], xmm2,4

	dec ecx
	jnz readsort1


	lea rbx, tlist1
	lea rsi, tlist2
	add rbx, 5000
	add rsi, 5000
	lea r14, list1
	lea r15, list2

	mov ecx,1000
	xor rdi,rdi
readsort2:
	xor r8,r8
	xor r9,r9
	sub rbx, 5
	sub rsi, 5
	movq xmm1, [rbx]
	movq xmm2, [rsi]
	pextrb r8d, xmm1, 3
	pextrb r9d, xmm2, 3

	mov rax,3
	imul rax, 10
	add rax, r8
	imul rax, 2
	add rax, r13

	mov rdx, 8
	imul rdx, 10
	add rdx, r9
	imul rdx, 2
	add rdx, r13

	mov r8w, word [rax]
	mov r9w, word [rdx]
	dec r8w
	dec r9w
	mov [rax],r8w
	mov [rdx],r9w


	mov rax, r10
	imul rax, r8
	mov rdx, r10
	imul rdx, r9
	add rax, r14
	add rdx, r15

	vpextrd [rax],xmm1,0
	vpextrb [rax+4], xmm1,4
	vpextrd [rdx],xmm2,0
	vpextrb [rdx+4], xmm2,4

	dec ecx
	jnz readsort2

	lea rbx, list1
	lea rsi, list2
	add rbx, 5000
	add rsi, 5000
	lea r14, tlist1
	lea r15, tlist2

	mov ecx,1000
	xor rdi,rdi
readsort3:
	xor r8,r8
	xor r9,r9
	sub rbx, 5
	sub rsi, 5
	movq xmm1, [rbx]
	movq xmm2, [rsi]
	pextrb r8d, xmm1, 2
	pextrb r9d, xmm2, 2

	mov rax,2
	imul rax, 10
	add rax, r8
	imul rax, 2
	add rax, r13

	mov rdx, 7
	imul rdx, 10
	add rdx, r9
	imul rdx, 2
	add rdx, r13

	mov r8w, word [rax]
	mov r9w, word [rdx]
	dec r8w
	dec r9w
	mov [rax],r8w
	mov [rdx],r9w


	mov rax, r10
	imul rax, r8
	mov rdx, r10
	imul rdx, r9
	add rax, r14
	add rdx, r15

	vpextrd [rax],xmm1,0
	vpextrb [rax+4], xmm1,4
	vpextrd [rdx],xmm2,0
	vpextrb [rdx+4], xmm2,4

	dec ecx
	jnz readsort3

	lea rbx, tlist1
	lea rsi, tlist2
	add rbx, 5000
	add rsi, 5000
	lea r14, list1
	lea r15, list2

	mov ecx,1000
	xor rdi,rdi
readsort4:
	xor r8,r8
	xor r9,r9
	sub rbx, 5
	sub rsi, 5
	movq xmm1, [rbx]
	movq xmm2, [rsi]
	pextrb r8d, xmm1, 1
	pextrb r9d, xmm2, 1

	mov rax,1
	imul rax, 10
	add rax, r8
	imul rax, 2
	add rax, r13

	mov rdx, 6
	imul rdx, 10
	add rdx, r9
	imul rdx, 2
	add rdx, r13

	mov r8w, word [rax]
	mov r9w, word [rdx]
	dec r8w
	dec r9w
	mov [rax],r8w
	mov [rdx],r9w


	mov rax, r10
	imul rax, r8
	mov rdx, r10
	imul rdx, r9
	add rax, r14
	add rdx, r15

	vpextrd [rax],xmm1,0
	vpextrb [rax+4], xmm1,4
	vpextrd [rdx],xmm2,0
	vpextrb [rdx+4], xmm2,4

	dec ecx
	jnz readsort4

	lea rbx, list1
	lea rsi, list2
	add rbx, 5000
	add rsi, 5000
	lea r14, tlist1
	lea r15, tlist2

	mov ecx,1000
	xor rdi,rdi
readsort5:
	xor r8,r8
	xor r9,r9
	sub rbx, 5
	sub rsi, 5
	movq xmm1, [rbx]
	movq xmm2, [rsi]
	pextrb r8d, xmm1, 0
	pextrb r9d, xmm2, 0

	mov rax,0
	imul rax, 10
	add rax, r8
	imul rax, 2
	add rax, r13

	mov rdx, 5
	imul rdx, 10
	add rdx, r9
	imul rdx, 2
	add rdx, r13

	mov r8w, word [rax]
	mov r9w, word [rdx]
	dec r8w
	dec r9w
	mov [rax],r8w
	mov [rdx],r9w


	mov rax, r10
	imul rax, r8
	mov rdx, r10
	imul rdx, r9
	add rax, r14
	add rdx, r15

	vpextrd [rax],xmm1,0
	vpextrb [rax+4], xmm1,4
	vpextrd [rdx],xmm2,0
	vpextrb [rdx+4], xmm2,4

	dec ecx
	jnz readsort5

	xor rax,rax

	lea rbx, tlist1
	lea rsi, tlist2
	mov rcx,125
adddistance:
	
	movdqu xmm0, [rbx]
	movdqu xmm1, [rsi]
	movdqu xmm2, [rbx+5]
	movdqu xmm3, [rsi+5]
	movdqu xmm4, [rbx+10]
	movdqu xmm5, [rsi+10]
	movdqu xmm6, [rbx+15]
	movdqu xmm7, [rsi+15]
	movdqu xmm8, [rbx+20]
	movdqu xmm9, [rsi+20]
	movdqu xmm10, [rbx+25]
	movdqu xmm11, [rsi+25]
	movdqu xmm12, [rbx+30]
	movdqu xmm13, [rsi+30]
	movdqu xmm14, [rbx+35]
	movdqu xmm15, [rsi+35]
sumshuffler:
	vpshufb xmm0,xmm0, [shuffler2]
	vpshufb xmm1,xmm1, [shuffler2]
	vpshufb xmm2,xmm2, [shuffler2]
	vpshufb xmm3,xmm3, [shuffler2]
	vpshufb xmm4,xmm4, [shuffler2]
	vpshufb xmm5,xmm5, [shuffler2]
	vpshufb xmm6,xmm6, [shuffler2]
	vpshufb xmm7,xmm7, [shuffler2]
	vpshufb xmm8,xmm8, [shuffler2]
	vpshufb xmm9,xmm9, [shuffler2]
	vpshufb xmm10,xmm10, [shuffler2]
	vpshufb xmm11,xmm11, [shuffler2]
	vpshufb xmm12,xmm12, [shuffler2]
	vpshufb xmm13,xmm13, [shuffler2]
	vpshufb xmm14,xmm14, [shuffler2]
	vpshufb xmm15,xmm15, [shuffler2]

	vpmullw xmm0,xmm0, [digimul]
	vpmullw xmm1,xmm1, [digimul]
	vpmullw xmm2,xmm2, [digimul]
	vpmullw xmm3,xmm3, [digimul]
	vpmullw xmm4,xmm4, [digimul]
	vpmullw xmm5,xmm5, [digimul]
	vpmullw xmm6,xmm6, [digimul]
	vpmullw xmm7,xmm7, [digimul]
	vpmullw xmm8,xmm8, [digimul]
	vpmullw xmm9,xmm9, [digimul]
	vpmullw xmm10,xmm10, [digimul]
	vpmullw xmm11,xmm11, [digimul]
	vpmullw xmm12,xmm12, [digimul]
	vpmullw xmm13,xmm13, [digimul]
	vpmullw xmm14,xmm14, [digimul]
	vpmullw xmm15,xmm15, [digimul]

adddigits:
	phaddw xmm0, xmm0
	phaddw xmm0, xmm0
	phaddw xmm0, xmm0
	phaddw xmm1, xmm1
	phaddw xmm1, xmm1
	phaddw xmm1, xmm1
	phaddw xmm2, xmm2
	phaddw xmm2, xmm2
	phaddw xmm2, xmm2
	phaddw xmm3, xmm3
	phaddw xmm3, xmm3
	phaddw xmm3, xmm3
	phaddw xmm4, xmm4
	phaddw xmm4, xmm4
	phaddw xmm4, xmm4
	phaddw xmm5, xmm5
	phaddw xmm5, xmm5
	phaddw xmm5, xmm5
	phaddw xmm6, xmm6
	phaddw xmm6, xmm6
	phaddw xmm6, xmm6
	phaddw xmm7, xmm7
	phaddw xmm7, xmm7
	phaddw xmm7, xmm7
	phaddw xmm8, xmm8
	phaddw xmm8, xmm8
	phaddw xmm8, xmm8
	phaddw xmm9, xmm9
	phaddw xmm9, xmm9
	phaddw xmm9, xmm9
	phaddw xmm10, xmm10
	phaddw xmm10, xmm10
	phaddw xmm10, xmm10
	phaddw xmm11, xmm11
	phaddw xmm11, xmm11
	phaddw xmm11, xmm11
	phaddw xmm12, xmm12
	phaddw xmm12, xmm12
	phaddw xmm12, xmm12
	phaddw xmm13, xmm13
	phaddw xmm13, xmm13
	phaddw xmm13, xmm13
	phaddw xmm14, xmm14
	phaddw xmm14, xmm14
	phaddw xmm14, xmm14
	phaddw xmm15, xmm15
	phaddw xmm15, xmm15
	phaddw xmm15, xmm15

zeroups:
	vpsrldq xmm0,xmm0,14
	vpsrldq xmm1,xmm1,14
	vpsrldq xmm2,xmm2,14
	vpsrldq xmm3,xmm3,14
	vpsrldq xmm4,xmm4,14
	vpsrldq xmm5,xmm5,14
	vpsrldq xmm6,xmm6,14
	vpsrldq xmm7,xmm7,14
	vpsrldq xmm8,xmm8,14
	vpsrldq xmm9,xmm9,14
	vpsrldq xmm10,xmm10,14
	vpsrldq xmm11,xmm11,14
	vpsrldq xmm12,xmm12,14
	vpsrldq xmm13,xmm13,14
	vpsrldq xmm14,xmm14,14
	vpsrldq xmm15,xmm15,14

movesums:
	vpslldq xmm2,xmm2,2
	vpslldq xmm3,xmm3,2
	vpslldq xmm4,xmm4,4
	vpslldq xmm5,xmm5,4
	vpslldq xmm6,xmm6,6
	vpslldq xmm7,xmm7,6
	vpslldq xmm8,xmm8,8
	vpslldq xmm9,xmm9,8
	vpslldq xmm10,xmm10,10
	vpslldq xmm11,xmm11,10
	vpslldq xmm12,xmm12,12
	vpslldq xmm13,xmm13,12
	vpslldq xmm14,xmm14,14
	vpslldq xmm15,xmm15,14

	vpor xmm0,xmm0,xmm14
	vpor xmm1,xmm1,xmm15
	vpor xmm2,xmm2,xmm12
	vpor xmm3,xmm3,xmm13
	vpor xmm4,xmm4,xmm10
	vpor xmm5,xmm5,xmm11
	vpor xmm6,xmm6,xmm8
	vpor xmm7,xmm7,xmm9
	
	vpor xmm0,xmm0,xmm6
	vpor xmm1,xmm1,xmm7
	vpor xmm2,xmm2,xmm4
	vpor xmm3,xmm3,xmm5

	vpor xmm0,xmm0,xmm2
	vpor xmm1,xmm1,xmm3

	vpsubw xmm2,xmm0,xmm1
	vpsraw xmm3,xmm2,15
	vpxor xmm2,xmm2,xmm3
	vpsubw xmm2, xmm2, xmm3

sumsumcum:
	phaddw xmm2,xmm2
	phaddw xmm2,xmm2
	phaddw xmm2,xmm2
abssum:
	xor rdx,rdx
	vpextrw edx,xmm2,0
	add rax, rdx

	add rbx, 40
	add rsi, 40
	dec rcx
	jnz adddistance
	
	xor rbx,rbx
nearend:
	mov rcx,8
	mov rsi,10
convertloop:
	xor rdx,rdx
	div rsi
	add rdx,48
	mov byte [output+rcx-1], dl

	dec rcx
	jnz convertloop
	mov byte [output+8],10

	
	sys_write 1,[output],10
end:
	sys_exit 0
