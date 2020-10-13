// extern int GET();
// extern void *MALLOC(int);
// extern void FREE(void *);
// extern void PRINT(int);

#include <stdlib.h>
#include <stdio.h>

void f(int a[2])
{
    PRINT(a[1]);
    a[1] = 3;
}

int main()
{
    int a[2];
    a[0] = 1;
    a[1] = 2;
    f(a);
    PRINT(a[1]);
}