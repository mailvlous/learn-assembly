section .data
    pesan db "Hello World", 0xa; string yang akan dicetak di layar
    len equ $ - pesan ; baca panjang string pesan

section .text
    global _start   ; deklarasi _start sebagai global

_start:
    mov edx, len ; buat register panjang string
    mov ecx, pesan ; alamat dari pesan
    mov ebx, 1 ; standar output
    mov eax, 4 ; sistem call/write layear
    int 0x80 ; panggil kernel untuk memastikan output string

    mov eax, 1 ; sistem exit
    int 0x80

    

nasm -f elf64 -o learn.o learn.asm
ld -o learn.exe learn.o;