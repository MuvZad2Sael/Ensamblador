global _start
section .text
_start:
main:
    push 05
    push 09
    push 1994
    call parte1
    call parte2

parte1:    
    push 50
    push 20
    mov rax, [rsp]
    lea rbx, [rsp+8]
    imul rax, [rsp+8]
    push rax
    pop rax
    pop rax
    pop rax
    ret
parte2:
    xor rax,rax
    mov al,60
    xor rdi,rdi
    syscall
    ret