%include 'in_out.asm'
section		.data
    msg_b db 'Введите B: ',0h
    msg_a db 'Введите A: ',0h
    msg_c db 'Введите C: ',0h
    msg_result db "Наименьшее число: ",0h
section .bss
    min resb 10
    B	 resb 10
    A	resb 10
    C	resb 10
section		.text
    global _start
_start:
    mov eax,msg_a
    call sprint
    mov ecx,A
    mov edx,10
    call sread
    mov eax, A
    call atoi
    mov [A], eax
    mov eax, msg_b
    call sprint
    mov ecx, B
    mov edx, 10
    call sread
    mov eax, B
    call atoi
    mov [B], eax
    mov eax, msg_c
    call sprint
    mov ecx, C
    mov edx, 10
    call sread
    mov eax, C
    call atoi
    mov [C], eax
    mov eax, [A]
    cmp eax, [B]
    jl check_c
    mov eax, [B]
check_c:
    cmp eax, [C]
    jl print_min
    mov eax, [C]
print_min:
    mov [min], eax
    mov eax, msg_result
    call sprint
    mov eax, [min]
    call iprintLF
    call quit