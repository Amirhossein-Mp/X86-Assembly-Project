%include "asm_io.inc"
segment .data


segment .bss
    date1: resq 6

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
    xor r9,r9 ; for saving seconds
    xor rbx,rbx ; for second
    xor r8,r8  ;for minute
    xor rsi,rsi ; for hour
    xor rdx,rdx ; for day
    xor rcx,rcx ; for month
    ; -------------------------

    call read_int
    mov [date1],rax

    call read_int
    mov [date1+8],rax



    call read_int
    mov [date1+16],rax



    call read_int
    mov [date1+24],rax



    call read_int
    mov [date1+32],rax




    call read_int
    mov [date1+40],rax




    call read_int
    add rax,[date1]
    mov [date1],rax



    call read_int
    add rax,[date1+8]
    mov [date1+8],rax


    call read_int
    add rax,[date1+16]
    mov [date1+16],rax



    call read_int
    add rax,[date1+24]
    mov [date1+24],rax



    call read_int
    add rax,[date1+32]
    mov [date1+32],rax




    call read_int
    add rax,[date1+40]
    mov [date1+40],rax




    cmp qword[date1+40],59
    jle continue1
    add qword[date1+32],1
    sub qword[date1+40],60
continue1:

    cmp qword[date1+32],59
    jle continue2
    add qword[date1+24],1
    sub qword[date1+32],60
continue2:

    cmp qword[date1+24],23
    jle continue3
    add qword[date1+16],1
    sub qword[date1+24],24
continue3:

    cmp qword[date1+16],30
    jle continue4
    add qword[date1+8],1
    sub qword[date1+16],30
continue4:

    cmp qword[date1+8],12
    jle continue5
    add qword[date1],1
    sub qword[date1+8],12

continue5:


    mov rax,[date1]
    xor rdx,rdx
    mov r12,10000
    div r12
    cmp rax,0
    jz cont
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    jmp con1
cont:
    mov rax,[date1]
    xor rdx,rdx
    mov r12,1000
    div r12
    cmp rax,0
    jnz loop1
    mov rax,[date1]
    xor rdx,rdx
    mov r12,100
    div r12
    cmp rax,0
    jnz loop2
    mov rax,[date1]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz loop3
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    mov rdi,[date1]
    call print_int
    jmp con1
loop1:
    mov rdi,[date1]
    call print_int
    jmp con1
loop2:
    mov rdi,0
    call print_int
    mov rdi,[date1]
    call print_int
    jmp con1
loop3:
    mov rdi,0
    call print_int
    mov rdi,0
    call print_int
    mov rdi,[date1]
    call print_int

con1:
    mov rdi,32
    call print_char

    mov rax,[date1+8]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz l1
    mov rdi,0
    call print_int
l1:
    mov rdi,[date1+8]
    call print_int
    mov rdi,32
    call print_char

    mov rax,[date1+16]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz l2
    mov rdi,0
    call print_int
l2:
    mov rdi,[date1+16]
    call print_int
    mov rdi,32
    call print_char

    mov rax,[date1+24]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz l3
    mov rdi,0
    call print_int
l3:
    mov rdi,[date1+24]
    call print_int
    mov rdi,32
    call print_char

    mov rax,[date1+32]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz l4
    mov rdi,0
    call print_int
l4:
    mov rdi,[date1+32]
    call print_int
    mov rdi,32
    call print_char

    mov rax,[date1+40]
    xor rdx,rdx
    mov r12,10
    div r12
    cmp rax,0
    jnz l5
    mov rdi,0
    call print_int
l5:
    mov rdi,[date1+40]
    call print_int
    mov rdi,32
    call print_char

    ;--------------------------

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
