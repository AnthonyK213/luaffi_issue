#ifndef _SOMELIB_H
#define _SOMELIB_H

#ifdef _WIN32
#define C_EXPORT __declspec(dllexport)
#else
#define C_EXPORT
#endif

typedef struct {
  double data[2];
} SomeStruct2;

typedef struct {
  double data[3];
} SomeStruct3;

typedef struct {
  double data[5];
} SomeStruct5;

C_EXPORT int some_func_2(const SomeStruct2 a, int *b);
C_EXPORT int some_func_3(const SomeStruct3 a, int *b);
C_EXPORT int some_func_5(const SomeStruct5 a, int *b);

#endif
