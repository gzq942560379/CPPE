extern int GET();
extern void * MALLOC(int);
extern void FREE(void *);
extern void PRINT(int);

// 全局变量 与 局部变量

int a;
int main() {
   a=100;
   int b = 200,c;
   PRINT(a);
   PRINT(b);
   PRINT(c);
}
