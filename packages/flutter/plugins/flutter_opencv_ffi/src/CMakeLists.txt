project(flutter_opencv_ffi_library)
cmake_minimum_required(VERSION 3.10)

########################
### OpenCV
########################

# Specifies the lib_opencv shared lib
add_library(lib_opencv SHARED IMPORTED)
# Defines the location of the opencv shared library.
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../android/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so)

########################
### NDK libs
########################

find_library( 
  # Defines the name of the path variable that stores the location of the NDK library.
  log-lib

  # Specifies the name of the NDK library that CMake needs to locate.
  log
)

########################
### C++ glue code
########################

# Specifies the flutter_opencv_ffi shared lib
add_library(flutter_opencv_ffi SHARED flutter_opencv_ffi.cpp)

# Includes the opencv headers in the src directory.
target_include_directories(flutter_opencv_ffi PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

########################
### Linking
########################

target_link_libraries(
  # Specifies the target library.
  flutter_opencv_ffi

  # Links the target library to the opencv library.
  lib_opencv 
  
  # Links the target library to the log library included in the NDK.
  ${log-lib}
)
