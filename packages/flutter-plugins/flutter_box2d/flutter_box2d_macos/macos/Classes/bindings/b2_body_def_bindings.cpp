#include "b2_math.h"
#include "b2_body.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
b2BodyDef* dart_bind_b2BodyDef_b2BodyDef_0() {
  return new b2BodyDef();
}

DART_KEEPALIVE
b2BodyType dart_bind_b2BodyDef_get_type_0(b2BodyDef* self) {
  return self->type;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_type_1(b2BodyDef* self, b2BodyType arg0) {
  self->type = arg0;
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2BodyDef_get_position_0(b2BodyDef* self) {
  return &self->position;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_position_1(b2BodyDef* self, b2Vec2* arg0) {
  self->position = *arg0;
}

DART_KEEPALIVE
float dart_bind_b2BodyDef_get_angle_0(b2BodyDef* self) {
  return self->angle;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_angle_1(b2BodyDef* self, float arg0) {
  self->angle = arg0;
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2BodyDef_get_linearVelocity_0(b2BodyDef* self) {
  return &self->linearVelocity;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_linearVelocity_1(b2BodyDef* self, b2Vec2* arg0) {
  self->linearVelocity = *arg0;
}

DART_KEEPALIVE
float dart_bind_b2BodyDef_get_angularVelocity_0(b2BodyDef* self) {
  return self->angularVelocity;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_angularVelocity_1(b2BodyDef* self, float arg0) {
  self->angularVelocity = arg0;
}

DART_KEEPALIVE
float dart_bind_b2BodyDef_get_linearDamping_0(b2BodyDef* self) {
  return self->linearDamping;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_linearDamping_1(b2BodyDef* self, float arg0) {
  self->linearDamping = arg0;
}

DART_KEEPALIVE
float dart_bind_b2BodyDef_get_angularDamping_0(b2BodyDef* self) {
  return self->angularDamping;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_angularDamping_1(b2BodyDef* self, float arg0) {
  self->angularDamping = arg0;
}

DART_KEEPALIVE
bool dart_bind_b2BodyDef_get_allowSleep_0(b2BodyDef* self) {
  return self->allowSleep;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_allowSleep_1(b2BodyDef* self, bool arg0) {
  self->allowSleep = arg0;
}

DART_KEEPALIVE
bool dart_bind_b2BodyDef_get_awake_0(b2BodyDef* self) {
  return self->awake;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_awake_1(b2BodyDef* self, bool arg0) {
  self->awake = arg0;
}

DART_KEEPALIVE
bool dart_bind_b2BodyDef_get_fixedRotation_0(b2BodyDef* self) {
  return self->fixedRotation;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_fixedRotation_1(b2BodyDef* self, bool arg0) {
  self->fixedRotation = arg0;
}

DART_KEEPALIVE
bool dart_bind_b2BodyDef_get_bullet_0(b2BodyDef* self) {
  return self->bullet;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_bullet_1(b2BodyDef* self, bool arg0) {
  self->bullet = arg0;
}

DART_KEEPALIVE
bool dart_bind_b2BodyDef_get_enabled_0(b2BodyDef* self) {
  return self->enabled;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_enabled_1(b2BodyDef* self, bool arg0) {
  self->enabled = arg0;
}

DART_KEEPALIVE
b2BodyUserData* dart_bind_b2BodyDef_get_userData_0(b2BodyDef* self) {
  return &self->userData;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_userData_1(b2BodyDef* self, b2BodyUserData* arg0) {
  self->userData = *arg0;
}

DART_KEEPALIVE
float dart_bind_b2BodyDef_get_gravityScale_0(b2BodyDef* self) {
  return self->gravityScale;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef_set_gravityScale_1(b2BodyDef* self, float arg0) {
  self->gravityScale = arg0;
}

DART_KEEPALIVE
void dart_bind_b2BodyDef___destroy___0(b2BodyDef* self) {
  delete self;
}
