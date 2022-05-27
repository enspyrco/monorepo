# flutter_box2d_macos

## Native Unit Testing

The unit tests are done in `flutter_box2d/example/macos/RunnerTests`

Currently we copy `flutter_box2d_macos/macos/Classes/bindings/box2d_glue.cpp` to
`flutter_box2d/example/macos/RunnerTests/box2d_glue.h`

- we need a header file to access the functions in `box2d_glue.cpp`
- the easiest way I found was just to copy and change to a header file
- when we get our bindings generator to generate a valid box2d_glue.cpp,
  we will have the bindings generator script copy the box2d_glue.cpp as a header
