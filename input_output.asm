section .data
    pesan db 'Masukkan angka: ', 0xA ; pesan
    panjangInputPesan equ $ - pesan

    outputPesan db 'Kamu memasukkan angka: ', 0xA
    panjangOutputPesan equ $ - outputPesan

section .bss
    inputAngka resb 5
    
section .text
    global _start

_start:
    ; output pesan
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan
    mov edx, panjangInputPesan
    int 0x80
    
    ; input angka
    mov eax, 3
    mov ebx, 0
    mov ecx, inputAngka
    mov edx, 5
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, outputPesan
    mov edx, panjangOutputPesan
    int 0x80
    
    ; output angka
    mov eax, 4
    mov ebx, 1
    mov ecx, inputAngka
    mov edx, 5
    int 0x80
    
    mov eax, 1
    mov ebx, 0
    int 0x80