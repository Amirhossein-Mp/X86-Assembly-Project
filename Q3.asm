%include "asm_io.inc"
segment .data 
    const: dq 10
segment .bss
    n: resq 1
    decimal: resq 10
    binary: resq 40
    count1: resq 1
    count2: resq 1
    count_decimal: resq 1
    count_binary: resq 1 
    first_certificate: resq 1
    second_certificate: resq 1
    p: resq 1
    q: resq 1
    r: resq 1
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
    ; ---------------------
    call read_int
    dec rax
    mov qword[n],rax
    xor r12,r12
main_loop:
    cmp r12,qword[n]
    jnle end
    push r12
    mov r13,r12
    mov r15,r12 
    mov r12,10
    xor r14,r14
getting_count_decimal:
    mov rax,r13
    xor rdx,rdx
    div r12
    mov qword[decimal+r14*8],rdx
    mov r13,rax
    add r14,1
    cmp r13,0
    jnz getting_count_decimal 
    mov qword[count_decimal],r14
    ; number of digits is ready in qword[count_decimal] & r14
    mov rax,r14
    xor rdx,rdx
    mov r12,2
    div r12
    dec rax
    ; half-1 is in rax
    xor rsi,rsi
first_check:
    cmp rsi,rax
    jnle true
    ; when jumping the number is palindirom
    mov rbx,qword[decimal+rsi*8]
    cmp rbx,qword[decimal+r14*8-8]
    jnz false
    dec r14
    inc rsi 
    jmp first_check

false:
    pop r12
    jmp cloop
true:
    ; decimal is palidirom
    call convert_to_binary
    mov r14,qword[count_binary]
    mov rax,r14
    xor rdx,rdx
    mov r12,2
    div r12
    dec rax
    ; half-1 is in rax
    xor rsi,rsi
second_check:
    cmp rsi,rax
    jnle Yes
    ; when jumping the number is palindirom
    mov rbx,qword[binary+rsi*8]
    cmp rbx,qword[binary+r14*8-8]
    jnz false
    dec r14
    inc rsi 
    jmp second_check
Yes:
    pop r12
    mov rdi,r12
    call print_int
    call print_nl
cloop:
    inc r12
    jmp main_loop
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
convert_to_binary:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8
    ; -------------------------
; getting input
    mov qword[binary],0
    mov qword[p],10
    mov qword[q],2
    mov qword[r],r15 
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

    xor rsi,rsi
circle:
    xor rdx,rdx
    mov rax,rbx
    div qword[q]
    mov rbx,rax 
    mov qword[binary+rsi*8],rdx 
    inc rsi
    cmp rbx,0
    jnz circle
    mov qword[count_binary],rsi
    ;--------------------------
    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
