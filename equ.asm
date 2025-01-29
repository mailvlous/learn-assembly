; we can use equ or constant to alias a value

SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, pesan
    mov edx, panjangPesan
    int 0x80
    
    mov eax, SYS_EXIT
    int 0x80

section .data
    pesan db 'Hello, World!', 0xA
