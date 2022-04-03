#include "b2_shape.h"
#include "b2_fixture.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
int dart_bind_b2Fixture_GetType_0(b2Fixture* self) {
  return self->GetType();
}

DART_KEEPALIVE
b2Shape* dart_bind_b2Fixture_GetShape_0(b2Fixture* self) {
  return self->GetShape();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetSensor_1(b2Fixture* self, bool sensor) {
  self->SetSensor(sensor);
}

DART_KEEPALIVE
bool dart_bind_b2Fixture_IsSensor_0(b2Fixture* self) {
  return self->IsSensor();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetFilterData_1(b2Fixture* self, const b2Filter* filter) {
  self->SetFilterData(*filter);
}

DART_KEEPALIVE
const b2Filter* dart_bind_b2Fixture_GetFilterData_0(b2Fixture* self) {
  return &self->GetFilterData();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_Refilter_0(b2Fixture* self) {
  self->Refilter();
}

DART_KEEPALIVE
b2Body* dart_bind_b2Fixture_GetBody_0(b2Fixture* self) {
  return self->GetBody();
}

DART_KEEPALIVE
b2Fixture* dart_bind_b2Fixture_GetNext_0(b2Fixture* self) {
  return self->GetNext();
}

DART_KEEPALIVE
b2FixtureUserData* dart_bind_b2Fixture_GetUserData_0(b2Fixture* self) {
  return &self->GetUserData();
}

DART_KEEPALIVE
bool dart_bind_b2Fixture_TestPoint_1(b2Fixture* self, const b2Vec2* p) {
  return self->TestPoint(*p);
}

DART_KEEPALIVE
bool dart_bind_b2Fixture_RayCast_3(b2Fixture* self, b2RayCastOutput* output, const b2RayCastInput* input, int childIndex) {
  return self->RayCast(output, *input, childIndex);
}

DART_KEEPALIVE
void dart_bind_b2Fixture_GetMassData_1(b2Fixture* self, b2MassData* massData) {
  self->GetMassData(massData);
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetDensity_1(b2Fixture* self, float density) {
  self->SetDensity(density);
}

DART_KEEPALIVE
float dart_bind_b2Fixture_GetDensity_0(b2Fixture* self) {
  return self->GetDensity();
}

DART_KEEPALIVE
float dart_bind_b2Fixture_GetFriction_0(b2Fixture* self) {
  return self->GetFriction();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetFriction_1(b2Fixture* self, float friction) {
  self->SetFriction(friction);
}

DART_KEEPALIVE
float dart_bind_b2Fixture_GetRestitution_0(b2Fixture* self) {
  return self->GetRestitution();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetRestitution_1(b2Fixture* self, float restitution) {
  self->SetRestitution(restitution);
}

DART_KEEPALIVE
float dart_bind_b2Fixture_GetRestitutionThreshold_0(b2Fixture* self) {
  return self->GetRestitutionThreshold();
}

DART_KEEPALIVE
void dart_bind_b2Fixture_SetRestitutionThreshold_1(b2Fixture* self, float threshold) {
  self->SetRestitutionThreshold(threshold);
}

DART_KEEPALIVE
const b2AABB* dart_bind_b2Fixture_GetAABB_1(b2Fixture* self, int childIndex) {
  return &self->GetAABB(childIndex);
}

DART_KEEPALIVE
void dart_bind_b2Fixture_Dump_1(b2Fixture* self, int bodyIndex) {
  self->Dump(bodyIndex);
}

DART_KEEPALIVE
void dart_bind_b2Fixture___destroy___0(b2Fixture* self) {
  delete self;
}