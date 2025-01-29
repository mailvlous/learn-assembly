. general register; 
// rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15
eax -> arithmetic operation/inpout/output
ebx -> base pointer
ecx -> counter/iteration counter
edx -> perkalian dan pembagian/operasi ; buat register panjang string

eip -> instruction pointer
esp -> stack pointer ; alamat terakhir yang digunakan
ebp -> base pointer ; alamat awal yang digunakan

esi -> source index
edi -> destination index

. control register;
zf -> zero flag ; menunjukkan jika hasil operasi adalah 0
cf -> carry flag ; 
sf -> sign flag ; menunjukkan hasil operasi adalah negatif/positif


--------------- define ----------------

DEFINE DIRECTIVE -> untuk mendefinisikan variabel

db -> define byte 1 byte
dw -> define word 2 byte
dd -> define double word 4 byte
dq -> define quad word 8 byte
dt -> define ten bytes 10 byte

yes db 'y' -> 'y' adalah ascii otomatis diconvert dalam hexadesimal yaitu 79h ; db bisa digunakan untuk string, karakter, dan angka sesuai de
angka dw 1234 ; dw bisa digunakan untuk angka
angka_negatif dw -2345678 ; dd bisa digunakan untuk angka negatif
angka_besar dq 1234567890123456 ; dq bisa digunakan untuk angka besar
pi dd 3.14 ; dt bisa digunakan untuk angka riil

little endian order -> 1234 -> 34 12 ; nilai byte terkecil diletakkan lebih dulu

RESERVE DIRECTIVE -> untuk mendefinisikan variabel tanpa nilai

resb -> reserve byte
resw -> reserve word
resd -> reserve double word
resq -> reserve quad word
rest -> reserve ten bytes

buffer resb 64 ; buffer dengan 64 byte
array resw 10 ; array dengan 10 word
matrix resd 16 ;

times -> untuk mendefinisikan variabel sebanyak n kali
array times 10 dw 0 ; array dengan 10 word dengan nilai 0 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

--------------- constant ----------------

equ is like const
panjang equ 5 ; panjang = 5
lebar equ 3 ; lebar = 3
luas equ panjang * lebar ; luas = 5 * 3 = 15