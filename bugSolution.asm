section .data
    memory_limit dd 1000h ; Example memory limit

section .text
    global _start

_start:
    ; ... your code ...
    mov ebx, some_base_address ;Example base address
    mov esi, some_index ; Example index

    ; Bounds checking
    mov eax, ebx
    add eax, esi*4
    cmp eax, memory_limit ;Compare against memory limit
    jg error_handling ; Jump if above limit

    mov eax, [ebx+esi*4] ; Access memory only if address is valid

    ; ... rest of your code...

jmp exit_program

error_handling:
    ; Handle the error appropriately
    ; (e.g., print an error message, exit the program)
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80