global _start
section .text
_start:
    xor rax,rax
    mov di, '-l'
    push rdi
    mov rbx, rsp
    push rax
    mov rdi, '/bin//ls'
    push rdi
    mov rdi, rsp
    push rax
    push rbx
    push rdi
    mov rsi, rsp
    mov rdx, rax
    mov al,59
    syscall

;from pwn import *
;context(os="linux", arch="amd64", log_level="error")
;dir(shellcraft)
;syscall = shellcraft.execve(path='/bin/ls',argv=['/bin/ls','-l'])
;asm(syscall).hex()
;run_shellcode(unhex('48b8...2605')).interactive()

;pwn asm 'push rax'  -c 'amd64'
;pwn disasm '50' -c 'amd64'
;pwn disasm '48b8...af05' -c 'amd64'

;(gdb) info register rax rdi rsi rdx rsp
;rax            0x3b                59
;rdi            0x7fffffffdf18      140737488346904
;rsi            0x7fffffffdef0      140737488346864
;rdx            0x0                 0
;rsp            0x7fffffffdef0      0x7fffffffdef0
;(gdb) x/8xg $rsp
;0x7fffffffdef0: 0x00007fffffffdf08      0x00007fffffffdf10
;0x7fffffffdf00: 0x0000000000000000      0x00736c2f6e69622f
;0x7fffffffdf10: 0x0000000000006c2d      0x00736c2f6e69622f
;0x7fffffffdf20: 0x0000000000000001      0x00007fffffffe1a2
