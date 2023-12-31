// RUN: %clang_cc1 -triple x86_64-apple-darwin -emit-llvm -o - %s| FileCheck %s

// CHECK: declare void @func(i64, double)
typedef struct _str {
  union {
    long double a;
    long c;
  };
} str;

void func(str s);
str ss;
void f9122143(void)
{
  func(ss);
}
