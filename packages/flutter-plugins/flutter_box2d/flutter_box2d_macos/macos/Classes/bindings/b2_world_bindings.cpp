#include "b2_world.h"

#define DART_KEEPALIVE extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_KEEPALIVE
b2World* dart_bind_b2World_b2World_1(const b2Vec2* gravity) {
  return new b2World(*gravity);
}

DART_KEEPALIVE
void dart_bind_b2World_SetDestructionListener_1(b2World* self, b2DestructionListener* listener) {
  self->SetDestructionListener(listener);
}

// DART_KEEPALIVE
// void dart_bind_b2World_SetContactFilter_1(b2World* self, JSContactFilter* filter) {
//   self->SetContactFilter(filter);
// }

// DART_KEEPALIVE
// void dart_bind_b2World_SetContactListener_1(b2World* self, JSContactListener* listener) {
//   self->SetContactListener(listener);
// }

DART_KEEPALIVE
void dart_bind_b2World_SetDebugDraw_1(b2World* self, b2Draw* debugDraw) {
  self->SetDebugDraw(debugDraw);
}

DART_KEEPALIVE
b2Body* dart_bind_b2World_CreateBody_1(b2World* self, const b2BodyDef* def) {
  return self->CreateBody(def);
}

DART_KEEPALIVE
void dart_bind_b2World_DestroyBody_1(b2World* self, b2Body* body) {
  self->DestroyBody(body);
}

DART_KEEPALIVE
b2Joint* dart_bind_b2World_CreateJoint_1(b2World* self, const b2JointDef* def) {
  return self->CreateJoint(def);
}

DART_KEEPALIVE
void dart_bind_b2World_DestroyJoint_1(b2World* self, b2Joint* joint) {
  self->DestroyJoint(joint);
}

DART_KEEPALIVE
void dart_bind_b2World_Step_3(b2World* self, float timeStep, int velocityIterations, int positionIterations) {
  self->Step(timeStep, velocityIterations, positionIterations);
}

DART_KEEPALIVE
void dart_bind_b2World_ClearForces_0(b2World* self) {
  self->ClearForces();
}

DART_KEEPALIVE
void dart_bind_b2World_DebugDraw_0(b2World* self) {
  self->DebugDraw();
}

DART_KEEPALIVE
void dart_bind_b2World_QueryAABB_2(b2World* self, b2QueryCallback* callback, b2AABB* aabb) {
  self->QueryAABB(callback, *aabb);
}

DART_KEEPALIVE
void dart_bind_b2World_RayCast_3(b2World* self, b2RayCastCallback* callback, b2Vec2* point1, b2Vec2* point2) {
  self->RayCast(callback, *point1, *point2);
}

DART_KEEPALIVE
b2Body* dart_bind_b2World_GetBodyList_0(b2World* self) {
  return self->GetBodyList();
}

DART_KEEPALIVE
b2Joint* dart_bind_b2World_GetJointList_0(b2World* self) {
  return self->GetJointList();
}

DART_KEEPALIVE
b2Contact* dart_bind_b2World_GetContactList_0(b2World* self) {
  return self->GetContactList();
}

DART_KEEPALIVE
void dart_bind_b2World_SetAllowSleeping_1(b2World* self, bool flag) {
  self->SetAllowSleeping(flag);
}

DART_KEEPALIVE
bool dart_bind_b2World_GetAllowSleeping_0(b2World* self) {
  return self->GetAllowSleeping();
}

DART_KEEPALIVE
void dart_bind_b2World_SetWarmStarting_1(b2World* self, bool flag) {
  self->SetWarmStarting(flag);
}

DART_KEEPALIVE
bool dart_bind_b2World_GetWarmStarting_0(b2World* self) {
  return self->GetWarmStarting();
}

DART_KEEPALIVE
void dart_bind_b2World_SetContinuousPhysics_1(b2World* self, bool flag) {
  self->SetContinuousPhysics(flag);
}

DART_KEEPALIVE
bool dart_bind_b2World_GetContinuousPhysics_0(b2World* self) {
  return self->GetContinuousPhysics();
}

DART_KEEPALIVE
void dart_bind_b2World_SetSubStepping_1(b2World* self, bool flag) {
  self->SetSubStepping(flag);
}

DART_KEEPALIVE
bool dart_bind_b2World_GetSubStepping_0(b2World* self) {
  return self->GetSubStepping();
}

DART_KEEPALIVE
int dart_bind_b2World_GetProxyCount_0(b2World* self) {
  return self->GetProxyCount();
}

DART_KEEPALIVE
int dart_bind_b2World_GetBodyCount_0(b2World* self) {
  return self->GetBodyCount();
}

DART_KEEPALIVE
int dart_bind_b2World_GetJointCount_0(b2World* self) {
  return self->GetJointCount();
}

DART_KEEPALIVE
int dart_bind_b2World_GetContactCount_0(b2World* self) {
  return self->GetContactCount();
}

DART_KEEPALIVE
int dart_bind_b2World_GetTreeHeight_0(b2World* self) {
  return self->GetTreeHeight();
}

DART_KEEPALIVE
int dart_bind_b2World_GetTreeBalance_0(b2World* self) {
  return self->GetTreeBalance();
}

DART_KEEPALIVE
float dart_bind_b2World_GetTreeQuality_0(b2World* self) {
  return self->GetTreeQuality();
}

DART_KEEPALIVE
void dart_bind_b2World_SetGravity_1(b2World* self, b2Vec2* gravity) {
  self->SetGravity(*gravity);
}

DART_KEEPALIVE
b2Vec2* dart_bind_b2World_GetGravity_0(b2World* self) {
  static b2Vec2 temp;
  return (temp = self->GetGravity(), &temp);
}

DART_KEEPALIVE
bool dart_bind_b2World_IsLocked_0(b2World* self) {
  return self->IsLocked();
}

DART_KEEPALIVE
void dart_bind_b2World_SetAutoClearForces_1(b2World* self, bool flag) {
  self->SetAutoClearForces(flag);
}

DART_KEEPALIVE
bool dart_bind_b2World_GetAutoClearForces_0(b2World* self) {
  return self->GetAutoClearForces();
}

DART_KEEPALIVE
const b2Profile* dart_bind_b2World_GetProfile_0(b2World* self) {
  return &self->GetProfile();
}

DART_KEEPALIVE
void dart_bind_b2World_Dump_0(b2World* self) {
  self->Dump();
}

DART_KEEPALIVE
void dart_bind_b2World___destroy___0(b2World* self) {
  delete self;
}