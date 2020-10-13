extern int GET();
extern void *MALLOC(int);
extern void FREE(void *);
extern void PRINT(int);

// 动态数组

int main()
{
   int *a;
   a = (int *)MALLOC(sizeof(int) * 2);
   *a = 10;
   PRINT(*a);
}