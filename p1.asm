SECTION .data
   prompt_1 db 'Please enter a single digit number: '
   prompt1_len equ $-prompt_1
   prompt_2 db 'Please enter a second single digit number: '
   prompt2_len equ $-prompt_2
   prompt_3 db 'The answer is: '
   prompt3_len equ $-prompt_3
   newline db 0xA

SECTION .bss
   num_1 RESB 1
   num_2 RESB 1
   result RESB 1

SECTION .text
   global _start

_start:
   ; prompt for num_1
   mov eax, 4
   mov ebx, 1
   mov ecx, prompt_1
   mov edx, prompt1_len
   int 80h
   
   ; read num_1
   mov eax, 3
   mov ebx, 0
   mov ecx, num_1
   mov edx, 5
   int 80h

   ; promt for num_2
   mov eax, 4
   mov ebx, 1
   mov ecx, prompt_2
   mov edx, prompt2_len
   int 80h

   ; read num_2
   mov eax, 3
   mov ebx, 0
   mov ecx, num_2
   mov edx, 5
   int 80h

   ; convert num_1 and num_2
   mov al, [num_1]
   sub al, '0'
   mov byte [num_1], al

   mov al, [num_2]
   sub al, '0'
   mov byte [num_2], al

   ; add num_1 and num_2
   mov al, [num_1]
   add al, [num_2]
   mov byte [result], al

   ; convert back to string
   mov al, [result]
   add al, '0'
   mov byte [result], al

   ; print result
   mov eax, 4
   mov ebx, 1
   mov ecx, prompt_3
   mov edx, prompt3_len
   int 80h

   mov eax, 4
   mov ebx, 1
   mov ecx, result
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
