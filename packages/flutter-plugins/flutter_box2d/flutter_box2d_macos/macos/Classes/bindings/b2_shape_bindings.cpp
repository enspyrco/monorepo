#include "b2_shape.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
int dart_bind_b2Shape_GetType_0(b2Shape* self) {
  return self->GetType();
}

DART_KEEPALIVE
int dart_bind_b2Shape_GetChildCount_0(b2Shape* self) {
  return self->GetChildCount();
}

DART_KEEPALIVE
bool dart_bind_b2Shape_TestPoint_2(b2Shape* self, b2Transform* xf, b2Vec2* p) {
  return self->TestPoint(*xf, *p);
}

DART_KEEPALIVE
bool dart_bind_b2Shape_RayCast_4(b2Shape* self, b2RayCastOutput* output, b2RayCastInput* input, b2Transform* transform, int childIndex) {
  return self->RayCast(output, *input, *transform, childIndex);
}

DART_KEEPALIVE
void dart_bind_b2Shape_ComputeAABB_3(b2Shape* self, b2AABB* aabb, b2Transform* xf, int childIndex) {
  self->ComputeAABB(aabb, *xf, childIndex);
}

DART_KEEPALIVE
void dart_bind_b2Shape_ComputeMass_2(b2Shape* self, b2MassData* massData, float density) {
  self->ComputeMass(massData, density);
}

DART_KEEPALIVE
int dart_bind_b2Shape_get_m_type_0(b2Shape* self) {
  return self->m_type;
}

DART_KEEPALIVE
void dart_bind_b2Shape_set_m_type_1(b2Shape* self, int arg0) {
  self->m_type = static_cast<b2Shape::Type>(arg0);
}

DART_KEEPALIVE
float dart_bind_b2Shape_get_m_radius_0(b2Shape* self) {
  return self->m_radius;
}

DART_KEEPALIVE
void dart_bind_b2Shape_set_m_radius_1(b2Shape* self, float arg0) {
  self->m_radius = arg0;
}

DART_KEEPALIVE
void dart_bind_b2Shape___destroy___0(b2Shape* self) {
  delete self;
}