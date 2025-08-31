%include "asm_io.inc"
segment .data
    fp_print_format: db "%.3lf", 0
    neg1: dq -1
segment .bss
    real1: resq 1
    real2: resq 1
    imag1: resq 1
    imag2: resq 1
    re1: resq 1
    re2: resq 1
    re3: resq 1
    angle1: resq 1
    angle2: resq 1
    angle3: resq 1

segment .text
global asm_main
extern printf


asm_main:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    ; -------------------------

    ; get input first number
    call read_int
    mov qword[real1],rax
    call read_char
    call read_char
    mov r12,rax
    call read_char
    call read_int
    mov r13,rax
    cmp r12,45
    jz negeate
    mov qword[imag1],r13
    jmp con1
negeate:
    neg r13
    mov qword[imag1],r13
con1:
    call read_char
    call read_char
    



    ; get input second number
    call read_int
    mov qword[real2],rax
    call read_char
    call read_char
    mov r12,rax
    call read_char
    call read_int
    mov r13,rax
    cmp r12,45
    jz negeate2
    mov qword[imag2],r13
    jmp con2
negeate2:
    neg r13
    mov qword[imag2],r13
con2:
    call read_char
    call read_char


    mov rax,qword[real1] 
    imul qword[real1] 
    add rax,rdx
    mov r11,rax

    mov rax,qword[imag1] 
    imul qword[imag1] 
    add rax,rdx
    add r11,rax
    
    cvtsi2sd xmm0, r11 
    sqrtsd xmm0,xmm0
    movsd qword[re1],xmm0
    

    mov rax,qword[real2] 
    imul qword[real2] 
    add rax,rdx
    mov r11,rax

    mov rax,qword[imag2] 
    imul qword[imag2] 
    add rax,rdx
    add r11,rax
    
    cvtsi2sd xmm0, r11 
    sqrtsd xmm0,xmm0
    movsd qword[re2],xmm0

    movsd xmm1,qword[re1]
    divsd xmm1,xmm0
    movsd qword[re3],xmm1

    movsd xmm0,xmm1
    mov rdi, fp_print_format
    mov rax, 1
    call printf
    mov rdi,32
    call print_char
    mov rdi,'*' 
    call print_char
    mov rdi,32
    call print_char
    mov rdi,'e'
    call print_char

    fild qword [imag1]
    fild qword [real1]
    fpatan
    fstp qword [angle1]


    fild qword [imag2]
    fild qword [real2]
    fpatan
    fstp qword [angle2]

    mov rbx,-1
    cvtsi2sd xmm1,rbx
    movsd xmm0,qword[angle1]
    subsd xmm0,qword[angle2]
    divsd xmm0,xmm1
    movsd qword[angle3],xmm0

    movsd xmm0,qword[angle3]
    mov rdi, fp_print_format
    mov rax, 1
    call printf
    mov rdi,'i'
    call print_char
    call print_nl 
    ;--------------------------

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret   
