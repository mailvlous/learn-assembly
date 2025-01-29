; macro is like function or procedure for modular

%macro write_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start

_start:
    write_string pesan1, panjangPesan1
    write_string pesan2, panjangPesan2
    
    mov eax, 1
    int 0x80

section .data
    pesan1 db 'Hello, World!', 0xA
    panjangPesan1 equ $ - pesan1
    
    pesan2 db 'Goodbye, World!', 0xA
    panjangPesan2 equ $ - pesan2

    mov eax, 1
    int 0x80