SECTION .data
   prompt db "Please enter a two character string: "
   prompt_len equ $-prompt
   result db "The answer is: "
   result_len equ $-result
   newline db 0xA

SECTION .bss
   input_st RESB 5

SECTION .text
   global _start

_start:
   ; prompt for string
   mov eax, 4
   mov ebx, 1
   mov ecx, prompt
   mov edx, prompt_len
   int 80h

   ; read string
   mov eax, 3
   mov ebx, 0
   mov ecx, input_st
   mov edx, 5
   int 80h

   ; swap
   mov al, [input_st]
   mov ah, [input_st + 1]
   mov [input_st], ah
   mov [input_st + 1], al

   ; print result
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, result_len
   int 80h

   mov eax, 4
   mov ebx, 1
   mov ecx, input_st
   mov edx, 5
   int 80h

   ; print newline
   mov eax, 4
   mov ebx, 1
   mov ecx, newline
   mov edx, 1
   int 80h

   ; exit
   mov eax, 1
   xor ebx, ebx
   int 80h

