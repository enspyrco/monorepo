enum B2ShapeType {
  circle,
  edge,
  polygon,
  chain,
  typeCount,
}

const b2ShapeTypeMap = {
  0: B2ShapeType.circle,
  1: B2ShapeType.edge,
  2: B2ShapeType.polygon,
  3: B2ShapeType.chain,
  4: B2ShapeType.typeCount,
};

extension B2ShapeTypeIntExtension on int {
  toB2ShapeType() => b2ShapeTypeMap[this]!;
}

enum B2BodyType {
  staticBody,
  kinematicBody,
  dynamicBody,
}

const b2BodyTypeMap = {
  0: B2BodyType.staticBody,
  1: B2BodyType.kinematicBody,
  2: B2BodyType.dynamicBody,
};

extension B2BodyTypeIntExtension on int {
  toB2BodyType() => b2BodyTypeMap[this]!;
}

enum B2JointType {
  unknownJoint,
  revoluteJoint,
  prismaticJoint,
  distanceJoint,
  pulleyJoint,
  mouseJoint,
  gearJoint,
  wheelJoint,
  weldJoint,
  frictionJoint,
  ropeJoint,
  motorJoint,
}

const b2JointTypeMap = {
  0: B2JointType.unknownJoint,
  1: B2JointType.revoluteJoint,
  2: B2JointType.prismaticJoint,
  3: B2JointType.distanceJoint,
  4: B2JointType.pulleyJoint,
  5: B2JointType.mouseJoint,
  6: B2JointType.gearJoint,
  7: B2JointType.wheelJoint,
  8: B2JointType.weldJoint,
  9: B2JointType.frictionJoint,
  10: B2JointType.ropeJoint,
  11: B2JointType.motorJoint,
};

extension B2JointTypeIntExtension on int {
  toB2JointType() => b2JointTypeMap[this]!;
}

enum B2ContactFeatureType {
  vertex,
  face,
}

const b2ContactFeatureTypeMap = {
  0: B2ContactFeatureType.vertex,
  1: B2ContactFeatureType.face,
};

extension B2ContactFeatureTypeIntExtension on int {
  toB2ContactFeatureType() => b2ContactFeatureTypeMap[this]!;
}

enum B2DrawFlag {
  shapeBit,
  jointBit,
  aabbBit,
  pairBit,
  centerOfMassBit,
}

const b2DrawFlagMap = {
  0: B2DrawFlag.shapeBit,
  1: B2DrawFlag.jointBit,
  2: B2DrawFlag.aabbBit,
  3: B2DrawFlag.pairBit,
  4: B2DrawFlag.centerOfMassBit,
};

extension B2DrawFlagIntExtension on int {
  toB2DrawFlag() => b2DrawFlagMap[this]!;
}

enum B2ManifoldType {
  circles,
  faceA,
  faceB,
}

const b2ManifoldTypeMap = {
  0: B2ManifoldType.circles,
  1: B2ManifoldType.faceA,
  2: B2ManifoldType.faceB,
};

extension B2ManifoldTypeIntExtension on int {
  toB2ManifoldType() => b2ManifoldTypeMap[this]!;
}

enum B2PointState {
  nullState,
  addState,
  persistState,
  removeState,
}

const b2PointStateMap = {
  0: B2PointState.nullState,
  1: B2PointState.addState,
  2: B2PointState.persistState,
  3: B2PointState.removeState,
};

extension B2PointStateIntExtension on int {
  toB2PointState() => b2PointStateMap[this]!;
}

enum B2StretchingModel {
  pbdStretchingModel,
  xpbdStretchingModel,
}

const b2StretchingModelMap = {
  0: B2StretchingModel.pbdStretchingModel,
  1: B2StretchingModel.xpbdStretchingModel,
};

extension B2StretchingModelIntExtension on int {
  toB2StretchingModel() => b2StretchingModelMap[this]!;
}

enum B2BendingModel {
  springAngleBendingModel,
  pbdAngleBendingModel,
  xpbdAngleBendingModel,
  pbdDistanceBendingModel,
  pbdHeightBendingModel,
}

const b2BendingModelMap = {
  0: B2BendingModel.springAngleBendingModel,
  1: B2BendingModel.pbdAngleBendingModel,
  2: B2BendingModel.xpbdAngleBendingModel,
  3: B2BendingModel.pbdDistanceBendingModel,
  4: B2BendingModel.pbdHeightBendingModel,
};

extension B2BendingModelIntExtension on int {
  toB2BendingModel() => b2BendingModelMap[this]!;
}

