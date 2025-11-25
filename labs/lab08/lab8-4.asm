%include 'in_out.asm'
section .data
msg db "Функция: f(x)=5(2+x)",0
result db "Результат: ",0
section .text
global _start
_start:
    pop ecx
    pop edx
    sub ecx,1
    mov esi, 0
    mov eax, msg
    call sprintLF
    cmp ecx, 0
    jz _end
next:
    pop eax
    call atoi
    add eax,2
    mov ebx,5
    imul ebx
    add esi, eax
    loop next
_end:
    mov eax, result
    call sprint
    mov eax, esi
    call iprintLF
    call quit