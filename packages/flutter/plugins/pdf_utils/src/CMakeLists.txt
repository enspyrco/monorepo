# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(pdf_utils_library VERSION 0.0.1 LANGUAGES C)

add_library(pdf_utils SHARED
  "pdf_utils.c"
)

set_target_properties(pdf_utils PROPERTIES
  PUBLIC_HEADER pdf_utils.h
  OUTPUT_NAME "pdf_utils"
)

target_compile_definitions(pdf_utils PUBLIC DART_SHARED_LIB)
