# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ffi_plugin_template_library VERSION 0.0.1 LANGUAGES C)

add_library(ffi_plugin_template SHARED
  "ffi_plugin_template.c"
)

set_target_properties(ffi_plugin_template PROPERTIES
  PUBLIC_HEADER ffi_plugin_template.h
  OUTPUT_NAME "ffi_plugin_template"
)

target_compile_definitions(ffi_plugin_template PUBLIC DART_SHARED_LIB)
