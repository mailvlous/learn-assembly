section .data
    filename db "file.txt",
    text db "Hellow"

section .text
    global _start

_start:
    ; Open the file
    mov rax, SYS_OPEN
    mov rdi, filename
    mov rsi, O_CREA+O_WRONLY
    mov rdx, 0644o
    syscall
    
    push rax
    mov rdi, rax
    mov rax, SYS_WRITE
    mov rsi, text
    mov rdx, 17
    syscall

    mov rax, SYS_CLOSE
    pop rdi
    syscall
    
    exit