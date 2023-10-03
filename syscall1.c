#include <stdio.h>
#include <unistd.h>
#define T 500

int main(int argc, char** argv)
{
    __pid_t ret_value;
    printf("El id del proceso es %d\n",getpid());
    ret_value = fork();
    if(ret_value == 0)
    {
        printf("El id del proceso hijo es %d\n",getpid());
        sleep(T);
    }
    else
    {
        //wait();
        printf("El id del proceso padre es %d\n",getpid());
        sleep(T);
    }

    return 0;
}