%include "asm_io.inc"
segment .data
    const: dq 10

segment .bss
    p: resq 1
    q: resq 1
    r: resq 1
    n: resq 1
    sum: resq 1

segment .text
global asm_main

asm_main:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8
    ; -------------------------
    call read_int
    mov qword[n],rax
    cmp qword[n],0
    jle end
main_circle:
; getting input
    mov qword[sum],0
    call read_int
    mov qword[p],rax
    call read_int
    mov qword[q],rax
    call read_int
    mov qword[r],rax 
    xor rbx,rbx ; rbx is the first collecter register
    mov r14,qword[r]
    mov r11,10
    mov r12,1
circle1:
    xor rdx,rdx 
    mov rax,r14
    div r11
; getting right most number in rax
    
    mov r13,rdx ; remainder in r13
    mov r14,rax ; ration in r14
    mov rax,r13
    imul r12 
    add rdx,rax
    add rbx,rdx
    ; p*p

    mov rax,r12
    imul qword[p]
    add rdx,rax
    mov r12,rdx

    cmp r14,0
    jnz circle1
    mov r11,1
circle2:
    xor rdx,rdx
    mov rax,rbx
    div qword[q]
    mov rbx,rax ; 


    mov rax,rdx 
    imul r11
    add rdx,rax
    add qword[sum],rdx

    mov rax,r11
    imul qword[const]
    add rdx,rax
    mov r11,rdx

    cmp rbx,0
    jnz circle2
    mov rdi, qword[sum]
    call print_int
    call print_nl
    sub qword[n],1
    cmp qword[n],0
    jnle main_circle
    ;--------------------------
end:
    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
