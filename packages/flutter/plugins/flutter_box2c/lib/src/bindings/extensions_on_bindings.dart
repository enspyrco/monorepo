/// This extension just makes the relevant code more readable, ie.
/// `_nativeB2WorldDef.ref.gravity.toDartObject();`
/// instead of
/// `B2Vec2(_nativeB2WorldDef.ref.gravity.x, _nativeB2WorldDef.ref.gravity.y);`
// extension B2Vec2Extension on b2Vec2 {
//   b2.Vec2 toDartObject() {
//     return b2.Vec2(x, y);
//   }
// }

// extension B2WorldId on b2WorldId {
//   b2.WorldId toDartObject() {
//     return b2.WorldId(index, revision);
//   }
// }
