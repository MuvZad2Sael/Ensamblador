#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    //char *args[] = {"/bin/bash",NULL};
    char *args[] = {"/bin/cat","dos.s",NULL};
    execv(args[0],args);
    return 0;
} 