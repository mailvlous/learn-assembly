#!bin/bash

nasm -f elf64 -o learn.o learn.asm
ld -o learn.exe learn.o;