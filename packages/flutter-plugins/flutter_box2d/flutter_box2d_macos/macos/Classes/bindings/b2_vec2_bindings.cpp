#include "b2_math.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
b2Vec2* dart_bind_b2Vec2_b2Vec2_0() {
  return new b2Vec2();
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Vec2_b2Vec2_2(float x, float y) {
  return new b2Vec2(x, y);
}

DART_KEEPALIVE
void dart_bind_b2Vec2_SetZero_0(b2Vec2* self) {
  self->SetZero();
}

DART_KEEPALIVE
void dart_bind_b2Vec2_Set_2(b2Vec2* self, float x, float y) {
  self->Set(x, y);
}

DART_KEEPALIVE
void dart_bind_b2Vec2_op_add_1(b2Vec2* self, const b2Vec2* v) {
  (*self += *v);
}

DART_KEEPALIVE
void dart_bind_b2Vec2_op_sub_1(b2Vec2* self, const b2Vec2* v) {
  (*self -= *v);
}

DART_KEEPALIVE
void dart_bind_b2Vec2_op_mul_1(b2Vec2* self, float s) {
  (*self *= s);
}

DART_KEEPALIVE
float dart_bind_b2Vec2_Length_0(b2Vec2* self) {
  return self->Length();
}

DART_KEEPALIVE
float dart_bind_b2Vec2_LengthSquared_0(b2Vec2* self) {
  return self->LengthSquared();
}

DART_KEEPALIVE
float dart_bind_b2Vec2_Normalize_0(b2Vec2* self) {
  return self->Normalize();
}

DART_KEEPALIVE
bool dart_bind_b2Vec2_IsValid_0(b2Vec2* self) {
  return self->IsValid();
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Vec2_Skew_0(b2Vec2* self) {
  static b2Vec2 temp;
  return (temp = self->Skew(), &temp);
}

DART_KEEPALIVE
float dart_bind_b2Vec2_get_x_0(b2Vec2* self) {
  return self->x;
}

DART_KEEPALIVE
void dart_bind_b2Vec2_set_x_1(b2Vec2* self, float arg0) {
  self->x = arg0;
}

DART_KEEPALIVE
float dart_bind_b2Vec2_get_y_0(b2Vec2* self) {
  return self->y;
}

DART_KEEPALIVE
void dart_bind_b2Vec2_set_y_1(b2Vec2* self, float arg0) {
  self->y = arg0;
}

DART_KEEPALIVE
void dart_bind_b2Vec2___destroy___0(b2Vec2* self) {
  delete self;
}