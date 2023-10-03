global _start
section .text
_start:
    mov    al, 0x1
    xor   rax,rax
    push rax
    mov rax,  0x7461632f6e69622f
    push   rax
    mov    rdi,  rsp
    mov rax,  0x101010101010101
    push   rax
    mov rax,  0x1622f326d6d6062
    xor    [rsp],  rax
    mov rax,  0x7379732f726f6461
    push   rax
    mov rax,  0x101010101010101
    push   rax
    mov rax,  0x6d636c60726f4401
    xor    [rsp],  rax
    mov rax,  0x7461632f6e69622f
    push   rax
    xor    esi,  esi
    push   rsi
    push   0x11
    pop    rsi
    add    rsi,  rsp
    push   rsi
    push   0x10
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
;syscall = shellcraft.execve(path='/bin/ls',argv=['/bin/ls','-l'])
;asm(syscall).hex()
;run_shellcode(unhex('48b8...2605')).interactive()

;pwn asm 'push rax'  -c 'amd64'
;pwn disasm '50' -c 'amd64'
;pwn disasm '48b8...af05' -c 'amd64'

;(gdb) info register rax rdi rsi rdx rsp
;rax            0x3b                59
;rdi            0x7fffffffdf20      140737488346912
;rsi            0x7fffffffdee8      140737488346856
;rdx            0x0                 0
;rsp            0x7fffffffdee8      0x7fffffffdee8
;(gdb) x/12xg $rsp
;0x7fffffffdee8: 0x00007fffffffdf00      0x00007fffffffdf09
;0x7fffffffdef8: 0x0000000000000000      0x7461632f6e69622f
;0x7fffffffdf08: 0x6c626d61736e4500      0x7379732f726f6461
;0x7fffffffdf18: 0x00632e336c6c6163      0x7461632f6e69622f
;0x7fffffffdf28: 0x0000000000000000      0x0000000000000001
;0x7fffffffdf38: 0x00007fffffffe1ba      0x0000000000000000
