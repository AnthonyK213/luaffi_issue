cmake_minimum_required(VERSION 3.20)

project(
  luaffi_issue
  LANGUAGES C
  )

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_EXTENSIONS OFF)

set(LUAJIT_DIR ${CMAKE_BINARY_DIR}/deps/LuaJIT_Source CACHE STRING "")

include(cmake/FetchLuaJIT.cmake)

add_subdirectory(lib)
add_subdirectory(src)
