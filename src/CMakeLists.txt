add_executable(
  someexe
  main.c
  )

add_dependencies(someexe somelib)

target_include_directories(
  someexe
  PRIVATE
  ${luajit_BINARY_DIR}
  )

target_link_libraries(
  someexe
  PRIVATE
  luajit::lib
  luajit::header
  )

add_custom_command(
  TARGET someexe POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_directory
      "$<TARGET_PROPERTY:somelib,BINARY_DIR>/$<$<BOOL:${CMAKE_CONFIGURATION_TYPES}>:$<CONFIG>>"
      "$<TARGET_PROPERTY:someexe,BINARY_DIR>/$<$<BOOL:${CMAKE_CONFIGURATION_TYPES}>:$<CONFIG>>"
  COMMAND ${CMAKE_COMMAND} -E copy
      "$<TARGET_PROPERTY:someexe,SOURCE_DIR>/main.lua"
      "$<TARGET_PROPERTY:someexe,BINARY_DIR>/$<$<BOOL:${CMAKE_CONFIGURATION_TYPES}>:$<CONFIG>>"
  )
