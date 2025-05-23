include(FetchContent)

FetchContent_Declare(
  LuaJIT_Source
  GIT_REPOSITORY https://github.com/LuaJIT/LuaJIT
  GIT_TAG origin/v2.1
  GIT_SHALLOW 1
  SOURCE_DIR ${CMAKE_BINARY_DIR}/deps/LuaJIT_Source
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  )

FetchContent_Declare(
  LuaJIT
  GIT_REPOSITORY https://github.com/zhaozg/luajit-cmake
  GIT_TAG origin/master
  GIT_SHALLOW 1
  SOURCE_DIR ${CMAKE_BINARY_DIR}/deps/luajit-cmake
  )

# FetchContent_MakeAvailable(LuaJIT_Source)
FetchContent_GetProperties(LuaJIT_Source)
if(NOT luajit_source_POPULATED)
  FetchContent_Populate(LuaJIT_Source)
endif()

# FetchContent_MakeAvailable(LuaJIT)
FetchContent_GetProperties(LuaJIT)
if(NOT luajit_POPULATED)
  FetchContent_Populate(LuaJIT)
  add_subdirectory(
    ${luajit_SOURCE_DIR}
    ${luajit_BINARY_DIR}
    EXCLUDE_FROM_ALL
    )

  target_include_directories(
    buildvm
    PRIVATE
    ${luajit_BINARY_DIR}
    )
endif()
