# flutter_box2d > bindings > ffigen

Emscripten creates a C++ glue file that has C headers that can be accessed via Dart's FFI.

> It seems however that ffigen doesn't work on the C headers because they include C++ that isn't valid C - at least that is my interpretation at this point.

The following struct is in `b2_settings.h` which seems to be required by the headers in `glue.cpp` - I think this is valid C++ but not C so breaks the `ffigen`.

```C++
typedef unsigned long           uintptr_t;

struct b2BodyUserData
{
  b2BodyUserData()
  {
    pointer = 0;
  }

  /// For legacy compatibility
  uintptr_t pointer;
};
```
