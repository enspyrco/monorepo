
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

