SECTION .data
	hello:      DB "Semenchenko Tatyana",10 
		helloLen:   EQU $ - hello
SECTION .text
	GLOBAL _start           

_start:                 
        mov eax, 4      
        mov ebx, 1    
        mov ecx, hello
        mov edx, helloLen
        int h80        
	
	mov eax, 1       
        mov ebx, 0      
        int h80        
