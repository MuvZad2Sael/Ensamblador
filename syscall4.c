#include <stdio.h>
#include <unistd.h> //read, write, getuid

//#include <sys/types.h>
//#include <sys/stat.h>
#include <fcntl.h> //open

int main(int argc, char** argv)
{
    const char *pathname = "protegido.txt";
    char buffer[10];
    int re;

    re = seteuid(1000);
    printf("El usuario es %d, %d\n",geteuid(),getuid());
    re = seteuid(0);
    printf("El usuario es %d, %d\n",geteuid(),getuid());

    re = open(pathname, O_RDONLY);
    read(re,buffer,16);
    write(STDOUT_FILENO,buffer,16);
    return 0;
}

//Despues de compilar
//echo "mensaje secreto" > protegido.txt
//sudo chown root:root protegido.txt
//chmod o-rw protegido.txt
//sudo chown root:root syscall4
//sudo chmod 4755 syscall4
//mensaje secreto