#include "b2_fixture.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
b2Fixture* dart_bind_b2Body_CreateFixture_1(b2Body* self, b2FixtureDef* shape) {
  return self->CreateFixture(shape);
}

DART_KEEPALIVE
b2Fixture* dart_bind_b2Body_CreateFixture_2(b2Body* self, b2Shape* shape, float density) {
  return self->CreateFixture(shape, density);
}

DART_KEEPALIVE
void dart_bind_b2Body_DestroyFixture_1(b2Body* self, b2Fixture* fixture) {
  self->DestroyFixture(fixture);
}

DART_KEEPALIVE
void dart_bind_b2Body_SetTransform_2(b2Body* self, const b2Vec2* position, float angle) {
  self->SetTransform(*position, angle);
}

DART_KEEPALIVE
const b2Transform* dart_bind_b2Body_GetTransform_0(b2Body* self) {
  return &self->GetTransform();
}

DART_KEEPALIVE
const b2Vec2* dart_bind_b2Body_GetPosition_0(b2Body* self) {
  return &self->GetPosition();
}

DART_KEEPALIVE
float dart_bind_b2Body_GetAngle_0(b2Body* self) {
  return self->GetAngle();
}

DART_KEEPALIVE
const b2Vec2* dart_bind_b2Body_GetWorldCenter_0(b2Body* self) {
  return &self->GetWorldCenter();
}

DART_KEEPALIVE
const b2Vec2* dart_bind_b2Body_GetLocalCenter_0(b2Body* self) {
  return &self->GetLocalCenter();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetLinearVelocity_1(b2Body* self, const b2Vec2* v) {
  self->SetLinearVelocity(*v);
}

DART_KEEPALIVE
const b2Vec2* dart_bind_b2Body_GetLinearVelocity_0(b2Body* self) {
  return &self->GetLinearVelocity();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetAngularVelocity_1(b2Body* self, float omega) {
  self->SetAngularVelocity(omega);
}

DART_KEEPALIVE
float dart_bind_b2Body_GetAngularVelocity_0(b2Body* self) {
  return self->GetAngularVelocity();
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyForce_3(b2Body* self, const b2Vec2* force, const b2Vec2* point, bool wake) {
  self->ApplyForce(*force, *point, wake);
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyForceToCenter_2(b2Body* self, const b2Vec2* force, bool wake) {
  self->ApplyForceToCenter(*force, wake);
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyTorque_2(b2Body* self, float torque, bool awake) {
  self->ApplyTorque(torque, awake);
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyLinearImpulse_3(b2Body* self, const b2Vec2* impulse, const b2Vec2* point, bool wake) {
  self->ApplyLinearImpulse(*impulse, *point, wake);
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyLinearImpulseToCenter_2(b2Body* self, const b2Vec2* impulse, bool wake) {
  self->ApplyLinearImpulseToCenter(*impulse, wake);
}

DART_KEEPALIVE
void dart_bind_b2Body_ApplyAngularImpulse_2(b2Body* self, float impulse, bool wake) {
  self->ApplyAngularImpulse(impulse, wake);
}

DART_KEEPALIVE
float dart_bind_b2Body_GetMass_0(b2Body* self) {
  return self->GetMass();
}

DART_KEEPALIVE
float dart_bind_b2Body_GetInertia_0(b2Body* self) {
  return self->GetInertia();
}

// "GetMassData" in b2_body.h doesn't take any arguments 
//   - did the emscripten bindings generator get it wrong?
//   - need to check what's gong on - review the JS bindings & the original C++
// DART_KEEPALIVE
// void dart_bind_b2Body_GetMassData_1(b2Body* self, b2MassData* data) {
//   self->GetMassData(data);
// }

DART_KEEPALIVE
void dart_bind_b2Body_SetMassData_1(b2Body* self, const b2MassData* data) {
  self->SetMassData(data);
}

DART_KEEPALIVE
void dart_bind_b2Body_ResetMassData_0(b2Body* self) {
  self->ResetMassData();
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetWorldPoint_1(b2Body* self, const b2Vec2* localPoint) {
  static b2Vec2 temp;
  return (temp = self->GetWorldPoint(*localPoint), &temp);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetWorldVector_1(b2Body* self, const b2Vec2* localVector) {
  static b2Vec2 temp;
  return (temp = self->GetWorldVector(*localVector), &temp);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetLocalPoint_1(b2Body* self, const b2Vec2* worldPoint) {
  static b2Vec2 temp;
  return (temp = self->GetLocalPoint(*worldPoint), &temp);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetLocalVector_1(b2Body* self, const b2Vec2* worldVector) {
  static b2Vec2 temp;
  return (temp = self->GetLocalVector(*worldVector), &temp);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetLinearVelocityFromWorldPoint_1(b2Body* self, const b2Vec2* worldPoint) {
  static b2Vec2 temp;
  return (temp = self->GetLinearVelocityFromWorldPoint(*worldPoint), &temp);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2Body_GetLinearVelocityFromLocalPoint_1(b2Body* self, const b2Vec2* localPoint) {
  static b2Vec2 temp;
  return (temp = self->GetLinearVelocityFromLocalPoint(*localPoint), &temp);
}

DART_KEEPALIVE
float dart_bind_b2Body_GetLinearDamping_0(b2Body* self) {
  return self->GetLinearDamping();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetLinearDamping_1(b2Body* self, float linearDamping) {
  self->SetLinearDamping(linearDamping);
}

DART_KEEPALIVE
float dart_bind_b2Body_GetAngularDamping_0(b2Body* self) {
  return self->GetAngularDamping();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetAngularDamping_1(b2Body* self, float angularDamping) {
  self->SetAngularDamping(angularDamping);
}

DART_KEEPALIVE
float dart_bind_b2Body_GetGravityScale_0(b2Body* self) {
  return self->GetGravityScale();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetGravityScale_1(b2Body* self, float scale) {
  self->SetGravityScale(scale);
}

DART_KEEPALIVE
void dart_bind_b2Body_SetType_1(b2Body* self, b2BodyType type) {
  self->SetType(type);
}

DART_KEEPALIVE
b2BodyType dart_bind_b2Body_GetType_0(b2Body* self) {
  return self->GetType();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetBullet_1(b2Body* self, bool flag) {
  self->SetBullet(flag);
}

DART_KEEPALIVE
bool dart_bind_b2Body_IsBullet_0(b2Body* self) {
  return self->IsBullet();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetSleepingAllowed_1(b2Body* self, bool flag) {
  self->SetSleepingAllowed(flag);
}

DART_KEEPALIVE
bool dart_bind_b2Body_IsSleepingAllowed_0(b2Body* self) {
  return self->IsSleepingAllowed();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetAwake_1(b2Body* self, bool flag) {
  self->SetAwake(flag);
}

DART_KEEPALIVE
bool dart_bind_b2Body_IsAwake_0(b2Body* self) {
  return self->IsAwake();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetEnabled_1(b2Body* self, bool flag) {
  self->SetEnabled(flag);
}

DART_KEEPALIVE
bool dart_bind_b2Body_IsEnabled_0(b2Body* self) {
  return self->IsEnabled();
}

DART_KEEPALIVE
void dart_bind_b2Body_SetFixedRotation_1(b2Body* self, bool flag) {
  self->SetFixedRotation(flag);
}

DART_KEEPALIVE
bool dart_bind_b2Body_IsFixedRotation_0(b2Body* self) {
  return self->IsFixedRotation();
}

DART_KEEPALIVE
b2Fixture* dart_bind_b2Body_GetFixtureList_0(b2Body* self) {
  return self->GetFixtureList();
}

DART_KEEPALIVE
b2JointEdge* dart_bind_b2Body_GetJointList_0(b2Body* self) {
  return self->GetJointList();
}

DART_KEEPALIVE
b2ContactEdge* dart_bind_b2Body_GetContactList_0(b2Body* self) {
  return self->GetContactList();
}

DART_KEEPALIVE
b2Body* dart_bind_b2Body_GetNext_0(b2Body* self) {
  return self->GetNext();
}

DART_KEEPALIVE
b2BodyUserData* dart_bind_b2Body_GetUserData_0(b2Body* self) {
  return &self->GetUserData();
}

DART_KEEPALIVE
b2World* dart_bind_b2Body_GetWorld_0(b2Body* self) {
  return self->GetWorld();
}

DART_KEEPALIVE
void dart_bind_b2Body_Dump_0(b2Body* self) {
  self->Dump();
}