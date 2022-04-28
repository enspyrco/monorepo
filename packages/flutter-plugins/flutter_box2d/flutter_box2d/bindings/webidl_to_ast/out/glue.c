
// b2World

b2World* dart_bind_b2World_b2World_1(const b2Vec2 gravity) {
  return new b2World(*gravity);
}

void dart_bind_b2World_SetDestructionListener_1(b2World* self, b2DestructionListener listener) {
  self->SetDestructionListener(listener);
}

void dart_bind_b2World_SetContactFilter_1(b2World* self, JSContactFilter filter) {
  self->SetContactFilter(filter);
}

void dart_bind_b2World_SetContactListener_1(b2World* self, JSContactListener listener) {
  self->SetContactListener(listener);
}

void dart_bind_b2World_SetDebugDraw_1(b2World* self, b2Draw debugDraw) {
  self->SetDebugDraw(debugDraw);
}

b2Body* dart_bind_b2World_CreateBody_1(b2World* self, const b2BodyDef def) {
  return self->CreateBody(def);
}

void dart_bind_b2World_DestroyBody_1(b2World* self, b2Body body) {
  self->DestroyBody(body);
}

b2Joint* dart_bind_b2World_CreateJoint_1(b2World* self, const b2JointDef def) {
  return self->CreateJoint(def);
}

void dart_bind_b2World_DestroyJoint_1(b2World* self, b2Joint joint) {
  self->DestroyJoint(joint);
}

void dart_bind_b2World_Step_3(b2World* self, float timeStep, int velocityIterations, int positionIterations) {
  self->Step(timeStep, velocityIterations, positionIterations);
}

void dart_bind_b2World_ClearForces_0(b2World* self) {
  self->ClearForces();
}

void dart_bind_b2World_DebugDraw_0(b2World* self) {
  self->DebugDraw();
}

void dart_bind_b2World_QueryAABB_2(b2World* self, b2QueryCallback callback, b2AABB aabb) {
  self->QueryAABB(callback, *aabb);
}

void dart_bind_b2World_RayCast_3(b2World* self, b2RayCastCallback callback, b2Vec2 point1, b2Vec2 point2) {
  self->RayCast(callback, *point1, *point2);
}

b2Body* dart_bind_b2World_GetBodyList_0(b2World* self) {
  return self->GetBodyList();
}

b2Joint* dart_bind_b2World_GetJointList_0(b2World* self) {
  return self->GetJointList();
}

b2Contact* dart_bind_b2World_GetContactList_0(b2World* self) {
  return self->GetContactList();
}

void dart_bind_b2World_SetAllowSleeping_1(b2World* self, bool flag) {
  self->SetAllowSleeping(flag);
}

bool dart_bind_b2World_GetAllowSleeping_0(b2World* self) {
  return self->GetAllowSleeping();
}

void dart_bind_b2World_SetWarmStarting_1(b2World* self, bool flag) {
  self->SetWarmStarting(flag);
}

bool dart_bind_b2World_GetWarmStarting_0(b2World* self) {
  return self->GetWarmStarting();
}

void dart_bind_b2World_SetContinuousPhysics_1(b2World* self, bool flag) {
  self->SetContinuousPhysics(flag);
}

bool dart_bind_b2World_GetContinuousPhysics_0(b2World* self) {
  return self->GetContinuousPhysics();
}

void dart_bind_b2World_SetSubStepping_1(b2World* self, bool flag) {
  self->SetSubStepping(flag);
}

bool dart_bind_b2World_GetSubStepping_0(b2World* self) {
  return self->GetSubStepping();
}

int dart_bind_b2World_GetProxyCount_0(b2World* self) {
  return self->GetProxyCount();
}

int dart_bind_b2World_GetBodyCount_0(b2World* self) {
  return self->GetBodyCount();
}

int dart_bind_b2World_GetJointCount_0(b2World* self) {
  return self->GetJointCount();
}

int dart_bind_b2World_GetContactCount_0(b2World* self) {
  return self->GetContactCount();
}

int dart_bind_b2World_GetTreeHeight_0(b2World* self) {
  return self->GetTreeHeight();
}

int dart_bind_b2World_GetTreeBalance_0(b2World* self) {
  return self->GetTreeBalance();
}

float dart_bind_b2World_GetTreeQuality_0(b2World* self) {
  return self->GetTreeQuality();
}

void dart_bind_b2World_SetGravity_1(b2World* self, b2Vec2 gravity) {
  self->SetGravity(*gravity);
}

b2Vec2* dart_bind_b2World_GetGravity_0(b2World* self) {
  static b2Vec2 temp;
  return (temp = self->GetGravity(), &temp);
}

bool dart_bind_b2World_IsLocked_0(b2World* self) {
  return self->IsLocked();
}

void dart_bind_b2World_SetAutoClearForces_1(b2World* self, bool flag) {
  self->SetAutoClearForces(flag);
}

bool dart_bind_b2World_GetAutoClearForces_0(b2World* self) {
  return self->GetAutoClearForces();
}

const b2Profile* dart_bind_b2World_GetProfile_0(b2World* self) {
  return &self->GetProfile();
}

void dart_bind_b2World_Dump_0(b2World* self) {
  self->Dump();
}

void dart_bind_b2World___destroy___0(b2World* self) {
  delete self;
}


// b2Vec2

b2Vec2* dart_bind_b2Vec2_b2Vec2_0() {
  return new b2Vec2();
}

b2Vec2* dart_bind_b2Vec2_b2Vec2_2(float x, float y) {
  return new b2Vec2(x, y);
}

void dart_bind_b2Vec2_SetZero_0(b2Vec2* self) {
  self->SetZero();
}

void dart_bind_b2Vec2_Set_2(b2Vec2* self, float x, float y) {
  self->Set(x, y);
}

void dart_bind_b2Vec2_op_add_1(b2Vec2* self, const b2Vec2 v) {
  (*self += *v);
}

void dart_bind_b2Vec2_op_sub_1(b2Vec2* self, const b2Vec2 v) {
  (*self -= *v);
}

void dart_bind_b2Vec2_op_mul_1(b2Vec2* self, float s) {
  (*self *= s);
}

float dart_bind_b2Vec2_Length_0(b2Vec2* self) {
  return self->Length();
}

float dart_bind_b2Vec2_LengthSquared_0(b2Vec2* self) {
  return self->LengthSquared();
}

float dart_bind_b2Vec2_Normalize_0(b2Vec2* self) {
  return self->Normalize();
}

bool dart_bind_b2Vec2_IsValid_0(b2Vec2* self) {
  return self->IsValid();
}

b2Vec2* dart_bind_b2Vec2_Skew_0(b2Vec2* self) {
  static b2Vec2 temp;
  return (temp = self->Skew(), &temp);
}

void dart_bind_b2Vec2_set_x_1(b2Vec2* self, float arg0) {
  ?;
}

void dart_bind_b2Vec2_set_y_1(b2Vec2* self, float arg0) {
  ?;
}

void dart_bind_b2Vec2___destroy___0(b2Vec2* self) {
  delete self;
}

