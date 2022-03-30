#include <stdint.h>
#include "b2_math.h"

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
b2Vec2* _b2Vec2_0() {
  return new b2Vec2();
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
b2Vec2* _b2Vec2_ctr_2(float x, float y) {
  return new b2Vec2(x, y);
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
float b2Vec2_Length_0(b2Vec2* self) {
  return self->Length();
}
