global _start
section .text

;execve("/bin//sh", ["/bin//sh"], NULL)
;
;rax -> 59 (execve syscall number)
;rdi -> ['/bin//sh'] (pointer to program to execute)
;rsi -> ['/bin//sh'] (list of pointers for arguments)
;rdx -> NULL (no environment variables)

_start:
    mov rax, 59         ; execve syscall number
    push 0              ; push NULL string terminator
    mov rdi, '/bin//sh' ; first arg to /bin/sh
    push rdi            ; push to stack 
    mov rdi, rsp        ; move pointer to ['/bin//sh']
    push 0              ; push NULL string terminator
    push rdi            ; push second arg to ['/bin//sh']
    mov rsi, rsp        ; pointer to args
    mov rdx, 0          ; set env to NULL
    syscall