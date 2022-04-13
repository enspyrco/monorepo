# flutter_box2d > bindings > webidl

*Use emscripten's `WebIDL.py` parser to create Dart/C & Dart/JS bindings.*

Run with:

```sh
python3 parse.py Box2D.idl
```

> Emscripten requires python > 3.? (need ref) but I don't know if the small subset we are using has the same requirement.

## Setup

[box2d-wasm/box2d-wasm README.dev.md] has instructions for how to get your `EMSCRIPTEN_DIR`, for me it is:
`EMSCRIPTEN_DIR=/opt/homebrew/Cellar/emscripten/3.1.7/libexec`

- I copied the parser: `$EMSCRIPTEN_DIR/third_party/WebIDL.py`
- I copied the generator script: `$EMSCRIPTEN_DIR/tools/webidl_binder.py`.  
  - and replicated what was done there, taking the `read_file` function from `$EMSCRIPTEN_DIR/tools/utils.py`.
- The result is in `flutter_box2d/bindings/webidl/parse_and_generate.py`

## References

[Notion > Python]
[Notion > Box2D Plugin]

[Notion > Python]: https://www.notion.so/reference-material/Python-95a568bb1c6f448e8931781daf9060ce
[Notion > Box2D Plugin]: https://www.notion.so/enspyrco/Box2D-Plugin-3d3dc861ee4f439eb7e26deee3bac40a
[box2d-wasm/box2d-wasm README.dev.md]: https://github.com/Birch-san/box2d-wasm/blob/master/box2d-wasm/README.dev.md
