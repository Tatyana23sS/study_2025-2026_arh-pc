%include 'in_out.asm'
section .data
    msg_x db "Введите x: ",0
    msg_a db "Введите a: ",0
    msg_res db "Результат: ",0
section .bss
    x resb 10
    a resb 10
section .text
global _start
 _start:
     mov eax, msg_x
     call sprint
     mov ecx, x
     mov edx, 10
     call sread
     mov eax, x
     call atoi
     mov [x], eax
     mov eax, msg_a
     call sprint
     mov ecx, a
     mov edx, 10
     call sread
     mov eax, a
     call atoi
     mov [a], eax
     mov ebx, [x]
     cmp ebx, 2
     jg branch_x_gt_2
     mov eax, [a]
     mov ebx, 3
     mul ebx
     jmp print_result
branch_x_gt_2:
    mov eax, [x]
    sub eax, 2
print_result:
    mov edi, eax
    mov eax, msg_res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
