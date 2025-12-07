%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x) = 5(2+x) ",0
msg_res  db "Результат: ",0
SECTION .bss
sum resb 1
SECTION .text
global _start
_start:
pop ecx
pop edx
sub ecx, 1
mov dword [sum],0
mov eax, msg_func
call sprintLF
jcxz _end
next_arg:
pop eax
call atoi
call _f_func
add [sum], eax
loop next_arg
_end:
mov eax, msg_res
call sprint
mov eax, [sum]
call iprintLF
call quit
_f_func:
push ebx
mov ebx, eax
add eax, 2
mov ecx, 5
mul ecx
pop ebx
ret