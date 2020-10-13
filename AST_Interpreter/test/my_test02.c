extern int GET();
extern void *MALLOC(int);
extern void FREE(void *);
extern void PRINT(int);

// 动态指针数组

int main()
{
   int *a;
   a = (int *)MALLOC(4);
   *a = 10;

   int **b;
   b = (int **)MALLOC(8);
   *b = a;

   PRINT(**b);
}