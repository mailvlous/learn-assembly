section .text
    global _start

_start:
    ; Memanggil syscall brk untuk mendapatkan alamat akhir dari heap
    mov eax, 45  ; syscall number untuk brk
    mov ebx, ebx ; mendapatkan alamat heap saat ini (tidak melakukan perubahan)
    int 0x80     ; menjalankan syscall
    
    ; Menambahkan 16KB ke heap (alokasi memori tambahan)
    add eax, 16384 ; 16KB = 16 * 1024
    mov ebx, eax  ; menetapkan nilai ebx untuk syscall berikutnya
    mov eax, 45   ; syscall number untuk brk
    int 0x80      ; menjalankan syscall untuk mengalokasikan memori tambahan
    
    ; Mengecek apakah alokasi berhasil
    cmp eax, 0  
    jl exit      ; Jika alokasi gagal (eax < 0), keluar dari program
    
    ; Mengatur pointer ke memori yang baru dialokasikan
    mov edi, eax ; Menyimpan alamat awal memori yang dialokasikan
    sub edi, 4   ; Menyesuaikan alamat ke 4 byte sebelum batas heap
    mov ecx, 4096 ; Mengatur jumlah pengisian ke 4KB (4 * 1024)
    xor eax, eax  ; Mengatur nilai yang akan diisi (0)
    std          ; Mengatur arah pengisian mundur (reverse direction)
    rep stosd    ; Mengisi memori dengan nilai 0 (menginisialisasi memori)
    cld          ; Mengembalikan arah pengisian ke default

    ; Menampilkan pesan ke layar menggunakan syscall write
    mov eax, 4          ; syscall number untuk sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, pesan      ; alamat string yang akan ditampilkan
    mov edx, panjangPesan ; panjang string
    int 0x80            ; menjalankan syscall untuk menampilkan pesan

exit:
    ; Keluar dari program dengan syscall exit
    mov eax, 1  ; syscall number untuk sys_exit
    xor ebx, ebx ; status exit = 0
    int 0x80    ; menjalankan syscall untuk keluar
    
section .data
    pesan db "16kb allocated", 10  ; Pesan output diakhiri dengan newline
    panjangPesan equ $ - pesan  ; Menghitung panjang pesan secara otomatis


////////////////////////////////////////////

; section .text
;     global _start

; _start:
;     ; 1. Dapatkan batas heap saat ini
;     mov eax, 45       ; Syscall brk
;     xor ebx, ebx      ; Tidak mengubah batas heap
;     int 0x80          ; Panggil syscall

;     ; 2. Tambahkan 16 KB (16 * 1024 byte) ke batas heap
;     add eax, 16384    ; Menambahkan 16 KB
;     mov ebx, eax      ; Simpan batas heap baru
;     mov eax, 45       ; Syscall brk untuk mengalokasikan memori
;     int 0x80          ; Panggil syscall

;     ; 3. Cek apakah alokasi berhasil
;     cmp eax, 0        ; Jika eax < 0, alokasi gagal
;     jl exit           ; Keluar jika gagal

;     ; 4. Simpan alamat heap baru di edi dan isi dengan nol
;     mov edi, eax      ; Alamat heap baru
;     mov ecx, 4096     ; Ukuran blok 4 KB
;     xor eax, eax      ; Isi dengan nol
;     rep stosd         ; Inisialisasi memori

;     ; 5. Tampilkan pesan sukses
;     mov eax, 4        ; Syscall write
;     mov ebx, 1        ; File descriptor 1 (stdout)
;     mov ecx, pesan    ; Pesan yang akan ditampilkan
;     mov edx, panjangPesan ; Panjang pesan
;     int 0x80          ; Panggil syscall

; exit:
;     mov eax, 1        ; Syscall exit
;     xor ebx, ebx      ; Status exit 0
;     int 0x80          ; Panggil syscall

; section .data
;     pesan db "16 KB allocated", 10
;     panjangPesan equ $ - pesan

// nasm -f elf64 -o memory.o memory.asm