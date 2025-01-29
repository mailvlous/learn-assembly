section .text
    global _start

_start:
    mov edx, panjang ; panjnag string
    mov ecx, pesan ; alamat pesan
    mov ebx, 1 ; standar output
    mov eax, 4 ; sistem call/write layar
    int 0x80 ; panggil kernel untuk memastikan output string
    
    mov edx, 9 ; panjang string
    mov ecx, bintang ; alamat bintang
    mov ebx, 1 ; standar output
    mov eax, 4 ; sistem call/write layar
    int 0x80 ; panggil kernel untuk memastikan output string
    
    mov eax, 1 ; sistem call/exit
    int 0x80 ; panggil kernel untuk keluar

section .data
    pesan db 'Hello', 0xA ; pesan
    panjang equ $ - pesan

    bintang times 9 db '*'
