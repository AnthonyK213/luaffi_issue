local ffi = require("ffi")

ffi.cdef [[
typedef struct {
  double data[2];
} SomeStruct2;

typedef struct {
  double data[3];
} SomeStruct3;

typedef struct {
  double data[5];
} SomeStruct5;

int some_func_2(const SomeStruct2 a, int *b);
int some_func_3(const SomeStruct3 a, int *b);
int some_func_5(const SomeStruct5 a, int *b);
]]

local somelib = ffi.load "somelib"

local some_struct_5 = ffi.new("SomeStruct5", { data = { 2, 3, 5, 7, 11 } })
local some_int_5 = ffi.new("int[1]", -5)
local ret_5 = somelib.some_func_5(some_struct_5, some_int_5) -- OK
print("5:", ret_5, some_int_5[0])

local some_struct_3 = ffi.new("SomeStruct3", { data = { 2, 3, 5 } })
local some_int_3 = ffi.new("int[1]", -3)
local ret_3 = somelib.some_func_3(some_struct_3, some_int_3) -- some_int_3 not changed
print("3:", ret_3, some_int_3[0])

local some_struct_2 = ffi.new("SomeStruct2", { data = { 2, 3 } })
local some_int_2 = ffi.new("int[1]", -2)
local ret_2 = somelib.some_func_2(some_struct_2, some_int_2) -- Segmentation fault
print("2:", ret_2, some_int_2[0])
