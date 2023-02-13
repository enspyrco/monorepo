# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_box2c_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_box2c SHARED
  "flutter_box2c.c"
)

set_target_properties(flutter_box2c PROPERTIES
  PUBLIC_HEADER flutter_box2c.h
  OUTPUT_NAME "flutter_box2c"
)

target_compile_definitions(flutter_box2c PUBLIC DART_SHARED_LIB)
