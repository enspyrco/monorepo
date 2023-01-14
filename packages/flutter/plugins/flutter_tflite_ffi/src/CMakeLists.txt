# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_tflite_ffi_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_tflite_ffi SHARED
  "flutter_tflite_ffi.c"
)

set_target_properties(flutter_tflite_ffi PROPERTIES
  PUBLIC_HEADER flutter_tflite_ffi.h
  OUTPUT_NAME "flutter_tflite_ffi"
)

target_compile_definitions(flutter_tflite_ffi PUBLIC DART_SHARED_LIB)
