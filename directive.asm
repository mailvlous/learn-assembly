; implementation of directive

SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

%assign count 1
%define HALO "hello"

section .text
    global _start

_start:
    ; Print the halo message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, pesan
    mov edx, panjangPesan
    int 0x80

    %assign count count + 1
    mov eax, count
    
    mov eax, SYS_EXIT
    int 0x80

section .data
    pesan db HALO, 0xA
    panjangPesan equ $ - pesan