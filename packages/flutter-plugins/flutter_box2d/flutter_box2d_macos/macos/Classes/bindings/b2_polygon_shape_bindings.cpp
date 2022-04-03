#include "dart_bindings.h"
#include "b2_polygon_shape.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
b2PolygonShape* dart_bind_b2PolygonShape_b2PolygonShape_0() {
  return new b2PolygonShape();
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_Set_2(b2PolygonShape* self, b2Vec2* vertices, int vertexCount) {
  self->Set(vertices, vertexCount);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_SetAsBox_2(b2PolygonShape* self, float hx, float hy) {
  self->SetAsBox(hx, hy);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_SetAsBox_4(b2PolygonShape* self, float hx, float hy, b2Vec2* center, float angle) {
  self->SetAsBox(hx, hy, *center, angle);
}

DART_KEEPALIVE
int dart_bind_b2PolygonShape_GetType_0(b2PolygonShape* self) {
  return self->GetType();
}

DART_KEEPALIVE
int dart_bind_b2PolygonShape_GetChildCount_0(b2PolygonShape* self) {
  return self->GetChildCount();
}

DART_KEEPALIVE
bool dart_bind_b2PolygonShape_TestPoint_2(b2PolygonShape* self, b2Transform* xf, b2Vec2* p) {
  return self->TestPoint(*xf, *p);
}

DART_KEEPALIVE
bool dart_bind_b2PolygonShape_RayCast_4(b2PolygonShape* self, b2RayCastOutput* output, b2RayCastInput* input, b2Transform* transform, int childIndex) {
  return self->RayCast(output, *input, *transform, childIndex);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_ComputeAABB_3(b2PolygonShape* self, b2AABB* aabb, b2Transform* xf, int childIndex) {
  self->ComputeAABB(aabb, *xf, childIndex);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_ComputeMass_2(b2PolygonShape* self, b2MassData* massData, float density) {
  self->ComputeMass(massData, density);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2PolygonShape_get_m_centroid_0(b2PolygonShape* self) {
  return &self->m_centroid;
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_centroid_1(b2PolygonShape* self, b2Vec2* arg0) {
  self->m_centroid = *arg0;
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2PolygonShape_get_m_vertices_1(b2PolygonShape* self, int arg0) {
  return (array_bounds_check(sizeof(self->m_vertices) / sizeof(self->m_vertices[0]), arg0), &self->m_vertices[arg0]);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_vertices_2(b2PolygonShape* self, int arg0, b2Vec2* arg1) {
  (array_bounds_check(sizeof(self->m_vertices) / sizeof(self->m_vertices[0]), arg0), self->m_vertices[arg0] = *arg1);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2PolygonShape_get_m_normals_1(b2PolygonShape* self, int arg0) {
  return (array_bounds_check(sizeof(self->m_normals) / sizeof(self->m_normals[0]), arg0), &self->m_normals[arg0]);
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_normals_2(b2PolygonShape* self, int arg0, b2Vec2* arg1) {
  (array_bounds_check(sizeof(self->m_normals) / sizeof(self->m_normals[0]), arg0), self->m_normals[arg0] = *arg1);
}

DART_KEEPALIVE
int dart_bind_b2PolygonShape_get_m_count_0(b2PolygonShape* self) {
  return self->m_count;
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_count_1(b2PolygonShape* self, int arg0) {
  self->m_count = arg0;
}

DART_KEEPALIVE
int dart_bind_b2PolygonShape_get_m_type_0(b2PolygonShape* self) {
  return self->m_type;
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_type_1(b2PolygonShape* self, int arg0) {
  self->m_type = static_cast<b2Shape::Type>(arg0);
}

DART_KEEPALIVE
float dart_bind_b2PolygonShape_get_m_radius_0(b2PolygonShape* self) {
  return self->m_radius;
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape_set_m_radius_1(b2PolygonShape* self, float arg0) {
  self->m_radius = arg0;
}

DART_KEEPALIVE
void dart_bind_b2PolygonShape___destroy___0(b2PolygonShape* self) {
  delete self;
}