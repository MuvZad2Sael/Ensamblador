//#include <stdio.h>
#include <unistd.h> //read, write

//#include <sys/types.h>
//#include <sys/stat.h>
#include <fcntl.h> //open

#define T 500

int main(int argc, char** argv)
{
    const char *pathname = "prueba.txt";
    char buffer[5];
    int re;
    re = open(pathname, O_RDONLY);
    read(re,buffer,5);
    write(STDOUT_FILENO,buffer,5);
    return 0;
}