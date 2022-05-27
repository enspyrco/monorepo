# JS Interop Notes

`box2d_glue.js` comes from the `box2d-wasm` project which uses
emscripten to generate C++ and JS bindings that are then used
to compile the WASM.

The Dart/JS interop that we write interops with the JS in
`box2d_glue.js`.  

The file `box2d_glue.js` can be found in
`flutter_box2d_web/docs/js_interop`.
