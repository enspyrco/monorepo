
// Bindings utilities

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function WrapperObject() {
}
WrapperObject.prototype = Object.create(WrapperObject.prototype);
WrapperObject.prototype.constructor = WrapperObject;
WrapperObject.prototype.__class__ = WrapperObject;
WrapperObject.__cache__ = {};
Module['WrapperObject'] = WrapperObject;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant)
    @param {*=} __class__ */
function getCache(__class__) {
  return (__class__ || WrapperObject).__cache__;
}
Module['getCache'] = getCache;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant)
    @param {*=} __class__ */
function wrapPointer(ptr, __class__) {
  var cache = getCache(__class__);
  var ret = cache[ptr];
  if (ret) return ret;
  ret = Object.create((__class__ || WrapperObject).prototype);
  ret.ptr = ptr;
  return cache[ptr] = ret;
}
Module['wrapPointer'] = wrapPointer;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function castObject(obj, __class__) {
  return wrapPointer(obj.ptr, __class__);
}
Module['castObject'] = castObject;

Module['NULL'] = wrapPointer(0);

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function destroy(obj) {
  if (!obj['__destroy__']) throw 'Error: Cannot destroy object. (Did you create it yourself?)';
  obj['__destroy__']();
  // Remove from cache, so the object can be GC'd and refs added onto it released
  delete getCache(obj.__class__)[obj.ptr];
}
Module['destroy'] = destroy;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function compare(obj1, obj2) {
  return obj1.ptr === obj2.ptr;
}
Module['compare'] = compare;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function getPointer(obj) {
  return obj.ptr;
}
Module['getPointer'] = getPointer;

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function getClass(obj) {
  return obj.__class__;
}
Module['getClass'] = getClass;

// Converts big (string or array) values into a C-style storage, in temporary space

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
var ensureCache = {
  buffer: 0,  // the main buffer of temporary storage
  size: 0,   // the size of buffer
  pos: 0,    // the next free offset in buffer
  temps: [], // extra allocations
  needed: 0, // the total size we need next time

  prepare: function() {
    if (ensureCache.needed) {
      // clear the temps
      for (var i = 0; i < ensureCache.temps.length; i++) {
        Module['_free'](ensureCache.temps[i]);
      }
      ensureCache.temps.length = 0;
      // prepare to allocate a bigger buffer
      Module['_free'](ensureCache.buffer);
      ensureCache.buffer = 0;
      ensureCache.size += ensureCache.needed;
      // clean up
      ensureCache.needed = 0;
    }
    if (!ensureCache.buffer) { // happens first time, or when we need to grow
      ensureCache.size += 128; // heuristic, avoid many small grow events
      ensureCache.buffer = Module['_malloc'](ensureCache.size);
      assert(ensureCache.buffer);
    }
    ensureCache.pos = 0;
  },
  alloc: function(array, view) {
    assert(ensureCache.buffer);
    var bytes = view.BYTES_PER_ELEMENT;
    var len = array.length * bytes;
    len = (len + 7) & -8; // keep things aligned to 8 byte boundaries
    var ret;
    if (ensureCache.pos + len >= ensureCache.size) {
      // we failed to allocate in the buffer, ensureCache time around :(
      assert(len > 0); // null terminator, at least
      ensureCache.needed += len;
      ret = Module['_malloc'](len);
      ensureCache.temps.push(ret);
    } else {
      // we can allocate in the buffer
      ret = ensureCache.buffer + ensureCache.pos;
      ensureCache.pos += len;
    }
    return ret;
  },
  copy: function(array, view, offset) {
    offset >>>= 0;
    var bytes = view.BYTES_PER_ELEMENT;
    switch (bytes) {
      case 2: offset >>>= 1; break;
      case 4: offset >>>= 2; break;
      case 8: offset >>>= 3; break;
    }
    for (var i = 0; i < array.length; i++) {
      view[offset + i] = array[i];
    }
  },
};

/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureString(value) {
  if (typeof value === 'string') {
    var intArray = intArrayFromString(value);
    var offset = ensureCache.alloc(intArray, HEAP8);
    ensureCache.copy(intArray, HEAP8, offset);
    return offset;
  }
  return value;
}
/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureInt8(value) {
  if (typeof value === 'object') {
    var offset = ensureCache.alloc(value, HEAP8);
    ensureCache.copy(value, HEAP8, offset);
    return offset;
  }
  return value;
}
/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureInt16(value) {
  if (typeof value === 'object') {
    var offset = ensureCache.alloc(value, HEAP16);
    ensureCache.copy(value, HEAP16, offset);
    return offset;
  }
  return value;
}
/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureInt32(value) {
  if (typeof value === 'object') {
    var offset = ensureCache.alloc(value, HEAP32);
    ensureCache.copy(value, HEAP32, offset);
    return offset;
  }
  return value;
}
/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureFloat32(value) {
  if (typeof value === 'object') {
    var offset = ensureCache.alloc(value, HEAPF32);
    ensureCache.copy(value, HEAPF32, offset);
    return offset;
  }
  return value;
}
/** @suppress {duplicate} (TODO: avoid emitting this multiple times, it is redundant) */
function ensureFloat64(value) {
  if (typeof value === 'object') {
    var offset = ensureCache.alloc(value, HEAPF64);
    ensureCache.copy(value, HEAPF64, offset);
    return offset;
  }
  return value;
}


// b2ContactListener
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactListener() { throw "cannot construct a b2ContactListener, no constructor in IDL" }
b2ContactListener.prototype = Object.create(WrapperObject.prototype);
b2ContactListener.prototype.constructor = b2ContactListener;
b2ContactListener.prototype.__class__ = b2ContactListener;
b2ContactListener.__cache__ = {};
Module['b2ContactListener'] = b2ContactListener;

  b2ContactListener.prototype['__destroy__'] = b2ContactListener.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactListener___destroy___0(self);
};
// b2Shape
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Shape() { throw "cannot construct a b2Shape, no constructor in IDL" }
b2Shape.prototype = Object.create(WrapperObject.prototype);
b2Shape.prototype.constructor = b2Shape;
b2Shape.prototype.__class__ = b2Shape;
b2Shape.__cache__ = {};
Module['b2Shape'] = b2Shape;

b2Shape.prototype['GetType'] = b2Shape.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Shape_GetType_0(self);
};;

b2Shape.prototype['GetChildCount'] = b2Shape.prototype.GetChildCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Shape_GetChildCount_0(self);
};;

b2Shape.prototype['TestPoint'] = b2Shape.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf, p) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2Shape_TestPoint_2(self, xf, p));
};;

b2Shape.prototype['RayCast'] = b2Shape.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, transform, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (transform && typeof transform === 'object') transform = transform.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2Shape_RayCast_4(self, output, input, transform, childIndex));
};;

b2Shape.prototype['ComputeAABB'] = b2Shape.prototype.ComputeAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb, xf, childIndex) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  _emscripten_bind_b2Shape_ComputeAABB_3(self, aabb, xf, childIndex);
};;

b2Shape.prototype['ComputeMass'] = b2Shape.prototype.ComputeMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData, density) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2Shape_ComputeMass_2(self, massData, density);
};;

  b2Shape.prototype['get_m_type'] = b2Shape.prototype.get_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Shape_get_m_type_0(self);
};
    b2Shape.prototype['set_m_type'] = b2Shape.prototype.set_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Shape_set_m_type_1(self, arg0);
};
    Object.defineProperty(b2Shape.prototype, 'm_type', { get: b2Shape.prototype.get_m_type, set: b2Shape.prototype.set_m_type });
  b2Shape.prototype['get_m_radius'] = b2Shape.prototype.get_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Shape_get_m_radius_0(self);
};
    b2Shape.prototype['set_m_radius'] = b2Shape.prototype.set_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Shape_set_m_radius_1(self, arg0);
};
    Object.defineProperty(b2Shape.prototype, 'm_radius', { get: b2Shape.prototype.get_m_radius, set: b2Shape.prototype.set_m_radius });
  b2Shape.prototype['__destroy__'] = b2Shape.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Shape___destroy___0(self);
};
// b2RayCastCallback
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RayCastCallback() { throw "cannot construct a b2RayCastCallback, no constructor in IDL" }
b2RayCastCallback.prototype = Object.create(WrapperObject.prototype);
b2RayCastCallback.prototype.constructor = b2RayCastCallback;
b2RayCastCallback.prototype.__class__ = b2RayCastCallback;
b2RayCastCallback.__cache__ = {};
Module['b2RayCastCallback'] = b2RayCastCallback;

  b2RayCastCallback.prototype['__destroy__'] = b2RayCastCallback.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RayCastCallback___destroy___0(self);
};
// b2QueryCallback
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2QueryCallback() { throw "cannot construct a b2QueryCallback, no constructor in IDL" }
b2QueryCallback.prototype = Object.create(WrapperObject.prototype);
b2QueryCallback.prototype.constructor = b2QueryCallback;
b2QueryCallback.prototype.__class__ = b2QueryCallback;
b2QueryCallback.__cache__ = {};
Module['b2QueryCallback'] = b2QueryCallback;

  b2QueryCallback.prototype['__destroy__'] = b2QueryCallback.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2QueryCallback___destroy___0(self);
};
// b2JointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2JointDef() {
  this.ptr = _emscripten_bind_b2JointDef_b2JointDef_0();
  getCache(b2JointDef)[this.ptr] = this;
};;
b2JointDef.prototype = Object.create(WrapperObject.prototype);
b2JointDef.prototype.constructor = b2JointDef;
b2JointDef.prototype.__class__ = b2JointDef;
b2JointDef.__cache__ = {};
Module['b2JointDef'] = b2JointDef;

  b2JointDef.prototype['get_type'] = b2JointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2JointDef_get_type_0(self);
};
    b2JointDef.prototype['set_type'] = b2JointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2JointDef.prototype, 'type', { get: b2JointDef.prototype.get_type, set: b2JointDef.prototype.set_type });
  b2JointDef.prototype['get_userData'] = b2JointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointDef_get_userData_0(self), b2JointUserData);
};
    b2JointDef.prototype['set_userData'] = b2JointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2JointDef.prototype, 'userData', { get: b2JointDef.prototype.get_userData, set: b2JointDef.prototype.set_userData });
  b2JointDef.prototype['get_bodyA'] = b2JointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointDef_get_bodyA_0(self), b2Body);
};
    b2JointDef.prototype['set_bodyA'] = b2JointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2JointDef.prototype, 'bodyA', { get: b2JointDef.prototype.get_bodyA, set: b2JointDef.prototype.set_bodyA });
  b2JointDef.prototype['get_bodyB'] = b2JointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointDef_get_bodyB_0(self), b2Body);
};
    b2JointDef.prototype['set_bodyB'] = b2JointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2JointDef.prototype, 'bodyB', { get: b2JointDef.prototype.get_bodyB, set: b2JointDef.prototype.set_bodyB });
  b2JointDef.prototype['get_collideConnected'] = b2JointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2JointDef_get_collideConnected_0(self));
};
    b2JointDef.prototype['set_collideConnected'] = b2JointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2JointDef.prototype, 'collideConnected', { get: b2JointDef.prototype.get_collideConnected, set: b2JointDef.prototype.set_collideConnected });
  b2JointDef.prototype['__destroy__'] = b2JointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2JointDef___destroy___0(self);
};
// b2Joint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Joint() { throw "cannot construct a b2Joint, no constructor in IDL" }
b2Joint.prototype = Object.create(WrapperObject.prototype);
b2Joint.prototype.constructor = b2Joint;
b2Joint.prototype.__class__ = b2Joint;
b2Joint.__cache__ = {};
Module['b2Joint'] = b2Joint;

b2Joint.prototype['GetType'] = b2Joint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Joint_GetType_0(self);
};;

b2Joint.prototype['GetBodyA'] = b2Joint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetBodyA_0(self), b2Body);
};;

b2Joint.prototype['GetBodyB'] = b2Joint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetBodyB_0(self), b2Body);
};;

b2Joint.prototype['GetAnchorA'] = b2Joint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetAnchorA_0(self), b2Vec2);
};;

b2Joint.prototype['GetAnchorB'] = b2Joint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetAnchorB_0(self), b2Vec2);
};;

b2Joint.prototype['GetReactionForce'] = b2Joint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2Joint.prototype['GetReactionTorque'] = b2Joint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2Joint_GetReactionTorque_1(self, inv_dt);
};;

b2Joint.prototype['GetNext'] = b2Joint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetNext_0(self), b2Joint);
};;

b2Joint.prototype['GetUserData'] = b2Joint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Joint_GetUserData_0(self), b2JointUserData);
};;

b2Joint.prototype['GetCollideConnected'] = b2Joint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Joint_GetCollideConnected_0(self));
};;

b2Joint.prototype['Dump'] = b2Joint.prototype.Dump = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Joint_Dump_0(self);
};;

// b2ContactFilter
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactFilter() { throw "cannot construct a b2ContactFilter, no constructor in IDL" }
b2ContactFilter.prototype = Object.create(WrapperObject.prototype);
b2ContactFilter.prototype.constructor = b2ContactFilter;
b2ContactFilter.prototype.__class__ = b2ContactFilter;
b2ContactFilter.__cache__ = {};
Module['b2ContactFilter'] = b2ContactFilter;

  b2ContactFilter.prototype['__destroy__'] = b2ContactFilter.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactFilter___destroy___0(self);
};
// b2DestructionListenerWrapper
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2DestructionListenerWrapper() { throw "cannot construct a b2DestructionListenerWrapper, no constructor in IDL" }
b2DestructionListenerWrapper.prototype = Object.create(WrapperObject.prototype);
b2DestructionListenerWrapper.prototype.constructor = b2DestructionListenerWrapper;
b2DestructionListenerWrapper.prototype.__class__ = b2DestructionListenerWrapper;
b2DestructionListenerWrapper.__cache__ = {};
Module['b2DestructionListenerWrapper'] = b2DestructionListenerWrapper;

  b2DestructionListenerWrapper.prototype['__destroy__'] = b2DestructionListenerWrapper.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2DestructionListenerWrapper___destroy___0(self);
};
// b2Draw
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Draw() { throw "cannot construct a b2Draw, no constructor in IDL" }
b2Draw.prototype = Object.create(WrapperObject.prototype);
b2Draw.prototype.constructor = b2Draw;
b2Draw.prototype.__class__ = b2Draw;
b2Draw.__cache__ = {};
Module['b2Draw'] = b2Draw;

b2Draw.prototype['SetFlags'] = b2Draw.prototype.SetFlags = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flags) {
  var self = this.ptr;
  if (flags && typeof flags === 'object') flags = flags.ptr;
  _emscripten_bind_b2Draw_SetFlags_1(self, flags);
};;

b2Draw.prototype['GetFlags'] = b2Draw.prototype.GetFlags = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Draw_GetFlags_0(self);
};;

b2Draw.prototype['AppendFlags'] = b2Draw.prototype.AppendFlags = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flags) {
  var self = this.ptr;
  if (flags && typeof flags === 'object') flags = flags.ptr;
  _emscripten_bind_b2Draw_AppendFlags_1(self, flags);
};;

b2Draw.prototype['ClearFlags'] = b2Draw.prototype.ClearFlags = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flags) {
  var self = this.ptr;
  if (flags && typeof flags === 'object') flags = flags.ptr;
  _emscripten_bind_b2Draw_ClearFlags_1(self, flags);
};;

  b2Draw.prototype['__destroy__'] = b2Draw.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Draw___destroy___0(self);
};
// VoidPtr
/** @suppress {undefinedVars, duplicate} @this{Object} */function VoidPtr() { throw "cannot construct a VoidPtr, no constructor in IDL" }
VoidPtr.prototype = Object.create(WrapperObject.prototype);
VoidPtr.prototype.constructor = VoidPtr;
VoidPtr.prototype.__class__ = VoidPtr;
VoidPtr.__cache__ = {};
Module['VoidPtr'] = VoidPtr;

  VoidPtr.prototype['__destroy__'] = VoidPtr.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_VoidPtr___destroy___0(self);
};
// b2Contact
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Contact() { throw "cannot construct a b2Contact, no constructor in IDL" }
b2Contact.prototype = Object.create(WrapperObject.prototype);
b2Contact.prototype.constructor = b2Contact;
b2Contact.prototype.__class__ = b2Contact;
b2Contact.__cache__ = {};
Module['b2Contact'] = b2Contact;

b2Contact.prototype['GetManifold'] = b2Contact.prototype.GetManifold = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Contact_GetManifold_0(self), b2Manifold);
};;

b2Contact.prototype['GetWorldManifold'] = b2Contact.prototype.GetWorldManifold = /** @suppress {undefinedVars, duplicate} @this{Object} */function(manifold) {
  var self = this.ptr;
  if (manifold && typeof manifold === 'object') manifold = manifold.ptr;
  _emscripten_bind_b2Contact_GetWorldManifold_1(self, manifold);
};;

b2Contact.prototype['IsTouching'] = b2Contact.prototype.IsTouching = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Contact_IsTouching_0(self));
};;

b2Contact.prototype['SetEnabled'] = b2Contact.prototype.SetEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Contact_SetEnabled_1(self, flag);
};;

b2Contact.prototype['IsEnabled'] = b2Contact.prototype.IsEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Contact_IsEnabled_0(self));
};;

b2Contact.prototype['GetNext'] = b2Contact.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Contact_GetNext_0(self), b2Contact);
};;

b2Contact.prototype['GetFixtureA'] = b2Contact.prototype.GetFixtureA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Contact_GetFixtureA_0(self), b2Fixture);
};;

b2Contact.prototype['GetChildIndexA'] = b2Contact.prototype.GetChildIndexA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetChildIndexA_0(self);
};;

b2Contact.prototype['GetFixtureB'] = b2Contact.prototype.GetFixtureB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Contact_GetFixtureB_0(self), b2Fixture);
};;

b2Contact.prototype['GetChildIndexB'] = b2Contact.prototype.GetChildIndexB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetChildIndexB_0(self);
};;

b2Contact.prototype['SetFriction'] = b2Contact.prototype.SetFriction = /** @suppress {undefinedVars, duplicate} @this{Object} */function(friction) {
  var self = this.ptr;
  if (friction && typeof friction === 'object') friction = friction.ptr;
  _emscripten_bind_b2Contact_SetFriction_1(self, friction);
};;

b2Contact.prototype['GetFriction'] = b2Contact.prototype.GetFriction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetFriction_0(self);
};;

b2Contact.prototype['ResetFriction'] = b2Contact.prototype.ResetFriction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Contact_ResetFriction_0(self);
};;

b2Contact.prototype['SetRestitution'] = b2Contact.prototype.SetRestitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function(restitution) {
  var self = this.ptr;
  if (restitution && typeof restitution === 'object') restitution = restitution.ptr;
  _emscripten_bind_b2Contact_SetRestitution_1(self, restitution);
};;

b2Contact.prototype['GetRestitution'] = b2Contact.prototype.GetRestitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetRestitution_0(self);
};;

b2Contact.prototype['ResetRestitution'] = b2Contact.prototype.ResetRestitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Contact_ResetRestitution_0(self);
};;

b2Contact.prototype['SetRestitutionThreshold'] = b2Contact.prototype.SetRestitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function(threshold) {
  var self = this.ptr;
  if (threshold && typeof threshold === 'object') threshold = threshold.ptr;
  _emscripten_bind_b2Contact_SetRestitutionThreshold_1(self, threshold);
};;

b2Contact.prototype['GetRestitutionThreshold'] = b2Contact.prototype.GetRestitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetRestitutionThreshold_0(self);
};;

b2Contact.prototype['ResetRestitutionThreshold'] = b2Contact.prototype.ResetRestitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Contact_ResetRestitutionThreshold_0(self);
};;

b2Contact.prototype['SetTangentSpeed'] = b2Contact.prototype.SetTangentSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(speed) {
  var self = this.ptr;
  if (speed && typeof speed === 'object') speed = speed.ptr;
  _emscripten_bind_b2Contact_SetTangentSpeed_1(self, speed);
};;

b2Contact.prototype['GetTangentSpeed'] = b2Contact.prototype.GetTangentSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Contact_GetTangentSpeed_0(self);
};;

// JSContactListener
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSContactListener() {
  this.ptr = _emscripten_bind_JSContactListener_JSContactListener_0();
  getCache(JSContactListener)[this.ptr] = this;
};;
JSContactListener.prototype = Object.create(b2ContactListener.prototype);
JSContactListener.prototype.constructor = JSContactListener;
JSContactListener.prototype.__class__ = JSContactListener;
JSContactListener.__cache__ = {};
Module['JSContactListener'] = JSContactListener;

JSContactListener.prototype['BeginContact'] = JSContactListener.prototype.BeginContact = /** @suppress {undefinedVars, duplicate} @this{Object} */function(contact) {
  var self = this.ptr;
  if (contact && typeof contact === 'object') contact = contact.ptr;
  _emscripten_bind_JSContactListener_BeginContact_1(self, contact);
};;

JSContactListener.prototype['EndContact'] = JSContactListener.prototype.EndContact = /** @suppress {undefinedVars, duplicate} @this{Object} */function(contact) {
  var self = this.ptr;
  if (contact && typeof contact === 'object') contact = contact.ptr;
  _emscripten_bind_JSContactListener_EndContact_1(self, contact);
};;

JSContactListener.prototype['PreSolve'] = JSContactListener.prototype.PreSolve = /** @suppress {undefinedVars, duplicate} @this{Object} */function(contact, oldManifold) {
  var self = this.ptr;
  if (contact && typeof contact === 'object') contact = contact.ptr;
  if (oldManifold && typeof oldManifold === 'object') oldManifold = oldManifold.ptr;
  _emscripten_bind_JSContactListener_PreSolve_2(self, contact, oldManifold);
};;

JSContactListener.prototype['PostSolve'] = JSContactListener.prototype.PostSolve = /** @suppress {undefinedVars, duplicate} @this{Object} */function(contact, impulse) {
  var self = this.ptr;
  if (contact && typeof contact === 'object') contact = contact.ptr;
  if (impulse && typeof impulse === 'object') impulse = impulse.ptr;
  _emscripten_bind_JSContactListener_PostSolve_2(self, contact, impulse);
};;

  JSContactListener.prototype['__destroy__'] = JSContactListener.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSContactListener___destroy___0(self);
};
// b2World
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2World(gravity) {
  if (gravity && typeof gravity === 'object') gravity = gravity.ptr;
  this.ptr = _emscripten_bind_b2World_b2World_1(gravity);
  getCache(b2World)[this.ptr] = this;
};;
b2World.prototype = Object.create(WrapperObject.prototype);
b2World.prototype.constructor = b2World;
b2World.prototype.__class__ = b2World;
b2World.__cache__ = {};
Module['b2World'] = b2World;

b2World.prototype['SetDestructionListener'] = b2World.prototype.SetDestructionListener = /** @suppress {undefinedVars, duplicate} @this{Object} */function(listener) {
  var self = this.ptr;
  if (listener && typeof listener === 'object') listener = listener.ptr;
  _emscripten_bind_b2World_SetDestructionListener_1(self, listener);
};;

b2World.prototype['SetContactFilter'] = b2World.prototype.SetContactFilter = /** @suppress {undefinedVars, duplicate} @this{Object} */function(filter) {
  var self = this.ptr;
  if (filter && typeof filter === 'object') filter = filter.ptr;
  _emscripten_bind_b2World_SetContactFilter_1(self, filter);
};;

b2World.prototype['SetContactListener'] = b2World.prototype.SetContactListener = /** @suppress {undefinedVars, duplicate} @this{Object} */function(listener) {
  var self = this.ptr;
  if (listener && typeof listener === 'object') listener = listener.ptr;
  _emscripten_bind_b2World_SetContactListener_1(self, listener);
};;

b2World.prototype['SetDebugDraw'] = b2World.prototype.SetDebugDraw = /** @suppress {undefinedVars, duplicate} @this{Object} */function(debugDraw) {
  var self = this.ptr;
  if (debugDraw && typeof debugDraw === 'object') debugDraw = debugDraw.ptr;
  _emscripten_bind_b2World_SetDebugDraw_1(self, debugDraw);
};;

b2World.prototype['CreateBody'] = b2World.prototype.CreateBody = /** @suppress {undefinedVars, duplicate} @this{Object} */function(def) {
  var self = this.ptr;
  if (def && typeof def === 'object') def = def.ptr;
  return wrapPointer(_emscripten_bind_b2World_CreateBody_1(self, def), b2Body);
};;

b2World.prototype['DestroyBody'] = b2World.prototype.DestroyBody = /** @suppress {undefinedVars, duplicate} @this{Object} */function(body) {
  var self = this.ptr;
  if (body && typeof body === 'object') body = body.ptr;
  _emscripten_bind_b2World_DestroyBody_1(self, body);
};;

b2World.prototype['CreateJoint'] = b2World.prototype.CreateJoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(def) {
  var self = this.ptr;
  if (def && typeof def === 'object') def = def.ptr;
  return wrapPointer(_emscripten_bind_b2World_CreateJoint_1(self, def), b2Joint);
};;

b2World.prototype['DestroyJoint'] = b2World.prototype.DestroyJoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(joint) {
  var self = this.ptr;
  if (joint && typeof joint === 'object') joint = joint.ptr;
  _emscripten_bind_b2World_DestroyJoint_1(self, joint);
};;

b2World.prototype['Step'] = b2World.prototype.Step = /** @suppress {undefinedVars, duplicate} @this{Object} */function(timeStep, velocityIterations, positionIterations) {
  var self = this.ptr;
  if (timeStep && typeof timeStep === 'object') timeStep = timeStep.ptr;
  if (velocityIterations && typeof velocityIterations === 'object') velocityIterations = velocityIterations.ptr;
  if (positionIterations && typeof positionIterations === 'object') positionIterations = positionIterations.ptr;
  _emscripten_bind_b2World_Step_3(self, timeStep, velocityIterations, positionIterations);
};;

b2World.prototype['ClearForces'] = b2World.prototype.ClearForces = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2World_ClearForces_0(self);
};;

b2World.prototype['DebugDraw'] = b2World.prototype.DebugDraw = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2World_DebugDraw_0(self);
};;

b2World.prototype['QueryAABB'] = b2World.prototype.QueryAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(callback, aabb) {
  var self = this.ptr;
  if (callback && typeof callback === 'object') callback = callback.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  _emscripten_bind_b2World_QueryAABB_2(self, callback, aabb);
};;

b2World.prototype['RayCast'] = b2World.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(callback, point1, point2) {
  var self = this.ptr;
  if (callback && typeof callback === 'object') callback = callback.ptr;
  if (point1 && typeof point1 === 'object') point1 = point1.ptr;
  if (point2 && typeof point2 === 'object') point2 = point2.ptr;
  _emscripten_bind_b2World_RayCast_3(self, callback, point1, point2);
};;

b2World.prototype['GetBodyList'] = b2World.prototype.GetBodyList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2World_GetBodyList_0(self), b2Body);
};;

b2World.prototype['GetJointList'] = b2World.prototype.GetJointList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2World_GetJointList_0(self), b2Joint);
};;

b2World.prototype['GetContactList'] = b2World.prototype.GetContactList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2World_GetContactList_0(self), b2Contact);
};;

b2World.prototype['SetAllowSleeping'] = b2World.prototype.SetAllowSleeping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2World_SetAllowSleeping_1(self, flag);
};;

b2World.prototype['GetAllowSleeping'] = b2World.prototype.GetAllowSleeping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_GetAllowSleeping_0(self));
};;

b2World.prototype['SetWarmStarting'] = b2World.prototype.SetWarmStarting = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2World_SetWarmStarting_1(self, flag);
};;

b2World.prototype['GetWarmStarting'] = b2World.prototype.GetWarmStarting = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_GetWarmStarting_0(self));
};;

b2World.prototype['SetContinuousPhysics'] = b2World.prototype.SetContinuousPhysics = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2World_SetContinuousPhysics_1(self, flag);
};;

b2World.prototype['GetContinuousPhysics'] = b2World.prototype.GetContinuousPhysics = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_GetContinuousPhysics_0(self));
};;

b2World.prototype['SetSubStepping'] = b2World.prototype.SetSubStepping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2World_SetSubStepping_1(self, flag);
};;

b2World.prototype['GetSubStepping'] = b2World.prototype.GetSubStepping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_GetSubStepping_0(self));
};;

b2World.prototype['GetProxyCount'] = b2World.prototype.GetProxyCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetProxyCount_0(self);
};;

b2World.prototype['GetBodyCount'] = b2World.prototype.GetBodyCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetBodyCount_0(self);
};;

b2World.prototype['GetJointCount'] = b2World.prototype.GetJointCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetJointCount_0(self);
};;

b2World.prototype['GetContactCount'] = b2World.prototype.GetContactCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetContactCount_0(self);
};;

b2World.prototype['GetTreeHeight'] = b2World.prototype.GetTreeHeight = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetTreeHeight_0(self);
};;

b2World.prototype['GetTreeBalance'] = b2World.prototype.GetTreeBalance = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetTreeBalance_0(self);
};;

b2World.prototype['GetTreeQuality'] = b2World.prototype.GetTreeQuality = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2World_GetTreeQuality_0(self);
};;

b2World.prototype['SetGravity'] = b2World.prototype.SetGravity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(gravity) {
  var self = this.ptr;
  if (gravity && typeof gravity === 'object') gravity = gravity.ptr;
  _emscripten_bind_b2World_SetGravity_1(self, gravity);
};;

b2World.prototype['GetGravity'] = b2World.prototype.GetGravity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2World_GetGravity_0(self), b2Vec2);
};;

b2World.prototype['IsLocked'] = b2World.prototype.IsLocked = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_IsLocked_0(self));
};;

b2World.prototype['SetAutoClearForces'] = b2World.prototype.SetAutoClearForces = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2World_SetAutoClearForces_1(self, flag);
};;

b2World.prototype['GetAutoClearForces'] = b2World.prototype.GetAutoClearForces = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2World_GetAutoClearForces_0(self));
};;

b2World.prototype['GetProfile'] = b2World.prototype.GetProfile = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2World_GetProfile_0(self), b2Profile);
};;

b2World.prototype['Dump'] = b2World.prototype.Dump = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2World_Dump_0(self);
};;

  b2World.prototype['__destroy__'] = b2World.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2World___destroy___0(self);
};
// b2FixtureUserData
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2FixtureUserData() { throw "cannot construct a b2FixtureUserData, no constructor in IDL" }
b2FixtureUserData.prototype = Object.create(WrapperObject.prototype);
b2FixtureUserData.prototype.constructor = b2FixtureUserData;
b2FixtureUserData.prototype.__class__ = b2FixtureUserData;
b2FixtureUserData.__cache__ = {};
Module['b2FixtureUserData'] = b2FixtureUserData;

  b2FixtureUserData.prototype['get_pointer'] = b2FixtureUserData.prototype.get_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FixtureUserData_get_pointer_0(self);
};
    b2FixtureUserData.prototype['set_pointer'] = b2FixtureUserData.prototype.set_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureUserData_set_pointer_1(self, arg0);
};
    Object.defineProperty(b2FixtureUserData.prototype, 'pointer', { get: b2FixtureUserData.prototype.get_pointer, set: b2FixtureUserData.prototype.set_pointer });
  b2FixtureUserData.prototype['__destroy__'] = b2FixtureUserData.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2FixtureUserData___destroy___0(self);
};
// b2FixtureDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2FixtureDef() {
  this.ptr = _emscripten_bind_b2FixtureDef_b2FixtureDef_0();
  getCache(b2FixtureDef)[this.ptr] = this;
};;
b2FixtureDef.prototype = Object.create(WrapperObject.prototype);
b2FixtureDef.prototype.constructor = b2FixtureDef;
b2FixtureDef.prototype.__class__ = b2FixtureDef;
b2FixtureDef.__cache__ = {};
Module['b2FixtureDef'] = b2FixtureDef;

  b2FixtureDef.prototype['get_shape'] = b2FixtureDef.prototype.get_shape = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FixtureDef_get_shape_0(self), b2Shape);
};
    b2FixtureDef.prototype['set_shape'] = b2FixtureDef.prototype.set_shape = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_shape_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'shape', { get: b2FixtureDef.prototype.get_shape, set: b2FixtureDef.prototype.set_shape });
  b2FixtureDef.prototype['get_userData'] = b2FixtureDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FixtureDef_get_userData_0(self), b2FixtureUserData);
};
    b2FixtureDef.prototype['set_userData'] = b2FixtureDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'userData', { get: b2FixtureDef.prototype.get_userData, set: b2FixtureDef.prototype.set_userData });
  b2FixtureDef.prototype['get_friction'] = b2FixtureDef.prototype.get_friction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FixtureDef_get_friction_0(self);
};
    b2FixtureDef.prototype['set_friction'] = b2FixtureDef.prototype.set_friction = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_friction_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'friction', { get: b2FixtureDef.prototype.get_friction, set: b2FixtureDef.prototype.set_friction });
  b2FixtureDef.prototype['get_restitution'] = b2FixtureDef.prototype.get_restitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FixtureDef_get_restitution_0(self);
};
    b2FixtureDef.prototype['set_restitution'] = b2FixtureDef.prototype.set_restitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_restitution_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'restitution', { get: b2FixtureDef.prototype.get_restitution, set: b2FixtureDef.prototype.set_restitution });
  b2FixtureDef.prototype['get_restitutionThreshold'] = b2FixtureDef.prototype.get_restitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FixtureDef_get_restitutionThreshold_0(self);
};
    b2FixtureDef.prototype['set_restitutionThreshold'] = b2FixtureDef.prototype.set_restitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_restitutionThreshold_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'restitutionThreshold', { get: b2FixtureDef.prototype.get_restitutionThreshold, set: b2FixtureDef.prototype.set_restitutionThreshold });
  b2FixtureDef.prototype['get_density'] = b2FixtureDef.prototype.get_density = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FixtureDef_get_density_0(self);
};
    b2FixtureDef.prototype['set_density'] = b2FixtureDef.prototype.set_density = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_density_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'density', { get: b2FixtureDef.prototype.get_density, set: b2FixtureDef.prototype.set_density });
  b2FixtureDef.prototype['get_isSensor'] = b2FixtureDef.prototype.get_isSensor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2FixtureDef_get_isSensor_0(self));
};
    b2FixtureDef.prototype['set_isSensor'] = b2FixtureDef.prototype.set_isSensor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_isSensor_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'isSensor', { get: b2FixtureDef.prototype.get_isSensor, set: b2FixtureDef.prototype.set_isSensor });
  b2FixtureDef.prototype['get_filter'] = b2FixtureDef.prototype.get_filter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FixtureDef_get_filter_0(self), b2Filter);
};
    b2FixtureDef.prototype['set_filter'] = b2FixtureDef.prototype.set_filter = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FixtureDef_set_filter_1(self, arg0);
};
    Object.defineProperty(b2FixtureDef.prototype, 'filter', { get: b2FixtureDef.prototype.get_filter, set: b2FixtureDef.prototype.set_filter });
  b2FixtureDef.prototype['__destroy__'] = b2FixtureDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2FixtureDef___destroy___0(self);
};
// b2Fixture
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Fixture() { throw "cannot construct a b2Fixture, no constructor in IDL" }
b2Fixture.prototype = Object.create(WrapperObject.prototype);
b2Fixture.prototype.constructor = b2Fixture;
b2Fixture.prototype.__class__ = b2Fixture;
b2Fixture.__cache__ = {};
Module['b2Fixture'] = b2Fixture;

b2Fixture.prototype['GetType'] = b2Fixture.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Fixture_GetType_0(self);
};;

b2Fixture.prototype['GetShape'] = b2Fixture.prototype.GetShape = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetShape_0(self), b2Shape);
};;

b2Fixture.prototype['SetSensor'] = b2Fixture.prototype.SetSensor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(sensor) {
  var self = this.ptr;
  if (sensor && typeof sensor === 'object') sensor = sensor.ptr;
  _emscripten_bind_b2Fixture_SetSensor_1(self, sensor);
};;

b2Fixture.prototype['IsSensor'] = b2Fixture.prototype.IsSensor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Fixture_IsSensor_0(self));
};;

b2Fixture.prototype['SetFilterData'] = b2Fixture.prototype.SetFilterData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(filter) {
  var self = this.ptr;
  if (filter && typeof filter === 'object') filter = filter.ptr;
  _emscripten_bind_b2Fixture_SetFilterData_1(self, filter);
};;

b2Fixture.prototype['GetFilterData'] = b2Fixture.prototype.GetFilterData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetFilterData_0(self), b2Filter);
};;

b2Fixture.prototype['Refilter'] = b2Fixture.prototype.Refilter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Fixture_Refilter_0(self);
};;

b2Fixture.prototype['GetBody'] = b2Fixture.prototype.GetBody = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetBody_0(self), b2Body);
};;

b2Fixture.prototype['GetNext'] = b2Fixture.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetNext_0(self), b2Fixture);
};;

b2Fixture.prototype['GetUserData'] = b2Fixture.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetUserData_0(self), b2FixtureUserData);
};;

b2Fixture.prototype['TestPoint'] = b2Fixture.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(p) {
  var self = this.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2Fixture_TestPoint_1(self, p));
};;

b2Fixture.prototype['RayCast'] = b2Fixture.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2Fixture_RayCast_3(self, output, input, childIndex));
};;

b2Fixture.prototype['GetMassData'] = b2Fixture.prototype.GetMassData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  _emscripten_bind_b2Fixture_GetMassData_1(self, massData);
};;

b2Fixture.prototype['SetDensity'] = b2Fixture.prototype.SetDensity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(density) {
  var self = this.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2Fixture_SetDensity_1(self, density);
};;

b2Fixture.prototype['GetDensity'] = b2Fixture.prototype.GetDensity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Fixture_GetDensity_0(self);
};;

b2Fixture.prototype['GetFriction'] = b2Fixture.prototype.GetFriction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Fixture_GetFriction_0(self);
};;

b2Fixture.prototype['SetFriction'] = b2Fixture.prototype.SetFriction = /** @suppress {undefinedVars, duplicate} @this{Object} */function(friction) {
  var self = this.ptr;
  if (friction && typeof friction === 'object') friction = friction.ptr;
  _emscripten_bind_b2Fixture_SetFriction_1(self, friction);
};;

b2Fixture.prototype['GetRestitution'] = b2Fixture.prototype.GetRestitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Fixture_GetRestitution_0(self);
};;

b2Fixture.prototype['SetRestitution'] = b2Fixture.prototype.SetRestitution = /** @suppress {undefinedVars, duplicate} @this{Object} */function(restitution) {
  var self = this.ptr;
  if (restitution && typeof restitution === 'object') restitution = restitution.ptr;
  _emscripten_bind_b2Fixture_SetRestitution_1(self, restitution);
};;

b2Fixture.prototype['GetRestitutionThreshold'] = b2Fixture.prototype.GetRestitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Fixture_GetRestitutionThreshold_0(self);
};;

b2Fixture.prototype['SetRestitutionThreshold'] = b2Fixture.prototype.SetRestitutionThreshold = /** @suppress {undefinedVars, duplicate} @this{Object} */function(threshold) {
  var self = this.ptr;
  if (threshold && typeof threshold === 'object') threshold = threshold.ptr;
  _emscripten_bind_b2Fixture_SetRestitutionThreshold_1(self, threshold);
};;

b2Fixture.prototype['GetAABB'] = b2Fixture.prototype.GetAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(childIndex) {
  var self = this.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return wrapPointer(_emscripten_bind_b2Fixture_GetAABB_1(self, childIndex), b2AABB);
};;

b2Fixture.prototype['Dump'] = b2Fixture.prototype.Dump = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyIndex) {
  var self = this.ptr;
  if (bodyIndex && typeof bodyIndex === 'object') bodyIndex = bodyIndex.ptr;
  _emscripten_bind_b2Fixture_Dump_1(self, bodyIndex);
};;

  b2Fixture.prototype['__destroy__'] = b2Fixture.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Fixture___destroy___0(self);
};
// b2Transform
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Transform(position, rotation) {
  if (position && typeof position === 'object') position = position.ptr;
  if (rotation && typeof rotation === 'object') rotation = rotation.ptr;
  if (position === undefined) { this.ptr = _emscripten_bind_b2Transform_b2Transform_0(); getCache(b2Transform)[this.ptr] = this;return }
  if (rotation === undefined) { this.ptr = _emscripten_bind_b2Transform_b2Transform_1(position); getCache(b2Transform)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Transform_b2Transform_2(position, rotation);
  getCache(b2Transform)[this.ptr] = this;
};;
b2Transform.prototype = Object.create(WrapperObject.prototype);
b2Transform.prototype.constructor = b2Transform;
b2Transform.prototype.__class__ = b2Transform;
b2Transform.__cache__ = {};
Module['b2Transform'] = b2Transform;

b2Transform.prototype['SetIdentity'] = b2Transform.prototype.SetIdentity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Transform_SetIdentity_0(self);
};;

b2Transform.prototype['Set'] = b2Transform.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(position, angle) {
  var self = this.ptr;
  if (position && typeof position === 'object') position = position.ptr;
  if (angle && typeof angle === 'object') angle = angle.ptr;
  _emscripten_bind_b2Transform_Set_2(self, position, angle);
};;

  b2Transform.prototype['get_p'] = b2Transform.prototype.get_p = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Transform_get_p_0(self), b2Vec2);
};
    b2Transform.prototype['set_p'] = b2Transform.prototype.set_p = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Transform_set_p_1(self, arg0);
};
    Object.defineProperty(b2Transform.prototype, 'p', { get: b2Transform.prototype.get_p, set: b2Transform.prototype.set_p });
  b2Transform.prototype['get_q'] = b2Transform.prototype.get_q = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Transform_get_q_0(self), b2Rot);
};
    b2Transform.prototype['set_q'] = b2Transform.prototype.set_q = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Transform_set_q_1(self, arg0);
};
    Object.defineProperty(b2Transform.prototype, 'q', { get: b2Transform.prototype.get_q, set: b2Transform.prototype.set_q });
  b2Transform.prototype['__destroy__'] = b2Transform.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Transform___destroy___0(self);
};
// JSRayCastCallback
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSRayCastCallback() {
  this.ptr = _emscripten_bind_JSRayCastCallback_JSRayCastCallback_0();
  getCache(JSRayCastCallback)[this.ptr] = this;
};;
JSRayCastCallback.prototype = Object.create(b2RayCastCallback.prototype);
JSRayCastCallback.prototype.constructor = JSRayCastCallback;
JSRayCastCallback.prototype.__class__ = JSRayCastCallback;
JSRayCastCallback.__cache__ = {};
Module['JSRayCastCallback'] = JSRayCastCallback;

JSRayCastCallback.prototype['ReportFixture'] = JSRayCastCallback.prototype.ReportFixture = /** @suppress {undefinedVars, duplicate} @this{Object} */function(fixture, point, normal, fraction) {
  var self = this.ptr;
  if (fixture && typeof fixture === 'object') fixture = fixture.ptr;
  if (point && typeof point === 'object') point = point.ptr;
  if (normal && typeof normal === 'object') normal = normal.ptr;
  if (fraction && typeof fraction === 'object') fraction = fraction.ptr;
  return _emscripten_bind_JSRayCastCallback_ReportFixture_4(self, fixture, point, normal, fraction);
};;

  JSRayCastCallback.prototype['__destroy__'] = JSRayCastCallback.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSRayCastCallback___destroy___0(self);
};
// JSQueryCallback
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSQueryCallback() {
  this.ptr = _emscripten_bind_JSQueryCallback_JSQueryCallback_0();
  getCache(JSQueryCallback)[this.ptr] = this;
};;
JSQueryCallback.prototype = Object.create(b2QueryCallback.prototype);
JSQueryCallback.prototype.constructor = JSQueryCallback;
JSQueryCallback.prototype.__class__ = JSQueryCallback;
JSQueryCallback.__cache__ = {};
Module['JSQueryCallback'] = JSQueryCallback;

JSQueryCallback.prototype['ReportFixture'] = JSQueryCallback.prototype.ReportFixture = /** @suppress {undefinedVars, duplicate} @this{Object} */function(fixture) {
  var self = this.ptr;
  if (fixture && typeof fixture === 'object') fixture = fixture.ptr;
  return !!(_emscripten_bind_JSQueryCallback_ReportFixture_1(self, fixture));
};;

  JSQueryCallback.prototype['__destroy__'] = JSQueryCallback.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSQueryCallback___destroy___0(self);
};
// b2MassData
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2MassData() {
  this.ptr = _emscripten_bind_b2MassData_b2MassData_0();
  getCache(b2MassData)[this.ptr] = this;
};;
b2MassData.prototype = Object.create(WrapperObject.prototype);
b2MassData.prototype.constructor = b2MassData;
b2MassData.prototype.__class__ = b2MassData;
b2MassData.__cache__ = {};
Module['b2MassData'] = b2MassData;

  b2MassData.prototype['get_mass'] = b2MassData.prototype.get_mass = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MassData_get_mass_0(self);
};
    b2MassData.prototype['set_mass'] = b2MassData.prototype.set_mass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MassData_set_mass_1(self, arg0);
};
    Object.defineProperty(b2MassData.prototype, 'mass', { get: b2MassData.prototype.get_mass, set: b2MassData.prototype.set_mass });
  b2MassData.prototype['get_center'] = b2MassData.prototype.get_center = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MassData_get_center_0(self), b2Vec2);
};
    b2MassData.prototype['set_center'] = b2MassData.prototype.set_center = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MassData_set_center_1(self, arg0);
};
    Object.defineProperty(b2MassData.prototype, 'center', { get: b2MassData.prototype.get_center, set: b2MassData.prototype.set_center });
  b2MassData.prototype['get_I'] = b2MassData.prototype.get_I = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MassData_get_I_0(self);
};
    b2MassData.prototype['set_I'] = b2MassData.prototype.set_I = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MassData_set_I_1(self, arg0);
};
    Object.defineProperty(b2MassData.prototype, 'I', { get: b2MassData.prototype.get_I, set: b2MassData.prototype.set_I });
  b2MassData.prototype['__destroy__'] = b2MassData.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2MassData___destroy___0(self);
};
// b2Vec2
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Vec2(x, y) {
  if (x && typeof x === 'object') x = x.ptr;
  if (y && typeof y === 'object') y = y.ptr;
  if (x === undefined) { this.ptr = _emscripten_bind_b2Vec2_b2Vec2_0(); getCache(b2Vec2)[this.ptr] = this;return }
  if (y === undefined) { this.ptr = _emscripten_bind_b2Vec2_b2Vec2_1(x); getCache(b2Vec2)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Vec2_b2Vec2_2(x, y);
  getCache(b2Vec2)[this.ptr] = this;
};;
b2Vec2.prototype = Object.create(WrapperObject.prototype);
b2Vec2.prototype.constructor = b2Vec2;
b2Vec2.prototype.__class__ = b2Vec2;
b2Vec2.__cache__ = {};
Module['b2Vec2'] = b2Vec2;

b2Vec2.prototype['SetZero'] = b2Vec2.prototype.SetZero = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Vec2_SetZero_0(self);
};;

b2Vec2.prototype['Set'] = b2Vec2.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(x, y) {
  var self = this.ptr;
  if (x && typeof x === 'object') x = x.ptr;
  if (y && typeof y === 'object') y = y.ptr;
  _emscripten_bind_b2Vec2_Set_2(self, x, y);
};;

b2Vec2.prototype['op_add'] = b2Vec2.prototype.op_add = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v) {
  var self = this.ptr;
  if (v && typeof v === 'object') v = v.ptr;
  _emscripten_bind_b2Vec2_op_add_1(self, v);
};;

b2Vec2.prototype['op_sub'] = b2Vec2.prototype.op_sub = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v) {
  var self = this.ptr;
  if (v && typeof v === 'object') v = v.ptr;
  _emscripten_bind_b2Vec2_op_sub_1(self, v);
};;

b2Vec2.prototype['op_mul'] = b2Vec2.prototype.op_mul = /** @suppress {undefinedVars, duplicate} @this{Object} */function(s) {
  var self = this.ptr;
  if (s && typeof s === 'object') s = s.ptr;
  _emscripten_bind_b2Vec2_op_mul_1(self, s);
};;

b2Vec2.prototype['Length'] = b2Vec2.prototype.Length = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec2_Length_0(self);
};;

b2Vec2.prototype['LengthSquared'] = b2Vec2.prototype.LengthSquared = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec2_LengthSquared_0(self);
};;

b2Vec2.prototype['Normalize'] = b2Vec2.prototype.Normalize = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec2_Normalize_0(self);
};;

b2Vec2.prototype['IsValid'] = b2Vec2.prototype.IsValid = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Vec2_IsValid_0(self));
};;

b2Vec2.prototype['Skew'] = b2Vec2.prototype.Skew = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Vec2_Skew_0(self), b2Vec2);
};;

  b2Vec2.prototype['get_x'] = b2Vec2.prototype.get_x = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec2_get_x_0(self);
};
    b2Vec2.prototype['set_x'] = b2Vec2.prototype.set_x = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Vec2_set_x_1(self, arg0);
};
    Object.defineProperty(b2Vec2.prototype, 'x', { get: b2Vec2.prototype.get_x, set: b2Vec2.prototype.set_x });
  b2Vec2.prototype['get_y'] = b2Vec2.prototype.get_y = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec2_get_y_0(self);
};
    b2Vec2.prototype['set_y'] = b2Vec2.prototype.set_y = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Vec2_set_y_1(self, arg0);
};
    Object.defineProperty(b2Vec2.prototype, 'y', { get: b2Vec2.prototype.get_y, set: b2Vec2.prototype.set_y });
  b2Vec2.prototype['__destroy__'] = b2Vec2.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Vec2___destroy___0(self);
};
// b2Vec3
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Vec3(x, y, z) {
  if (x && typeof x === 'object') x = x.ptr;
  if (y && typeof y === 'object') y = y.ptr;
  if (z && typeof z === 'object') z = z.ptr;
  if (x === undefined) { this.ptr = _emscripten_bind_b2Vec3_b2Vec3_0(); getCache(b2Vec3)[this.ptr] = this;return }
  if (y === undefined) { this.ptr = _emscripten_bind_b2Vec3_b2Vec3_1(x); getCache(b2Vec3)[this.ptr] = this;return }
  if (z === undefined) { this.ptr = _emscripten_bind_b2Vec3_b2Vec3_2(x, y); getCache(b2Vec3)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Vec3_b2Vec3_3(x, y, z);
  getCache(b2Vec3)[this.ptr] = this;
};;
b2Vec3.prototype = Object.create(WrapperObject.prototype);
b2Vec3.prototype.constructor = b2Vec3;
b2Vec3.prototype.__class__ = b2Vec3;
b2Vec3.__cache__ = {};
Module['b2Vec3'] = b2Vec3;

b2Vec3.prototype['SetZero'] = b2Vec3.prototype.SetZero = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Vec3_SetZero_0(self);
};;

b2Vec3.prototype['Set'] = b2Vec3.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(x, y, z) {
  var self = this.ptr;
  if (x && typeof x === 'object') x = x.ptr;
  if (y && typeof y === 'object') y = y.ptr;
  if (z && typeof z === 'object') z = z.ptr;
  _emscripten_bind_b2Vec3_Set_3(self, x, y, z);
};;

b2Vec3.prototype['op_add'] = b2Vec3.prototype.op_add = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v) {
  var self = this.ptr;
  if (v && typeof v === 'object') v = v.ptr;
  _emscripten_bind_b2Vec3_op_add_1(self, v);
};;

b2Vec3.prototype['op_sub'] = b2Vec3.prototype.op_sub = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v) {
  var self = this.ptr;
  if (v && typeof v === 'object') v = v.ptr;
  _emscripten_bind_b2Vec3_op_sub_1(self, v);
};;

b2Vec3.prototype['op_mul'] = b2Vec3.prototype.op_mul = /** @suppress {undefinedVars, duplicate} @this{Object} */function(s) {
  var self = this.ptr;
  if (s && typeof s === 'object') s = s.ptr;
  _emscripten_bind_b2Vec3_op_mul_1(self, s);
};;

  b2Vec3.prototype['get_x'] = b2Vec3.prototype.get_x = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec3_get_x_0(self);
};
    b2Vec3.prototype['set_x'] = b2Vec3.prototype.set_x = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Vec3_set_x_1(self, arg0);
};
    Object.defineProperty(b2Vec3.prototype, 'x', { get: b2Vec3.prototype.get_x, set: b2Vec3.prototype.set_x });
  b2Vec3.prototype['get_y'] = b2Vec3.prototype.get_y = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec3_get_y_0(self);
};
    b2Vec3.prototype['set_y'] = b2Vec3.prototype.set_y = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Vec3_set_y_1(self, arg0);
};
    Object.defineProperty(b2Vec3.prototype, 'y', { get: b2Vec3.prototype.get_y, set: b2Vec3.prototype.set_y });
  b2Vec3.prototype['get_z'] = b2Vec3.prototype.get_z = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Vec3_get_z_0(self);
};
    b2Vec3.prototype['set_z'] = b2Vec3.prototype.set_z = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Vec3_set_z_1(self, arg0);
};
    Object.defineProperty(b2Vec3.prototype, 'z', { get: b2Vec3.prototype.get_z, set: b2Vec3.prototype.set_z });
  b2Vec3.prototype['__destroy__'] = b2Vec3.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Vec3___destroy___0(self);
};
// b2BodyUserData
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2BodyUserData() { throw "cannot construct a b2BodyUserData, no constructor in IDL" }
b2BodyUserData.prototype = Object.create(WrapperObject.prototype);
b2BodyUserData.prototype.constructor = b2BodyUserData;
b2BodyUserData.prototype.__class__ = b2BodyUserData;
b2BodyUserData.__cache__ = {};
Module['b2BodyUserData'] = b2BodyUserData;

  b2BodyUserData.prototype['get_pointer'] = b2BodyUserData.prototype.get_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyUserData_get_pointer_0(self);
};
    b2BodyUserData.prototype['set_pointer'] = b2BodyUserData.prototype.set_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyUserData_set_pointer_1(self, arg0);
};
    Object.defineProperty(b2BodyUserData.prototype, 'pointer', { get: b2BodyUserData.prototype.get_pointer, set: b2BodyUserData.prototype.set_pointer });
  b2BodyUserData.prototype['__destroy__'] = b2BodyUserData.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2BodyUserData___destroy___0(self);
};
// b2Body
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Body() { throw "cannot construct a b2Body, no constructor in IDL" }
b2Body.prototype = Object.create(WrapperObject.prototype);
b2Body.prototype.constructor = b2Body;
b2Body.prototype.__class__ = b2Body;
b2Body.__cache__ = {};
Module['b2Body'] = b2Body;

b2Body.prototype['CreateFixture'] = b2Body.prototype.CreateFixture = /** @suppress {undefinedVars, duplicate} @this{Object} */function(shape, density) {
  var self = this.ptr;
  if (shape && typeof shape === 'object') shape = shape.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  if (density === undefined) { return wrapPointer(_emscripten_bind_b2Body_CreateFixture_1(self, shape), b2Fixture) }
  return wrapPointer(_emscripten_bind_b2Body_CreateFixture_2(self, shape, density), b2Fixture);
};;

b2Body.prototype['DestroyFixture'] = b2Body.prototype.DestroyFixture = /** @suppress {undefinedVars, duplicate} @this{Object} */function(fixture) {
  var self = this.ptr;
  if (fixture && typeof fixture === 'object') fixture = fixture.ptr;
  _emscripten_bind_b2Body_DestroyFixture_1(self, fixture);
};;

b2Body.prototype['SetTransform'] = b2Body.prototype.SetTransform = /** @suppress {undefinedVars, duplicate} @this{Object} */function(position, angle) {
  var self = this.ptr;
  if (position && typeof position === 'object') position = position.ptr;
  if (angle && typeof angle === 'object') angle = angle.ptr;
  _emscripten_bind_b2Body_SetTransform_2(self, position, angle);
};;

b2Body.prototype['GetTransform'] = b2Body.prototype.GetTransform = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetTransform_0(self), b2Transform);
};;

b2Body.prototype['GetPosition'] = b2Body.prototype.GetPosition = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetPosition_0(self), b2Vec2);
};;

b2Body.prototype['GetAngle'] = b2Body.prototype.GetAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetAngle_0(self);
};;

b2Body.prototype['GetWorldCenter'] = b2Body.prototype.GetWorldCenter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetWorldCenter_0(self), b2Vec2);
};;

b2Body.prototype['GetLocalCenter'] = b2Body.prototype.GetLocalCenter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLocalCenter_0(self), b2Vec2);
};;

b2Body.prototype['SetLinearVelocity'] = b2Body.prototype.SetLinearVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v) {
  var self = this.ptr;
  if (v && typeof v === 'object') v = v.ptr;
  _emscripten_bind_b2Body_SetLinearVelocity_1(self, v);
};;

b2Body.prototype['GetLinearVelocity'] = b2Body.prototype.GetLinearVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLinearVelocity_0(self), b2Vec2);
};;

b2Body.prototype['SetAngularVelocity'] = b2Body.prototype.SetAngularVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(omega) {
  var self = this.ptr;
  if (omega && typeof omega === 'object') omega = omega.ptr;
  _emscripten_bind_b2Body_SetAngularVelocity_1(self, omega);
};;

b2Body.prototype['GetAngularVelocity'] = b2Body.prototype.GetAngularVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetAngularVelocity_0(self);
};;

b2Body.prototype['ApplyForce'] = b2Body.prototype.ApplyForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force, point, wake) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  if (point && typeof point === 'object') point = point.ptr;
  if (wake && typeof wake === 'object') wake = wake.ptr;
  _emscripten_bind_b2Body_ApplyForce_3(self, force, point, wake);
};;

b2Body.prototype['ApplyForceToCenter'] = b2Body.prototype.ApplyForceToCenter = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force, wake) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  if (wake && typeof wake === 'object') wake = wake.ptr;
  _emscripten_bind_b2Body_ApplyForceToCenter_2(self, force, wake);
};;

b2Body.prototype['ApplyTorque'] = b2Body.prototype.ApplyTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(torque, awake) {
  var self = this.ptr;
  if (torque && typeof torque === 'object') torque = torque.ptr;
  if (awake && typeof awake === 'object') awake = awake.ptr;
  _emscripten_bind_b2Body_ApplyTorque_2(self, torque, awake);
};;

b2Body.prototype['ApplyLinearImpulse'] = b2Body.prototype.ApplyLinearImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function(impulse, point, wake) {
  var self = this.ptr;
  if (impulse && typeof impulse === 'object') impulse = impulse.ptr;
  if (point && typeof point === 'object') point = point.ptr;
  if (wake && typeof wake === 'object') wake = wake.ptr;
  _emscripten_bind_b2Body_ApplyLinearImpulse_3(self, impulse, point, wake);
};;

b2Body.prototype['ApplyLinearImpulseToCenter'] = b2Body.prototype.ApplyLinearImpulseToCenter = /** @suppress {undefinedVars, duplicate} @this{Object} */function(impulse, wake) {
  var self = this.ptr;
  if (impulse && typeof impulse === 'object') impulse = impulse.ptr;
  if (wake && typeof wake === 'object') wake = wake.ptr;
  _emscripten_bind_b2Body_ApplyLinearImpulseToCenter_2(self, impulse, wake);
};;

b2Body.prototype['ApplyAngularImpulse'] = b2Body.prototype.ApplyAngularImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function(impulse, wake) {
  var self = this.ptr;
  if (impulse && typeof impulse === 'object') impulse = impulse.ptr;
  if (wake && typeof wake === 'object') wake = wake.ptr;
  _emscripten_bind_b2Body_ApplyAngularImpulse_2(self, impulse, wake);
};;

b2Body.prototype['GetMass'] = b2Body.prototype.GetMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetMass_0(self);
};;

b2Body.prototype['GetInertia'] = b2Body.prototype.GetInertia = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetInertia_0(self);
};;

b2Body.prototype['GetMassData'] = b2Body.prototype.GetMassData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(data) {
  var self = this.ptr;
  if (data && typeof data === 'object') data = data.ptr;
  _emscripten_bind_b2Body_GetMassData_1(self, data);
};;

b2Body.prototype['SetMassData'] = b2Body.prototype.SetMassData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(data) {
  var self = this.ptr;
  if (data && typeof data === 'object') data = data.ptr;
  _emscripten_bind_b2Body_SetMassData_1(self, data);
};;

b2Body.prototype['ResetMassData'] = b2Body.prototype.ResetMassData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Body_ResetMassData_0(self);
};;

b2Body.prototype['GetWorldPoint'] = b2Body.prototype.GetWorldPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(localPoint) {
  var self = this.ptr;
  if (localPoint && typeof localPoint === 'object') localPoint = localPoint.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetWorldPoint_1(self, localPoint), b2Vec2);
};;

b2Body.prototype['GetWorldVector'] = b2Body.prototype.GetWorldVector = /** @suppress {undefinedVars, duplicate} @this{Object} */function(localVector) {
  var self = this.ptr;
  if (localVector && typeof localVector === 'object') localVector = localVector.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetWorldVector_1(self, localVector), b2Vec2);
};;

b2Body.prototype['GetLocalPoint'] = b2Body.prototype.GetLocalPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(worldPoint) {
  var self = this.ptr;
  if (worldPoint && typeof worldPoint === 'object') worldPoint = worldPoint.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLocalPoint_1(self, worldPoint), b2Vec2);
};;

b2Body.prototype['GetLocalVector'] = b2Body.prototype.GetLocalVector = /** @suppress {undefinedVars, duplicate} @this{Object} */function(worldVector) {
  var self = this.ptr;
  if (worldVector && typeof worldVector === 'object') worldVector = worldVector.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLocalVector_1(self, worldVector), b2Vec2);
};;

b2Body.prototype['GetLinearVelocityFromWorldPoint'] = b2Body.prototype.GetLinearVelocityFromWorldPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(worldPoint) {
  var self = this.ptr;
  if (worldPoint && typeof worldPoint === 'object') worldPoint = worldPoint.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLinearVelocityFromWorldPoint_1(self, worldPoint), b2Vec2);
};;

b2Body.prototype['GetLinearVelocityFromLocalPoint'] = b2Body.prototype.GetLinearVelocityFromLocalPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(localPoint) {
  var self = this.ptr;
  if (localPoint && typeof localPoint === 'object') localPoint = localPoint.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetLinearVelocityFromLocalPoint_1(self, localPoint), b2Vec2);
};;

b2Body.prototype['GetLinearDamping'] = b2Body.prototype.GetLinearDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetLinearDamping_0(self);
};;

b2Body.prototype['SetLinearDamping'] = b2Body.prototype.SetLinearDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(linearDamping) {
  var self = this.ptr;
  if (linearDamping && typeof linearDamping === 'object') linearDamping = linearDamping.ptr;
  _emscripten_bind_b2Body_SetLinearDamping_1(self, linearDamping);
};;

b2Body.prototype['GetAngularDamping'] = b2Body.prototype.GetAngularDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetAngularDamping_0(self);
};;

b2Body.prototype['SetAngularDamping'] = b2Body.prototype.SetAngularDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(angularDamping) {
  var self = this.ptr;
  if (angularDamping && typeof angularDamping === 'object') angularDamping = angularDamping.ptr;
  _emscripten_bind_b2Body_SetAngularDamping_1(self, angularDamping);
};;

b2Body.prototype['GetGravityScale'] = b2Body.prototype.GetGravityScale = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetGravityScale_0(self);
};;

b2Body.prototype['SetGravityScale'] = b2Body.prototype.SetGravityScale = /** @suppress {undefinedVars, duplicate} @this{Object} */function(scale) {
  var self = this.ptr;
  if (scale && typeof scale === 'object') scale = scale.ptr;
  _emscripten_bind_b2Body_SetGravityScale_1(self, scale);
};;

b2Body.prototype['SetType'] = b2Body.prototype.SetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function(type) {
  var self = this.ptr;
  if (type && typeof type === 'object') type = type.ptr;
  _emscripten_bind_b2Body_SetType_1(self, type);
};;

b2Body.prototype['GetType'] = b2Body.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Body_GetType_0(self);
};;

b2Body.prototype['SetBullet'] = b2Body.prototype.SetBullet = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Body_SetBullet_1(self, flag);
};;

b2Body.prototype['IsBullet'] = b2Body.prototype.IsBullet = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Body_IsBullet_0(self));
};;

b2Body.prototype['SetSleepingAllowed'] = b2Body.prototype.SetSleepingAllowed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Body_SetSleepingAllowed_1(self, flag);
};;

b2Body.prototype['IsSleepingAllowed'] = b2Body.prototype.IsSleepingAllowed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Body_IsSleepingAllowed_0(self));
};;

b2Body.prototype['SetAwake'] = b2Body.prototype.SetAwake = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Body_SetAwake_1(self, flag);
};;

b2Body.prototype['IsAwake'] = b2Body.prototype.IsAwake = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Body_IsAwake_0(self));
};;

b2Body.prototype['SetEnabled'] = b2Body.prototype.SetEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Body_SetEnabled_1(self, flag);
};;

b2Body.prototype['IsEnabled'] = b2Body.prototype.IsEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Body_IsEnabled_0(self));
};;

b2Body.prototype['SetFixedRotation'] = b2Body.prototype.SetFixedRotation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2Body_SetFixedRotation_1(self, flag);
};;

b2Body.prototype['IsFixedRotation'] = b2Body.prototype.IsFixedRotation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2Body_IsFixedRotation_0(self));
};;

b2Body.prototype['GetFixtureList'] = b2Body.prototype.GetFixtureList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetFixtureList_0(self), b2Fixture);
};;

b2Body.prototype['GetJointList'] = b2Body.prototype.GetJointList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetJointList_0(self), b2JointEdge);
};;

b2Body.prototype['GetContactList'] = b2Body.prototype.GetContactList = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetContactList_0(self), b2ContactEdge);
};;

b2Body.prototype['GetNext'] = b2Body.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetNext_0(self), b2Body);
};;

b2Body.prototype['GetUserData'] = b2Body.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetUserData_0(self), b2BodyUserData);
};;

b2Body.prototype['GetWorld'] = b2Body.prototype.GetWorld = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Body_GetWorld_0(self), b2World);
};;

b2Body.prototype['Dump'] = b2Body.prototype.Dump = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Body_Dump_0(self);
};;

// b2BodyDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2BodyDef() {
  this.ptr = _emscripten_bind_b2BodyDef_b2BodyDef_0();
  getCache(b2BodyDef)[this.ptr] = this;
};;
b2BodyDef.prototype = Object.create(WrapperObject.prototype);
b2BodyDef.prototype.constructor = b2BodyDef;
b2BodyDef.prototype.__class__ = b2BodyDef;
b2BodyDef.__cache__ = {};
Module['b2BodyDef'] = b2BodyDef;

  b2BodyDef.prototype['get_type'] = b2BodyDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_type_0(self);
};
    b2BodyDef.prototype['set_type'] = b2BodyDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'type', { get: b2BodyDef.prototype.get_type, set: b2BodyDef.prototype.set_type });
  b2BodyDef.prototype['get_position'] = b2BodyDef.prototype.get_position = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2BodyDef_get_position_0(self), b2Vec2);
};
    b2BodyDef.prototype['set_position'] = b2BodyDef.prototype.set_position = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_position_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'position', { get: b2BodyDef.prototype.get_position, set: b2BodyDef.prototype.set_position });
  b2BodyDef.prototype['get_angle'] = b2BodyDef.prototype.get_angle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_angle_0(self);
};
    b2BodyDef.prototype['set_angle'] = b2BodyDef.prototype.set_angle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_angle_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'angle', { get: b2BodyDef.prototype.get_angle, set: b2BodyDef.prototype.set_angle });
  b2BodyDef.prototype['get_linearVelocity'] = b2BodyDef.prototype.get_linearVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2BodyDef_get_linearVelocity_0(self), b2Vec2);
};
    b2BodyDef.prototype['set_linearVelocity'] = b2BodyDef.prototype.set_linearVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_linearVelocity_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'linearVelocity', { get: b2BodyDef.prototype.get_linearVelocity, set: b2BodyDef.prototype.set_linearVelocity });
  b2BodyDef.prototype['get_angularVelocity'] = b2BodyDef.prototype.get_angularVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_angularVelocity_0(self);
};
    b2BodyDef.prototype['set_angularVelocity'] = b2BodyDef.prototype.set_angularVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_angularVelocity_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'angularVelocity', { get: b2BodyDef.prototype.get_angularVelocity, set: b2BodyDef.prototype.set_angularVelocity });
  b2BodyDef.prototype['get_linearDamping'] = b2BodyDef.prototype.get_linearDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_linearDamping_0(self);
};
    b2BodyDef.prototype['set_linearDamping'] = b2BodyDef.prototype.set_linearDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_linearDamping_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'linearDamping', { get: b2BodyDef.prototype.get_linearDamping, set: b2BodyDef.prototype.set_linearDamping });
  b2BodyDef.prototype['get_angularDamping'] = b2BodyDef.prototype.get_angularDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_angularDamping_0(self);
};
    b2BodyDef.prototype['set_angularDamping'] = b2BodyDef.prototype.set_angularDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_angularDamping_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'angularDamping', { get: b2BodyDef.prototype.get_angularDamping, set: b2BodyDef.prototype.set_angularDamping });
  b2BodyDef.prototype['get_allowSleep'] = b2BodyDef.prototype.get_allowSleep = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2BodyDef_get_allowSleep_0(self));
};
    b2BodyDef.prototype['set_allowSleep'] = b2BodyDef.prototype.set_allowSleep = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_allowSleep_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'allowSleep', { get: b2BodyDef.prototype.get_allowSleep, set: b2BodyDef.prototype.set_allowSleep });
  b2BodyDef.prototype['get_awake'] = b2BodyDef.prototype.get_awake = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2BodyDef_get_awake_0(self));
};
    b2BodyDef.prototype['set_awake'] = b2BodyDef.prototype.set_awake = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_awake_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'awake', { get: b2BodyDef.prototype.get_awake, set: b2BodyDef.prototype.set_awake });
  b2BodyDef.prototype['get_fixedRotation'] = b2BodyDef.prototype.get_fixedRotation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2BodyDef_get_fixedRotation_0(self));
};
    b2BodyDef.prototype['set_fixedRotation'] = b2BodyDef.prototype.set_fixedRotation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_fixedRotation_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'fixedRotation', { get: b2BodyDef.prototype.get_fixedRotation, set: b2BodyDef.prototype.set_fixedRotation });
  b2BodyDef.prototype['get_bullet'] = b2BodyDef.prototype.get_bullet = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2BodyDef_get_bullet_0(self));
};
    b2BodyDef.prototype['set_bullet'] = b2BodyDef.prototype.set_bullet = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_bullet_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'bullet', { get: b2BodyDef.prototype.get_bullet, set: b2BodyDef.prototype.set_bullet });
  b2BodyDef.prototype['get_enabled'] = b2BodyDef.prototype.get_enabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2BodyDef_get_enabled_0(self));
};
    b2BodyDef.prototype['set_enabled'] = b2BodyDef.prototype.set_enabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_enabled_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'enabled', { get: b2BodyDef.prototype.get_enabled, set: b2BodyDef.prototype.set_enabled });
  b2BodyDef.prototype['get_userData'] = b2BodyDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2BodyDef_get_userData_0(self), b2BodyUserData);
};
    b2BodyDef.prototype['set_userData'] = b2BodyDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'userData', { get: b2BodyDef.prototype.get_userData, set: b2BodyDef.prototype.set_userData });
  b2BodyDef.prototype['get_gravityScale'] = b2BodyDef.prototype.get_gravityScale = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2BodyDef_get_gravityScale_0(self);
};
    b2BodyDef.prototype['set_gravityScale'] = b2BodyDef.prototype.set_gravityScale = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2BodyDef_set_gravityScale_1(self, arg0);
};
    Object.defineProperty(b2BodyDef.prototype, 'gravityScale', { get: b2BodyDef.prototype.get_gravityScale, set: b2BodyDef.prototype.set_gravityScale });
  b2BodyDef.prototype['__destroy__'] = b2BodyDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2BodyDef___destroy___0(self);
};
// b2Filter
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Filter() {
  this.ptr = _emscripten_bind_b2Filter_b2Filter_0();
  getCache(b2Filter)[this.ptr] = this;
};;
b2Filter.prototype = Object.create(WrapperObject.prototype);
b2Filter.prototype.constructor = b2Filter;
b2Filter.prototype.__class__ = b2Filter;
b2Filter.__cache__ = {};
Module['b2Filter'] = b2Filter;

  b2Filter.prototype['get_categoryBits'] = b2Filter.prototype.get_categoryBits = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Filter_get_categoryBits_0(self);
};
    b2Filter.prototype['set_categoryBits'] = b2Filter.prototype.set_categoryBits = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Filter_set_categoryBits_1(self, arg0);
};
    Object.defineProperty(b2Filter.prototype, 'categoryBits', { get: b2Filter.prototype.get_categoryBits, set: b2Filter.prototype.set_categoryBits });
  b2Filter.prototype['get_maskBits'] = b2Filter.prototype.get_maskBits = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Filter_get_maskBits_0(self);
};
    b2Filter.prototype['set_maskBits'] = b2Filter.prototype.set_maskBits = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Filter_set_maskBits_1(self, arg0);
};
    Object.defineProperty(b2Filter.prototype, 'maskBits', { get: b2Filter.prototype.get_maskBits, set: b2Filter.prototype.set_maskBits });
  b2Filter.prototype['get_groupIndex'] = b2Filter.prototype.get_groupIndex = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Filter_get_groupIndex_0(self);
};
    b2Filter.prototype['set_groupIndex'] = b2Filter.prototype.set_groupIndex = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Filter_set_groupIndex_1(self, arg0);
};
    Object.defineProperty(b2Filter.prototype, 'groupIndex', { get: b2Filter.prototype.get_groupIndex, set: b2Filter.prototype.set_groupIndex });
  b2Filter.prototype['__destroy__'] = b2Filter.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Filter___destroy___0(self);
};
// b2AABB
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2AABB() {
  this.ptr = _emscripten_bind_b2AABB_b2AABB_0();
  getCache(b2AABB)[this.ptr] = this;
};;
b2AABB.prototype = Object.create(WrapperObject.prototype);
b2AABB.prototype.constructor = b2AABB;
b2AABB.prototype.__class__ = b2AABB;
b2AABB.__cache__ = {};
Module['b2AABB'] = b2AABB;

b2AABB.prototype['IsValid'] = b2AABB.prototype.IsValid = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2AABB_IsValid_0(self));
};;

b2AABB.prototype['GetCenter'] = b2AABB.prototype.GetCenter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2AABB_GetCenter_0(self), b2Vec2);
};;

b2AABB.prototype['GetExtents'] = b2AABB.prototype.GetExtents = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2AABB_GetExtents_0(self), b2Vec2);
};;

b2AABB.prototype['GetPerimeter'] = b2AABB.prototype.GetPerimeter = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2AABB_GetPerimeter_0(self);
};;

b2AABB.prototype['Combine'] = b2AABB.prototype.Combine = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb1, aabb2) {
  var self = this.ptr;
  if (aabb1 && typeof aabb1 === 'object') aabb1 = aabb1.ptr;
  if (aabb2 && typeof aabb2 === 'object') aabb2 = aabb2.ptr;
  if (aabb2 === undefined) { _emscripten_bind_b2AABB_Combine_1(self, aabb1);  return }
  _emscripten_bind_b2AABB_Combine_2(self, aabb1, aabb2);
};;

b2AABB.prototype['Contains'] = b2AABB.prototype.Contains = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  return !!(_emscripten_bind_b2AABB_Contains_1(self, aabb));
};;

b2AABB.prototype['RayCast'] = b2AABB.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  return !!(_emscripten_bind_b2AABB_RayCast_2(self, output, input));
};;

  b2AABB.prototype['get_lowerBound'] = b2AABB.prototype.get_lowerBound = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2AABB_get_lowerBound_0(self), b2Vec2);
};
    b2AABB.prototype['set_lowerBound'] = b2AABB.prototype.set_lowerBound = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2AABB_set_lowerBound_1(self, arg0);
};
    Object.defineProperty(b2AABB.prototype, 'lowerBound', { get: b2AABB.prototype.get_lowerBound, set: b2AABB.prototype.set_lowerBound });
  b2AABB.prototype['get_upperBound'] = b2AABB.prototype.get_upperBound = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2AABB_get_upperBound_0(self), b2Vec2);
};
    b2AABB.prototype['set_upperBound'] = b2AABB.prototype.set_upperBound = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2AABB_set_upperBound_1(self, arg0);
};
    Object.defineProperty(b2AABB.prototype, 'upperBound', { get: b2AABB.prototype.get_upperBound, set: b2AABB.prototype.set_upperBound });
  b2AABB.prototype['__destroy__'] = b2AABB.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2AABB___destroy___0(self);
};
// b2CircleShape
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2CircleShape() {
  this.ptr = _emscripten_bind_b2CircleShape_b2CircleShape_0();
  getCache(b2CircleShape)[this.ptr] = this;
};;
b2CircleShape.prototype = Object.create(b2Shape.prototype);
b2CircleShape.prototype.constructor = b2CircleShape;
b2CircleShape.prototype.__class__ = b2CircleShape;
b2CircleShape.__cache__ = {};
Module['b2CircleShape'] = b2CircleShape;

b2CircleShape.prototype['GetType'] = b2CircleShape.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2CircleShape_GetType_0(self);
};;

b2CircleShape.prototype['GetChildCount'] = b2CircleShape.prototype.GetChildCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2CircleShape_GetChildCount_0(self);
};;

b2CircleShape.prototype['TestPoint'] = b2CircleShape.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf, p) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2CircleShape_TestPoint_2(self, xf, p));
};;

b2CircleShape.prototype['RayCast'] = b2CircleShape.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, transform, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (transform && typeof transform === 'object') transform = transform.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2CircleShape_RayCast_4(self, output, input, transform, childIndex));
};;

b2CircleShape.prototype['ComputeAABB'] = b2CircleShape.prototype.ComputeAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb, xf, childIndex) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  _emscripten_bind_b2CircleShape_ComputeAABB_3(self, aabb, xf, childIndex);
};;

b2CircleShape.prototype['ComputeMass'] = b2CircleShape.prototype.ComputeMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData, density) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2CircleShape_ComputeMass_2(self, massData, density);
};;

  b2CircleShape.prototype['get_m_p'] = b2CircleShape.prototype.get_m_p = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2CircleShape_get_m_p_0(self), b2Vec2);
};
    b2CircleShape.prototype['set_m_p'] = b2CircleShape.prototype.set_m_p = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2CircleShape_set_m_p_1(self, arg0);
};
    Object.defineProperty(b2CircleShape.prototype, 'm_p', { get: b2CircleShape.prototype.get_m_p, set: b2CircleShape.prototype.set_m_p });
  b2CircleShape.prototype['get_m_type'] = b2CircleShape.prototype.get_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2CircleShape_get_m_type_0(self);
};
    b2CircleShape.prototype['set_m_type'] = b2CircleShape.prototype.set_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2CircleShape_set_m_type_1(self, arg0);
};
    Object.defineProperty(b2CircleShape.prototype, 'm_type', { get: b2CircleShape.prototype.get_m_type, set: b2CircleShape.prototype.set_m_type });
  b2CircleShape.prototype['get_m_radius'] = b2CircleShape.prototype.get_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2CircleShape_get_m_radius_0(self);
};
    b2CircleShape.prototype['set_m_radius'] = b2CircleShape.prototype.set_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2CircleShape_set_m_radius_1(self, arg0);
};
    Object.defineProperty(b2CircleShape.prototype, 'm_radius', { get: b2CircleShape.prototype.get_m_radius, set: b2CircleShape.prototype.set_m_radius });
  b2CircleShape.prototype['__destroy__'] = b2CircleShape.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2CircleShape___destroy___0(self);
};
// b2EdgeShape
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2EdgeShape() {
  this.ptr = _emscripten_bind_b2EdgeShape_b2EdgeShape_0();
  getCache(b2EdgeShape)[this.ptr] = this;
};;
b2EdgeShape.prototype = Object.create(b2Shape.prototype);
b2EdgeShape.prototype.constructor = b2EdgeShape;
b2EdgeShape.prototype.__class__ = b2EdgeShape;
b2EdgeShape.__cache__ = {};
Module['b2EdgeShape'] = b2EdgeShape;

b2EdgeShape.prototype['SetOneSided'] = b2EdgeShape.prototype.SetOneSided = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v0, v1, v2, v3) {
  var self = this.ptr;
  if (v0 && typeof v0 === 'object') v0 = v0.ptr;
  if (v1 && typeof v1 === 'object') v1 = v1.ptr;
  if (v2 && typeof v2 === 'object') v2 = v2.ptr;
  if (v3 && typeof v3 === 'object') v3 = v3.ptr;
  _emscripten_bind_b2EdgeShape_SetOneSided_4(self, v0, v1, v2, v3);
};;

b2EdgeShape.prototype['SetTwoSided'] = b2EdgeShape.prototype.SetTwoSided = /** @suppress {undefinedVars, duplicate} @this{Object} */function(v1, v2) {
  var self = this.ptr;
  if (v1 && typeof v1 === 'object') v1 = v1.ptr;
  if (v2 && typeof v2 === 'object') v2 = v2.ptr;
  _emscripten_bind_b2EdgeShape_SetTwoSided_2(self, v1, v2);
};;

b2EdgeShape.prototype['GetType'] = b2EdgeShape.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2EdgeShape_GetType_0(self);
};;

b2EdgeShape.prototype['GetChildCount'] = b2EdgeShape.prototype.GetChildCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2EdgeShape_GetChildCount_0(self);
};;

b2EdgeShape.prototype['TestPoint'] = b2EdgeShape.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf, p) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2EdgeShape_TestPoint_2(self, xf, p));
};;

b2EdgeShape.prototype['RayCast'] = b2EdgeShape.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, transform, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (transform && typeof transform === 'object') transform = transform.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2EdgeShape_RayCast_4(self, output, input, transform, childIndex));
};;

b2EdgeShape.prototype['ComputeAABB'] = b2EdgeShape.prototype.ComputeAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb, xf, childIndex) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  _emscripten_bind_b2EdgeShape_ComputeAABB_3(self, aabb, xf, childIndex);
};;

b2EdgeShape.prototype['ComputeMass'] = b2EdgeShape.prototype.ComputeMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData, density) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2EdgeShape_ComputeMass_2(self, massData, density);
};;

  b2EdgeShape.prototype['get_m_vertex1'] = b2EdgeShape.prototype.get_m_vertex1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2EdgeShape_get_m_vertex1_0(self), b2Vec2);
};
    b2EdgeShape.prototype['set_m_vertex1'] = b2EdgeShape.prototype.set_m_vertex1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_vertex1_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_vertex1', { get: b2EdgeShape.prototype.get_m_vertex1, set: b2EdgeShape.prototype.set_m_vertex1 });
  b2EdgeShape.prototype['get_m_vertex2'] = b2EdgeShape.prototype.get_m_vertex2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2EdgeShape_get_m_vertex2_0(self), b2Vec2);
};
    b2EdgeShape.prototype['set_m_vertex2'] = b2EdgeShape.prototype.set_m_vertex2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_vertex2_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_vertex2', { get: b2EdgeShape.prototype.get_m_vertex2, set: b2EdgeShape.prototype.set_m_vertex2 });
  b2EdgeShape.prototype['get_m_vertex0'] = b2EdgeShape.prototype.get_m_vertex0 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2EdgeShape_get_m_vertex0_0(self), b2Vec2);
};
    b2EdgeShape.prototype['set_m_vertex0'] = b2EdgeShape.prototype.set_m_vertex0 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_vertex0_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_vertex0', { get: b2EdgeShape.prototype.get_m_vertex0, set: b2EdgeShape.prototype.set_m_vertex0 });
  b2EdgeShape.prototype['get_m_vertex3'] = b2EdgeShape.prototype.get_m_vertex3 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2EdgeShape_get_m_vertex3_0(self), b2Vec2);
};
    b2EdgeShape.prototype['set_m_vertex3'] = b2EdgeShape.prototype.set_m_vertex3 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_vertex3_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_vertex3', { get: b2EdgeShape.prototype.get_m_vertex3, set: b2EdgeShape.prototype.set_m_vertex3 });
  b2EdgeShape.prototype['get_m_oneSided'] = b2EdgeShape.prototype.get_m_oneSided = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2EdgeShape_get_m_oneSided_0(self));
};
    b2EdgeShape.prototype['set_m_oneSided'] = b2EdgeShape.prototype.set_m_oneSided = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_oneSided_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_oneSided', { get: b2EdgeShape.prototype.get_m_oneSided, set: b2EdgeShape.prototype.set_m_oneSided });
  b2EdgeShape.prototype['get_m_type'] = b2EdgeShape.prototype.get_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2EdgeShape_get_m_type_0(self);
};
    b2EdgeShape.prototype['set_m_type'] = b2EdgeShape.prototype.set_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_type_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_type', { get: b2EdgeShape.prototype.get_m_type, set: b2EdgeShape.prototype.set_m_type });
  b2EdgeShape.prototype['get_m_radius'] = b2EdgeShape.prototype.get_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2EdgeShape_get_m_radius_0(self);
};
    b2EdgeShape.prototype['set_m_radius'] = b2EdgeShape.prototype.set_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2EdgeShape_set_m_radius_1(self, arg0);
};
    Object.defineProperty(b2EdgeShape.prototype, 'm_radius', { get: b2EdgeShape.prototype.get_m_radius, set: b2EdgeShape.prototype.set_m_radius });
  b2EdgeShape.prototype['__destroy__'] = b2EdgeShape.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2EdgeShape___destroy___0(self);
};
// b2JointUserData
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2JointUserData() { throw "cannot construct a b2JointUserData, no constructor in IDL" }
b2JointUserData.prototype = Object.create(WrapperObject.prototype);
b2JointUserData.prototype.constructor = b2JointUserData;
b2JointUserData.prototype.__class__ = b2JointUserData;
b2JointUserData.__cache__ = {};
Module['b2JointUserData'] = b2JointUserData;

  b2JointUserData.prototype['get_pointer'] = b2JointUserData.prototype.get_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2JointUserData_get_pointer_0(self);
};
    b2JointUserData.prototype['set_pointer'] = b2JointUserData.prototype.set_pointer = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointUserData_set_pointer_1(self, arg0);
};
    Object.defineProperty(b2JointUserData.prototype, 'pointer', { get: b2JointUserData.prototype.get_pointer, set: b2JointUserData.prototype.set_pointer });
  b2JointUserData.prototype['__destroy__'] = b2JointUserData.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2JointUserData___destroy___0(self);
};
// b2WeldJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2WeldJoint() { throw "cannot construct a b2WeldJoint, no constructor in IDL" }
b2WeldJoint.prototype = Object.create(b2Joint.prototype);
b2WeldJoint.prototype.constructor = b2WeldJoint;
b2WeldJoint.prototype.__class__ = b2WeldJoint;
b2WeldJoint.__cache__ = {};
Module['b2WeldJoint'] = b2WeldJoint;

b2WeldJoint.prototype['GetLocalAnchorA'] = b2WeldJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2WeldJoint.prototype['GetLocalAnchorB'] = b2WeldJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2WeldJoint.prototype['GetReferenceAngle'] = b2WeldJoint.prototype.GetReferenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJoint_GetReferenceAngle_0(self);
};;

b2WeldJoint.prototype['SetStiffness'] = b2WeldJoint.prototype.SetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(stiffness) {
  var self = this.ptr;
  if (stiffness && typeof stiffness === 'object') stiffness = stiffness.ptr;
  _emscripten_bind_b2WeldJoint_SetStiffness_1(self, stiffness);
};;

b2WeldJoint.prototype['GetStiffness'] = b2WeldJoint.prototype.GetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJoint_GetStiffness_0(self);
};;

b2WeldJoint.prototype['SetDamping'] = b2WeldJoint.prototype.SetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(damping) {
  var self = this.ptr;
  if (damping && typeof damping === 'object') damping = damping.ptr;
  _emscripten_bind_b2WeldJoint_SetDamping_1(self, damping);
};;

b2WeldJoint.prototype['GetDamping'] = b2WeldJoint.prototype.GetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJoint_GetDamping_0(self);
};;

b2WeldJoint.prototype['Dump'] = b2WeldJoint.prototype.Dump = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WeldJoint_Dump_0(self);
};;

b2WeldJoint.prototype['GetType'] = b2WeldJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJoint_GetType_0(self);
};;

b2WeldJoint.prototype['GetBodyA'] = b2WeldJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetBodyA_0(self), b2Body);
};;

b2WeldJoint.prototype['GetBodyB'] = b2WeldJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetBodyB_0(self), b2Body);
};;

b2WeldJoint.prototype['GetAnchorA'] = b2WeldJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetAnchorA_0(self), b2Vec2);
};;

b2WeldJoint.prototype['GetAnchorB'] = b2WeldJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetAnchorB_0(self), b2Vec2);
};;

b2WeldJoint.prototype['GetReactionForce'] = b2WeldJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2WeldJoint.prototype['GetReactionTorque'] = b2WeldJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2WeldJoint_GetReactionTorque_1(self, inv_dt);
};;

b2WeldJoint.prototype['GetNext'] = b2WeldJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetNext_0(self), b2Joint);
};;

b2WeldJoint.prototype['GetUserData'] = b2WeldJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJoint_GetUserData_0(self), b2JointUserData);
};;

b2WeldJoint.prototype['GetCollideConnected'] = b2WeldJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WeldJoint_GetCollideConnected_0(self));
};;

  b2WeldJoint.prototype['__destroy__'] = b2WeldJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WeldJoint___destroy___0(self);
};
// b2WeldJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2WeldJointDef() {
  this.ptr = _emscripten_bind_b2WeldJointDef_b2WeldJointDef_0();
  getCache(b2WeldJointDef)[this.ptr] = this;
};;
b2WeldJointDef.prototype = Object.create(b2JointDef.prototype);
b2WeldJointDef.prototype.constructor = b2WeldJointDef;
b2WeldJointDef.prototype.__class__ = b2WeldJointDef;
b2WeldJointDef.__cache__ = {};
Module['b2WeldJointDef'] = b2WeldJointDef;

b2WeldJointDef.prototype['Initialize'] = b2WeldJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchor) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchor && typeof anchor === 'object') anchor = anchor.ptr;
  _emscripten_bind_b2WeldJointDef_Initialize_3(self, bodyA, bodyB, anchor);
};;

  b2WeldJointDef.prototype['get_localAnchorA'] = b2WeldJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2WeldJointDef.prototype['set_localAnchorA'] = b2WeldJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'localAnchorA', { get: b2WeldJointDef.prototype.get_localAnchorA, set: b2WeldJointDef.prototype.set_localAnchorA });
  b2WeldJointDef.prototype['get_localAnchorB'] = b2WeldJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2WeldJointDef.prototype['set_localAnchorB'] = b2WeldJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'localAnchorB', { get: b2WeldJointDef.prototype.get_localAnchorB, set: b2WeldJointDef.prototype.set_localAnchorB });
  b2WeldJointDef.prototype['get_referenceAngle'] = b2WeldJointDef.prototype.get_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJointDef_get_referenceAngle_0(self);
};
    b2WeldJointDef.prototype['set_referenceAngle'] = b2WeldJointDef.prototype.set_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_referenceAngle_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'referenceAngle', { get: b2WeldJointDef.prototype.get_referenceAngle, set: b2WeldJointDef.prototype.set_referenceAngle });
  b2WeldJointDef.prototype['get_stiffness'] = b2WeldJointDef.prototype.get_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJointDef_get_stiffness_0(self);
};
    b2WeldJointDef.prototype['set_stiffness'] = b2WeldJointDef.prototype.set_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_stiffness_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'stiffness', { get: b2WeldJointDef.prototype.get_stiffness, set: b2WeldJointDef.prototype.set_stiffness });
  b2WeldJointDef.prototype['get_damping'] = b2WeldJointDef.prototype.get_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJointDef_get_damping_0(self);
};
    b2WeldJointDef.prototype['set_damping'] = b2WeldJointDef.prototype.set_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_damping_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'damping', { get: b2WeldJointDef.prototype.get_damping, set: b2WeldJointDef.prototype.set_damping });
  b2WeldJointDef.prototype['get_type'] = b2WeldJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WeldJointDef_get_type_0(self);
};
    b2WeldJointDef.prototype['set_type'] = b2WeldJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'type', { get: b2WeldJointDef.prototype.get_type, set: b2WeldJointDef.prototype.set_type });
  b2WeldJointDef.prototype['get_userData'] = b2WeldJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJointDef_get_userData_0(self), b2JointUserData);
};
    b2WeldJointDef.prototype['set_userData'] = b2WeldJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'userData', { get: b2WeldJointDef.prototype.get_userData, set: b2WeldJointDef.prototype.set_userData });
  b2WeldJointDef.prototype['get_bodyA'] = b2WeldJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJointDef_get_bodyA_0(self), b2Body);
};
    b2WeldJointDef.prototype['set_bodyA'] = b2WeldJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'bodyA', { get: b2WeldJointDef.prototype.get_bodyA, set: b2WeldJointDef.prototype.set_bodyA });
  b2WeldJointDef.prototype['get_bodyB'] = b2WeldJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WeldJointDef_get_bodyB_0(self), b2Body);
};
    b2WeldJointDef.prototype['set_bodyB'] = b2WeldJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'bodyB', { get: b2WeldJointDef.prototype.get_bodyB, set: b2WeldJointDef.prototype.set_bodyB });
  b2WeldJointDef.prototype['get_collideConnected'] = b2WeldJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WeldJointDef_get_collideConnected_0(self));
};
    b2WeldJointDef.prototype['set_collideConnected'] = b2WeldJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WeldJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2WeldJointDef.prototype, 'collideConnected', { get: b2WeldJointDef.prototype.get_collideConnected, set: b2WeldJointDef.prototype.set_collideConnected });
  b2WeldJointDef.prototype['__destroy__'] = b2WeldJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WeldJointDef___destroy___0(self);
};
// b2ChainShape
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ChainShape() {
  this.ptr = _emscripten_bind_b2ChainShape_b2ChainShape_0();
  getCache(b2ChainShape)[this.ptr] = this;
};;
b2ChainShape.prototype = Object.create(b2Shape.prototype);
b2ChainShape.prototype.constructor = b2ChainShape;
b2ChainShape.prototype.__class__ = b2ChainShape;
b2ChainShape.__cache__ = {};
Module['b2ChainShape'] = b2ChainShape;

b2ChainShape.prototype['Clear'] = b2ChainShape.prototype.Clear = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ChainShape_Clear_0(self);
};;

b2ChainShape.prototype['CreateLoop'] = b2ChainShape.prototype.CreateLoop = /** @suppress {undefinedVars, duplicate} @this{Object} */function(vertices, count) {
  var self = this.ptr;
  if (vertices && typeof vertices === 'object') vertices = vertices.ptr;
  if (count && typeof count === 'object') count = count.ptr;
  _emscripten_bind_b2ChainShape_CreateLoop_2(self, vertices, count);
};;

b2ChainShape.prototype['CreateChain'] = b2ChainShape.prototype.CreateChain = /** @suppress {undefinedVars, duplicate} @this{Object} */function(vertices, count, prevVertex, nextVertex) {
  var self = this.ptr;
  if (vertices && typeof vertices === 'object') vertices = vertices.ptr;
  if (count && typeof count === 'object') count = count.ptr;
  if (prevVertex && typeof prevVertex === 'object') prevVertex = prevVertex.ptr;
  if (nextVertex && typeof nextVertex === 'object') nextVertex = nextVertex.ptr;
  _emscripten_bind_b2ChainShape_CreateChain_4(self, vertices, count, prevVertex, nextVertex);
};;

b2ChainShape.prototype['GetChildEdge'] = b2ChainShape.prototype.GetChildEdge = /** @suppress {undefinedVars, duplicate} @this{Object} */function(edge, index) {
  var self = this.ptr;
  if (edge && typeof edge === 'object') edge = edge.ptr;
  if (index && typeof index === 'object') index = index.ptr;
  _emscripten_bind_b2ChainShape_GetChildEdge_2(self, edge, index);
};;

b2ChainShape.prototype['GetType'] = b2ChainShape.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ChainShape_GetType_0(self);
};;

b2ChainShape.prototype['GetChildCount'] = b2ChainShape.prototype.GetChildCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ChainShape_GetChildCount_0(self);
};;

b2ChainShape.prototype['TestPoint'] = b2ChainShape.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf, p) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2ChainShape_TestPoint_2(self, xf, p));
};;

b2ChainShape.prototype['RayCast'] = b2ChainShape.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, transform, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (transform && typeof transform === 'object') transform = transform.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2ChainShape_RayCast_4(self, output, input, transform, childIndex));
};;

b2ChainShape.prototype['ComputeAABB'] = b2ChainShape.prototype.ComputeAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb, xf, childIndex) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  _emscripten_bind_b2ChainShape_ComputeAABB_3(self, aabb, xf, childIndex);
};;

b2ChainShape.prototype['ComputeMass'] = b2ChainShape.prototype.ComputeMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData, density) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2ChainShape_ComputeMass_2(self, massData, density);
};;

  b2ChainShape.prototype['get_m_vertices'] = b2ChainShape.prototype.get_m_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ChainShape_get_m_vertices_0(self), b2Vec2);
};
    b2ChainShape.prototype['set_m_vertices'] = b2ChainShape.prototype.set_m_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_vertices_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_vertices', { get: b2ChainShape.prototype.get_m_vertices, set: b2ChainShape.prototype.set_m_vertices });
  b2ChainShape.prototype['get_m_count'] = b2ChainShape.prototype.get_m_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ChainShape_get_m_count_0(self);
};
    b2ChainShape.prototype['set_m_count'] = b2ChainShape.prototype.set_m_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_count_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_count', { get: b2ChainShape.prototype.get_m_count, set: b2ChainShape.prototype.set_m_count });
  b2ChainShape.prototype['get_m_prevVertex'] = b2ChainShape.prototype.get_m_prevVertex = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ChainShape_get_m_prevVertex_0(self), b2Vec2);
};
    b2ChainShape.prototype['set_m_prevVertex'] = b2ChainShape.prototype.set_m_prevVertex = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_prevVertex_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_prevVertex', { get: b2ChainShape.prototype.get_m_prevVertex, set: b2ChainShape.prototype.set_m_prevVertex });
  b2ChainShape.prototype['get_m_nextVertex'] = b2ChainShape.prototype.get_m_nextVertex = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ChainShape_get_m_nextVertex_0(self), b2Vec2);
};
    b2ChainShape.prototype['set_m_nextVertex'] = b2ChainShape.prototype.set_m_nextVertex = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_nextVertex_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_nextVertex', { get: b2ChainShape.prototype.get_m_nextVertex, set: b2ChainShape.prototype.set_m_nextVertex });
  b2ChainShape.prototype['get_m_type'] = b2ChainShape.prototype.get_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ChainShape_get_m_type_0(self);
};
    b2ChainShape.prototype['set_m_type'] = b2ChainShape.prototype.set_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_type_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_type', { get: b2ChainShape.prototype.get_m_type, set: b2ChainShape.prototype.set_m_type });
  b2ChainShape.prototype['get_m_radius'] = b2ChainShape.prototype.get_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ChainShape_get_m_radius_0(self);
};
    b2ChainShape.prototype['set_m_radius'] = b2ChainShape.prototype.set_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ChainShape_set_m_radius_1(self, arg0);
};
    Object.defineProperty(b2ChainShape.prototype, 'm_radius', { get: b2ChainShape.prototype.get_m_radius, set: b2ChainShape.prototype.set_m_radius });
  b2ChainShape.prototype['__destroy__'] = b2ChainShape.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ChainShape___destroy___0(self);
};
// b2Color
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Color(r, g, b) {
  if (r && typeof r === 'object') r = r.ptr;
  if (g && typeof g === 'object') g = g.ptr;
  if (b && typeof b === 'object') b = b.ptr;
  if (r === undefined) { this.ptr = _emscripten_bind_b2Color_b2Color_0(); getCache(b2Color)[this.ptr] = this;return }
  if (g === undefined) { this.ptr = _emscripten_bind_b2Color_b2Color_1(r); getCache(b2Color)[this.ptr] = this;return }
  if (b === undefined) { this.ptr = _emscripten_bind_b2Color_b2Color_2(r, g); getCache(b2Color)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Color_b2Color_3(r, g, b);
  getCache(b2Color)[this.ptr] = this;
};;
b2Color.prototype = Object.create(WrapperObject.prototype);
b2Color.prototype.constructor = b2Color;
b2Color.prototype.__class__ = b2Color;
b2Color.__cache__ = {};
Module['b2Color'] = b2Color;

b2Color.prototype['Set'] = b2Color.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(ri, gi, bi) {
  var self = this.ptr;
  if (ri && typeof ri === 'object') ri = ri.ptr;
  if (gi && typeof gi === 'object') gi = gi.ptr;
  if (bi && typeof bi === 'object') bi = bi.ptr;
  _emscripten_bind_b2Color_Set_3(self, ri, gi, bi);
};;

  b2Color.prototype['get_r'] = b2Color.prototype.get_r = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Color_get_r_0(self);
};
    b2Color.prototype['set_r'] = b2Color.prototype.set_r = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Color_set_r_1(self, arg0);
};
    Object.defineProperty(b2Color.prototype, 'r', { get: b2Color.prototype.get_r, set: b2Color.prototype.set_r });
  b2Color.prototype['get_g'] = b2Color.prototype.get_g = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Color_get_g_0(self);
};
    b2Color.prototype['set_g'] = b2Color.prototype.set_g = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Color_set_g_1(self, arg0);
};
    Object.defineProperty(b2Color.prototype, 'g', { get: b2Color.prototype.get_g, set: b2Color.prototype.set_g });
  b2Color.prototype['get_b'] = b2Color.prototype.get_b = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Color_get_b_0(self);
};
    b2Color.prototype['set_b'] = b2Color.prototype.set_b = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Color_set_b_1(self, arg0);
};
    Object.defineProperty(b2Color.prototype, 'b', { get: b2Color.prototype.get_b, set: b2Color.prototype.set_b });
  b2Color.prototype['__destroy__'] = b2Color.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Color___destroy___0(self);
};
// b2ContactEdge
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactEdge() {
  this.ptr = _emscripten_bind_b2ContactEdge_b2ContactEdge_0();
  getCache(b2ContactEdge)[this.ptr] = this;
};;
b2ContactEdge.prototype = Object.create(WrapperObject.prototype);
b2ContactEdge.prototype.constructor = b2ContactEdge;
b2ContactEdge.prototype.__class__ = b2ContactEdge;
b2ContactEdge.__cache__ = {};
Module['b2ContactEdge'] = b2ContactEdge;

  b2ContactEdge.prototype['get_other'] = b2ContactEdge.prototype.get_other = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ContactEdge_get_other_0(self), b2Body);
};
    b2ContactEdge.prototype['set_other'] = b2ContactEdge.prototype.set_other = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactEdge_set_other_1(self, arg0);
};
    Object.defineProperty(b2ContactEdge.prototype, 'other', { get: b2ContactEdge.prototype.get_other, set: b2ContactEdge.prototype.set_other });
  b2ContactEdge.prototype['get_contact'] = b2ContactEdge.prototype.get_contact = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ContactEdge_get_contact_0(self), b2Contact);
};
    b2ContactEdge.prototype['set_contact'] = b2ContactEdge.prototype.set_contact = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactEdge_set_contact_1(self, arg0);
};
    Object.defineProperty(b2ContactEdge.prototype, 'contact', { get: b2ContactEdge.prototype.get_contact, set: b2ContactEdge.prototype.set_contact });
  b2ContactEdge.prototype['get_prev'] = b2ContactEdge.prototype.get_prev = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ContactEdge_get_prev_0(self), b2ContactEdge);
};
    b2ContactEdge.prototype['set_prev'] = b2ContactEdge.prototype.set_prev = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactEdge_set_prev_1(self, arg0);
};
    Object.defineProperty(b2ContactEdge.prototype, 'prev', { get: b2ContactEdge.prototype.get_prev, set: b2ContactEdge.prototype.set_prev });
  b2ContactEdge.prototype['get_next'] = b2ContactEdge.prototype.get_next = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ContactEdge_get_next_0(self), b2ContactEdge);
};
    b2ContactEdge.prototype['set_next'] = b2ContactEdge.prototype.set_next = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactEdge_set_next_1(self, arg0);
};
    Object.defineProperty(b2ContactEdge.prototype, 'next', { get: b2ContactEdge.prototype.get_next, set: b2ContactEdge.prototype.set_next });
  b2ContactEdge.prototype['__destroy__'] = b2ContactEdge.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactEdge___destroy___0(self);
};
// b2ContactFeature
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactFeature() { throw "cannot construct a b2ContactFeature, no constructor in IDL" }
b2ContactFeature.prototype = Object.create(WrapperObject.prototype);
b2ContactFeature.prototype.constructor = b2ContactFeature;
b2ContactFeature.prototype.__class__ = b2ContactFeature;
b2ContactFeature.__cache__ = {};
Module['b2ContactFeature'] = b2ContactFeature;

  b2ContactFeature.prototype['get_indexA'] = b2ContactFeature.prototype.get_indexA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactFeature_get_indexA_0(self);
};
    b2ContactFeature.prototype['set_indexA'] = b2ContactFeature.prototype.set_indexA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactFeature_set_indexA_1(self, arg0);
};
    Object.defineProperty(b2ContactFeature.prototype, 'indexA', { get: b2ContactFeature.prototype.get_indexA, set: b2ContactFeature.prototype.set_indexA });
  b2ContactFeature.prototype['get_indexB'] = b2ContactFeature.prototype.get_indexB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactFeature_get_indexB_0(self);
};
    b2ContactFeature.prototype['set_indexB'] = b2ContactFeature.prototype.set_indexB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactFeature_set_indexB_1(self, arg0);
};
    Object.defineProperty(b2ContactFeature.prototype, 'indexB', { get: b2ContactFeature.prototype.get_indexB, set: b2ContactFeature.prototype.set_indexB });
  b2ContactFeature.prototype['get_typeA'] = b2ContactFeature.prototype.get_typeA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactFeature_get_typeA_0(self);
};
    b2ContactFeature.prototype['set_typeA'] = b2ContactFeature.prototype.set_typeA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactFeature_set_typeA_1(self, arg0);
};
    Object.defineProperty(b2ContactFeature.prototype, 'typeA', { get: b2ContactFeature.prototype.get_typeA, set: b2ContactFeature.prototype.set_typeA });
  b2ContactFeature.prototype['get_typeB'] = b2ContactFeature.prototype.get_typeB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactFeature_get_typeB_0(self);
};
    b2ContactFeature.prototype['set_typeB'] = b2ContactFeature.prototype.set_typeB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactFeature_set_typeB_1(self, arg0);
};
    Object.defineProperty(b2ContactFeature.prototype, 'typeB', { get: b2ContactFeature.prototype.get_typeB, set: b2ContactFeature.prototype.set_typeB });
  b2ContactFeature.prototype['__destroy__'] = b2ContactFeature.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactFeature___destroy___0(self);
};
// JSContactFilter
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSContactFilter() {
  this.ptr = _emscripten_bind_JSContactFilter_JSContactFilter_0();
  getCache(JSContactFilter)[this.ptr] = this;
};;
JSContactFilter.prototype = Object.create(b2ContactFilter.prototype);
JSContactFilter.prototype.constructor = JSContactFilter;
JSContactFilter.prototype.__class__ = JSContactFilter;
JSContactFilter.__cache__ = {};
Module['JSContactFilter'] = JSContactFilter;

JSContactFilter.prototype['ShouldCollide'] = JSContactFilter.prototype.ShouldCollide = /** @suppress {undefinedVars, duplicate} @this{Object} */function(fixtureA, fixtureB) {
  var self = this.ptr;
  if (fixtureA && typeof fixtureA === 'object') fixtureA = fixtureA.ptr;
  if (fixtureB && typeof fixtureB === 'object') fixtureB = fixtureB.ptr;
  return !!(_emscripten_bind_JSContactFilter_ShouldCollide_2(self, fixtureA, fixtureB));
};;

  JSContactFilter.prototype['__destroy__'] = JSContactFilter.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSContactFilter___destroy___0(self);
};
// b2ContactID
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactID() { throw "cannot construct a b2ContactID, no constructor in IDL" }
b2ContactID.prototype = Object.create(WrapperObject.prototype);
b2ContactID.prototype.constructor = b2ContactID;
b2ContactID.prototype.__class__ = b2ContactID;
b2ContactID.__cache__ = {};
Module['b2ContactID'] = b2ContactID;

  b2ContactID.prototype['get_cf'] = b2ContactID.prototype.get_cf = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ContactID_get_cf_0(self), b2ContactFeature);
};
    b2ContactID.prototype['set_cf'] = b2ContactID.prototype.set_cf = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactID_set_cf_1(self, arg0);
};
    Object.defineProperty(b2ContactID.prototype, 'cf', { get: b2ContactID.prototype.get_cf, set: b2ContactID.prototype.set_cf });
  b2ContactID.prototype['get_key'] = b2ContactID.prototype.get_key = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactID_get_key_0(self);
};
    b2ContactID.prototype['set_key'] = b2ContactID.prototype.set_key = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactID_set_key_1(self, arg0);
};
    Object.defineProperty(b2ContactID.prototype, 'key', { get: b2ContactID.prototype.get_key, set: b2ContactID.prototype.set_key });
  b2ContactID.prototype['__destroy__'] = b2ContactID.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactID___destroy___0(self);
};
// b2ContactImpulse
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ContactImpulse() { throw "cannot construct a b2ContactImpulse, no constructor in IDL" }
b2ContactImpulse.prototype = Object.create(WrapperObject.prototype);
b2ContactImpulse.prototype.constructor = b2ContactImpulse;
b2ContactImpulse.prototype.__class__ = b2ContactImpulse;
b2ContactImpulse.__cache__ = {};
Module['b2ContactImpulse'] = b2ContactImpulse;

  b2ContactImpulse.prototype['get_normalImpulses'] = b2ContactImpulse.prototype.get_normalImpulses = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return _emscripten_bind_b2ContactImpulse_get_normalImpulses_1(self, arg0);
};
    b2ContactImpulse.prototype['set_normalImpulses'] = b2ContactImpulse.prototype.set_normalImpulses = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2ContactImpulse_set_normalImpulses_2(self, arg0, arg1);
};
    Object.defineProperty(b2ContactImpulse.prototype, 'normalImpulses', { get: b2ContactImpulse.prototype.get_normalImpulses, set: b2ContactImpulse.prototype.set_normalImpulses });
  b2ContactImpulse.prototype['get_tangentImpulses'] = b2ContactImpulse.prototype.get_tangentImpulses = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return _emscripten_bind_b2ContactImpulse_get_tangentImpulses_1(self, arg0);
};
    b2ContactImpulse.prototype['set_tangentImpulses'] = b2ContactImpulse.prototype.set_tangentImpulses = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2ContactImpulse_set_tangentImpulses_2(self, arg0, arg1);
};
    Object.defineProperty(b2ContactImpulse.prototype, 'tangentImpulses', { get: b2ContactImpulse.prototype.get_tangentImpulses, set: b2ContactImpulse.prototype.set_tangentImpulses });
  b2ContactImpulse.prototype['get_count'] = b2ContactImpulse.prototype.get_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ContactImpulse_get_count_0(self);
};
    b2ContactImpulse.prototype['set_count'] = b2ContactImpulse.prototype.set_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ContactImpulse_set_count_1(self, arg0);
};
    Object.defineProperty(b2ContactImpulse.prototype, 'count', { get: b2ContactImpulse.prototype.get_count, set: b2ContactImpulse.prototype.set_count });
  b2ContactImpulse.prototype['__destroy__'] = b2ContactImpulse.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ContactImpulse___destroy___0(self);
};
// b2DestructionListener
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2DestructionListener() { throw "cannot construct a b2DestructionListener, no constructor in IDL" }
b2DestructionListener.prototype = Object.create(WrapperObject.prototype);
b2DestructionListener.prototype.constructor = b2DestructionListener;
b2DestructionListener.prototype.__class__ = b2DestructionListener;
b2DestructionListener.__cache__ = {};
Module['b2DestructionListener'] = b2DestructionListener;

  b2DestructionListener.prototype['__destroy__'] = b2DestructionListener.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2DestructionListener___destroy___0(self);
};
// JSDestructionListener
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSDestructionListener() {
  this.ptr = _emscripten_bind_JSDestructionListener_JSDestructionListener_0();
  getCache(JSDestructionListener)[this.ptr] = this;
};;
JSDestructionListener.prototype = Object.create(b2DestructionListenerWrapper.prototype);
JSDestructionListener.prototype.constructor = JSDestructionListener;
JSDestructionListener.prototype.__class__ = JSDestructionListener;
JSDestructionListener.__cache__ = {};
Module['JSDestructionListener'] = JSDestructionListener;

JSDestructionListener.prototype['SayGoodbyeJoint'] = JSDestructionListener.prototype.SayGoodbyeJoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(joint) {
  var self = this.ptr;
  if (joint && typeof joint === 'object') joint = joint.ptr;
  _emscripten_bind_JSDestructionListener_SayGoodbyeJoint_1(self, joint);
};;

JSDestructionListener.prototype['SayGoodbyeFixture'] = JSDestructionListener.prototype.SayGoodbyeFixture = /** @suppress {undefinedVars, duplicate} @this{Object} */function(joint) {
  var self = this.ptr;
  if (joint && typeof joint === 'object') joint = joint.ptr;
  _emscripten_bind_JSDestructionListener_SayGoodbyeFixture_1(self, joint);
};;

  JSDestructionListener.prototype['__destroy__'] = JSDestructionListener.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSDestructionListener___destroy___0(self);
};
// b2DistanceJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2DistanceJoint() { throw "cannot construct a b2DistanceJoint, no constructor in IDL" }
b2DistanceJoint.prototype = Object.create(b2Joint.prototype);
b2DistanceJoint.prototype.constructor = b2DistanceJoint;
b2DistanceJoint.prototype.__class__ = b2DistanceJoint;
b2DistanceJoint.__cache__ = {};
Module['b2DistanceJoint'] = b2DistanceJoint;

b2DistanceJoint.prototype['GetLocalAnchorA'] = b2DistanceJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2DistanceJoint.prototype['GetLocalAnchorB'] = b2DistanceJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2DistanceJoint.prototype['GetLength'] = b2DistanceJoint.prototype.GetLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetLength_0(self);
};;

b2DistanceJoint.prototype['SetLength'] = b2DistanceJoint.prototype.SetLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function(length) {
  var self = this.ptr;
  if (length && typeof length === 'object') length = length.ptr;
  _emscripten_bind_b2DistanceJoint_SetLength_1(self, length);
};;

b2DistanceJoint.prototype['GetMinLength'] = b2DistanceJoint.prototype.GetMinLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetMinLength_0(self);
};;

b2DistanceJoint.prototype['SetMinLength'] = b2DistanceJoint.prototype.SetMinLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function(minLength) {
  var self = this.ptr;
  if (minLength && typeof minLength === 'object') minLength = minLength.ptr;
  _emscripten_bind_b2DistanceJoint_SetMinLength_1(self, minLength);
};;

b2DistanceJoint.prototype['GetMaxLength'] = b2DistanceJoint.prototype.GetMaxLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetMaxLength_0(self);
};;

b2DistanceJoint.prototype['SetMaxLength'] = b2DistanceJoint.prototype.SetMaxLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function(maxLength) {
  var self = this.ptr;
  if (maxLength && typeof maxLength === 'object') maxLength = maxLength.ptr;
  _emscripten_bind_b2DistanceJoint_SetMaxLength_1(self, maxLength);
};;

b2DistanceJoint.prototype['GetCurrentLength'] = b2DistanceJoint.prototype.GetCurrentLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetCurrentLength_0(self);
};;

b2DistanceJoint.prototype['SetStiffness'] = b2DistanceJoint.prototype.SetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(stiffness) {
  var self = this.ptr;
  if (stiffness && typeof stiffness === 'object') stiffness = stiffness.ptr;
  _emscripten_bind_b2DistanceJoint_SetStiffness_1(self, stiffness);
};;

b2DistanceJoint.prototype['GetStiffness'] = b2DistanceJoint.prototype.GetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetStiffness_0(self);
};;

b2DistanceJoint.prototype['SetDamping'] = b2DistanceJoint.prototype.SetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(damping) {
  var self = this.ptr;
  if (damping && typeof damping === 'object') damping = damping.ptr;
  _emscripten_bind_b2DistanceJoint_SetDamping_1(self, damping);
};;

b2DistanceJoint.prototype['GetDamping'] = b2DistanceJoint.prototype.GetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetDamping_0(self);
};;

b2DistanceJoint.prototype['GetType'] = b2DistanceJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJoint_GetType_0(self);
};;

b2DistanceJoint.prototype['GetBodyA'] = b2DistanceJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetBodyA_0(self), b2Body);
};;

b2DistanceJoint.prototype['GetBodyB'] = b2DistanceJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetBodyB_0(self), b2Body);
};;

b2DistanceJoint.prototype['GetAnchorA'] = b2DistanceJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetAnchorA_0(self), b2Vec2);
};;

b2DistanceJoint.prototype['GetAnchorB'] = b2DistanceJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetAnchorB_0(self), b2Vec2);
};;

b2DistanceJoint.prototype['GetReactionForce'] = b2DistanceJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2DistanceJoint.prototype['GetReactionTorque'] = b2DistanceJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2DistanceJoint_GetReactionTorque_1(self, inv_dt);
};;

b2DistanceJoint.prototype['GetNext'] = b2DistanceJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetNext_0(self), b2Joint);
};;

b2DistanceJoint.prototype['GetUserData'] = b2DistanceJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJoint_GetUserData_0(self), b2JointUserData);
};;

b2DistanceJoint.prototype['GetCollideConnected'] = b2DistanceJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2DistanceJoint_GetCollideConnected_0(self));
};;

  b2DistanceJoint.prototype['__destroy__'] = b2DistanceJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2DistanceJoint___destroy___0(self);
};
// b2DistanceJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2DistanceJointDef() {
  this.ptr = _emscripten_bind_b2DistanceJointDef_b2DistanceJointDef_0();
  getCache(b2DistanceJointDef)[this.ptr] = this;
};;
b2DistanceJointDef.prototype = Object.create(b2JointDef.prototype);
b2DistanceJointDef.prototype.constructor = b2DistanceJointDef;
b2DistanceJointDef.prototype.__class__ = b2DistanceJointDef;
b2DistanceJointDef.__cache__ = {};
Module['b2DistanceJointDef'] = b2DistanceJointDef;

b2DistanceJointDef.prototype['Initialize'] = b2DistanceJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchorA, anchorB) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchorA && typeof anchorA === 'object') anchorA = anchorA.ptr;
  if (anchorB && typeof anchorB === 'object') anchorB = anchorB.ptr;
  _emscripten_bind_b2DistanceJointDef_Initialize_4(self, bodyA, bodyB, anchorA, anchorB);
};;

  b2DistanceJointDef.prototype['get_localAnchorA'] = b2DistanceJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2DistanceJointDef.prototype['set_localAnchorA'] = b2DistanceJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'localAnchorA', { get: b2DistanceJointDef.prototype.get_localAnchorA, set: b2DistanceJointDef.prototype.set_localAnchorA });
  b2DistanceJointDef.prototype['get_localAnchorB'] = b2DistanceJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2DistanceJointDef.prototype['set_localAnchorB'] = b2DistanceJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'localAnchorB', { get: b2DistanceJointDef.prototype.get_localAnchorB, set: b2DistanceJointDef.prototype.set_localAnchorB });
  b2DistanceJointDef.prototype['get_length'] = b2DistanceJointDef.prototype.get_length = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_length_0(self);
};
    b2DistanceJointDef.prototype['set_length'] = b2DistanceJointDef.prototype.set_length = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_length_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'length', { get: b2DistanceJointDef.prototype.get_length, set: b2DistanceJointDef.prototype.set_length });
  b2DistanceJointDef.prototype['get_minLength'] = b2DistanceJointDef.prototype.get_minLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_minLength_0(self);
};
    b2DistanceJointDef.prototype['set_minLength'] = b2DistanceJointDef.prototype.set_minLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_minLength_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'minLength', { get: b2DistanceJointDef.prototype.get_minLength, set: b2DistanceJointDef.prototype.set_minLength });
  b2DistanceJointDef.prototype['get_maxLength'] = b2DistanceJointDef.prototype.get_maxLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_maxLength_0(self);
};
    b2DistanceJointDef.prototype['set_maxLength'] = b2DistanceJointDef.prototype.set_maxLength = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_maxLength_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'maxLength', { get: b2DistanceJointDef.prototype.get_maxLength, set: b2DistanceJointDef.prototype.set_maxLength });
  b2DistanceJointDef.prototype['get_stiffness'] = b2DistanceJointDef.prototype.get_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_stiffness_0(self);
};
    b2DistanceJointDef.prototype['set_stiffness'] = b2DistanceJointDef.prototype.set_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_stiffness_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'stiffness', { get: b2DistanceJointDef.prototype.get_stiffness, set: b2DistanceJointDef.prototype.set_stiffness });
  b2DistanceJointDef.prototype['get_damping'] = b2DistanceJointDef.prototype.get_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_damping_0(self);
};
    b2DistanceJointDef.prototype['set_damping'] = b2DistanceJointDef.prototype.set_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_damping_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'damping', { get: b2DistanceJointDef.prototype.get_damping, set: b2DistanceJointDef.prototype.set_damping });
  b2DistanceJointDef.prototype['get_type'] = b2DistanceJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2DistanceJointDef_get_type_0(self);
};
    b2DistanceJointDef.prototype['set_type'] = b2DistanceJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'type', { get: b2DistanceJointDef.prototype.get_type, set: b2DistanceJointDef.prototype.set_type });
  b2DistanceJointDef.prototype['get_userData'] = b2DistanceJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJointDef_get_userData_0(self), b2JointUserData);
};
    b2DistanceJointDef.prototype['set_userData'] = b2DistanceJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'userData', { get: b2DistanceJointDef.prototype.get_userData, set: b2DistanceJointDef.prototype.set_userData });
  b2DistanceJointDef.prototype['get_bodyA'] = b2DistanceJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJointDef_get_bodyA_0(self), b2Body);
};
    b2DistanceJointDef.prototype['set_bodyA'] = b2DistanceJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'bodyA', { get: b2DistanceJointDef.prototype.get_bodyA, set: b2DistanceJointDef.prototype.set_bodyA });
  b2DistanceJointDef.prototype['get_bodyB'] = b2DistanceJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2DistanceJointDef_get_bodyB_0(self), b2Body);
};
    b2DistanceJointDef.prototype['set_bodyB'] = b2DistanceJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'bodyB', { get: b2DistanceJointDef.prototype.get_bodyB, set: b2DistanceJointDef.prototype.set_bodyB });
  b2DistanceJointDef.prototype['get_collideConnected'] = b2DistanceJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2DistanceJointDef_get_collideConnected_0(self));
};
    b2DistanceJointDef.prototype['set_collideConnected'] = b2DistanceJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2DistanceJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2DistanceJointDef.prototype, 'collideConnected', { get: b2DistanceJointDef.prototype.get_collideConnected, set: b2DistanceJointDef.prototype.set_collideConnected });
  b2DistanceJointDef.prototype['__destroy__'] = b2DistanceJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2DistanceJointDef___destroy___0(self);
};
// JSDraw
/** @suppress {undefinedVars, duplicate} @this{Object} */function JSDraw() {
  this.ptr = _emscripten_bind_JSDraw_JSDraw_0();
  getCache(JSDraw)[this.ptr] = this;
};;
JSDraw.prototype = Object.create(b2Draw.prototype);
JSDraw.prototype.constructor = JSDraw;
JSDraw.prototype.__class__ = JSDraw;
JSDraw.__cache__ = {};
Module['JSDraw'] = JSDraw;

JSDraw.prototype['DrawPolygon'] = JSDraw.prototype.DrawPolygon = /** @suppress {undefinedVars, duplicate} @this{Object} */function(vertices, vertexCount, color) {
  var self = this.ptr;
  if (vertices && typeof vertices === 'object') vertices = vertices.ptr;
  if (vertexCount && typeof vertexCount === 'object') vertexCount = vertexCount.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawPolygon_3(self, vertices, vertexCount, color);
};;

JSDraw.prototype['DrawSolidPolygon'] = JSDraw.prototype.DrawSolidPolygon = /** @suppress {undefinedVars, duplicate} @this{Object} */function(vertices, vertexCount, color) {
  var self = this.ptr;
  if (vertices && typeof vertices === 'object') vertices = vertices.ptr;
  if (vertexCount && typeof vertexCount === 'object') vertexCount = vertexCount.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawSolidPolygon_3(self, vertices, vertexCount, color);
};;

JSDraw.prototype['DrawCircle'] = JSDraw.prototype.DrawCircle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(center, radius, color) {
  var self = this.ptr;
  if (center && typeof center === 'object') center = center.ptr;
  if (radius && typeof radius === 'object') radius = radius.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawCircle_3(self, center, radius, color);
};;

JSDraw.prototype['DrawSolidCircle'] = JSDraw.prototype.DrawSolidCircle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(center, radius, axis, color) {
  var self = this.ptr;
  if (center && typeof center === 'object') center = center.ptr;
  if (radius && typeof radius === 'object') radius = radius.ptr;
  if (axis && typeof axis === 'object') axis = axis.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawSolidCircle_4(self, center, radius, axis, color);
};;

JSDraw.prototype['DrawSegment'] = JSDraw.prototype.DrawSegment = /** @suppress {undefinedVars, duplicate} @this{Object} */function(p1, p2, color) {
  var self = this.ptr;
  if (p1 && typeof p1 === 'object') p1 = p1.ptr;
  if (p2 && typeof p2 === 'object') p2 = p2.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawSegment_3(self, p1, p2, color);
};;

JSDraw.prototype['DrawTransform'] = JSDraw.prototype.DrawTransform = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  _emscripten_bind_JSDraw_DrawTransform_1(self, xf);
};;

JSDraw.prototype['DrawPoint'] = JSDraw.prototype.DrawPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(p, size, color) {
  var self = this.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  if (size && typeof size === 'object') size = size.ptr;
  if (color && typeof color === 'object') color = color.ptr;
  _emscripten_bind_JSDraw_DrawPoint_3(self, p, size, color);
};;

  JSDraw.prototype['__destroy__'] = JSDraw.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_JSDraw___destroy___0(self);
};
// b2FrictionJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2FrictionJoint() { throw "cannot construct a b2FrictionJoint, no constructor in IDL" }
b2FrictionJoint.prototype = Object.create(b2Joint.prototype);
b2FrictionJoint.prototype.constructor = b2FrictionJoint;
b2FrictionJoint.prototype.__class__ = b2FrictionJoint;
b2FrictionJoint.__cache__ = {};
Module['b2FrictionJoint'] = b2FrictionJoint;

b2FrictionJoint.prototype['GetLocalAnchorA'] = b2FrictionJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2FrictionJoint.prototype['GetLocalAnchorB'] = b2FrictionJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2FrictionJoint.prototype['SetMaxForce'] = b2FrictionJoint.prototype.SetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  _emscripten_bind_b2FrictionJoint_SetMaxForce_1(self, force);
};;

b2FrictionJoint.prototype['GetMaxForce'] = b2FrictionJoint.prototype.GetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJoint_GetMaxForce_0(self);
};;

b2FrictionJoint.prototype['SetMaxTorque'] = b2FrictionJoint.prototype.SetMaxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(torque) {
  var self = this.ptr;
  if (torque && typeof torque === 'object') torque = torque.ptr;
  _emscripten_bind_b2FrictionJoint_SetMaxTorque_1(self, torque);
};;

b2FrictionJoint.prototype['GetMaxTorque'] = b2FrictionJoint.prototype.GetMaxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJoint_GetMaxTorque_0(self);
};;

b2FrictionJoint.prototype['GetType'] = b2FrictionJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJoint_GetType_0(self);
};;

b2FrictionJoint.prototype['GetBodyA'] = b2FrictionJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetBodyA_0(self), b2Body);
};;

b2FrictionJoint.prototype['GetBodyB'] = b2FrictionJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetBodyB_0(self), b2Body);
};;

b2FrictionJoint.prototype['GetAnchorA'] = b2FrictionJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetAnchorA_0(self), b2Vec2);
};;

b2FrictionJoint.prototype['GetAnchorB'] = b2FrictionJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetAnchorB_0(self), b2Vec2);
};;

b2FrictionJoint.prototype['GetReactionForce'] = b2FrictionJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2FrictionJoint.prototype['GetReactionTorque'] = b2FrictionJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2FrictionJoint_GetReactionTorque_1(self, inv_dt);
};;

b2FrictionJoint.prototype['GetNext'] = b2FrictionJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetNext_0(self), b2Joint);
};;

b2FrictionJoint.prototype['GetUserData'] = b2FrictionJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJoint_GetUserData_0(self), b2JointUserData);
};;

b2FrictionJoint.prototype['GetCollideConnected'] = b2FrictionJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2FrictionJoint_GetCollideConnected_0(self));
};;

  b2FrictionJoint.prototype['__destroy__'] = b2FrictionJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2FrictionJoint___destroy___0(self);
};
// b2FrictionJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2FrictionJointDef() {
  this.ptr = _emscripten_bind_b2FrictionJointDef_b2FrictionJointDef_0();
  getCache(b2FrictionJointDef)[this.ptr] = this;
};;
b2FrictionJointDef.prototype = Object.create(b2JointDef.prototype);
b2FrictionJointDef.prototype.constructor = b2FrictionJointDef;
b2FrictionJointDef.prototype.__class__ = b2FrictionJointDef;
b2FrictionJointDef.__cache__ = {};
Module['b2FrictionJointDef'] = b2FrictionJointDef;

b2FrictionJointDef.prototype['Initialize'] = b2FrictionJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchor) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchor && typeof anchor === 'object') anchor = anchor.ptr;
  _emscripten_bind_b2FrictionJointDef_Initialize_3(self, bodyA, bodyB, anchor);
};;

  b2FrictionJointDef.prototype['get_localAnchorA'] = b2FrictionJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2FrictionJointDef.prototype['set_localAnchorA'] = b2FrictionJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'localAnchorA', { get: b2FrictionJointDef.prototype.get_localAnchorA, set: b2FrictionJointDef.prototype.set_localAnchorA });
  b2FrictionJointDef.prototype['get_localAnchorB'] = b2FrictionJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2FrictionJointDef.prototype['set_localAnchorB'] = b2FrictionJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'localAnchorB', { get: b2FrictionJointDef.prototype.get_localAnchorB, set: b2FrictionJointDef.prototype.set_localAnchorB });
  b2FrictionJointDef.prototype['get_maxForce'] = b2FrictionJointDef.prototype.get_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJointDef_get_maxForce_0(self);
};
    b2FrictionJointDef.prototype['set_maxForce'] = b2FrictionJointDef.prototype.set_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_maxForce_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'maxForce', { get: b2FrictionJointDef.prototype.get_maxForce, set: b2FrictionJointDef.prototype.set_maxForce });
  b2FrictionJointDef.prototype['get_maxTorque'] = b2FrictionJointDef.prototype.get_maxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJointDef_get_maxTorque_0(self);
};
    b2FrictionJointDef.prototype['set_maxTorque'] = b2FrictionJointDef.prototype.set_maxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_maxTorque_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'maxTorque', { get: b2FrictionJointDef.prototype.get_maxTorque, set: b2FrictionJointDef.prototype.set_maxTorque });
  b2FrictionJointDef.prototype['get_type'] = b2FrictionJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2FrictionJointDef_get_type_0(self);
};
    b2FrictionJointDef.prototype['set_type'] = b2FrictionJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'type', { get: b2FrictionJointDef.prototype.get_type, set: b2FrictionJointDef.prototype.set_type });
  b2FrictionJointDef.prototype['get_userData'] = b2FrictionJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJointDef_get_userData_0(self), b2JointUserData);
};
    b2FrictionJointDef.prototype['set_userData'] = b2FrictionJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'userData', { get: b2FrictionJointDef.prototype.get_userData, set: b2FrictionJointDef.prototype.set_userData });
  b2FrictionJointDef.prototype['get_bodyA'] = b2FrictionJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJointDef_get_bodyA_0(self), b2Body);
};
    b2FrictionJointDef.prototype['set_bodyA'] = b2FrictionJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'bodyA', { get: b2FrictionJointDef.prototype.get_bodyA, set: b2FrictionJointDef.prototype.set_bodyA });
  b2FrictionJointDef.prototype['get_bodyB'] = b2FrictionJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2FrictionJointDef_get_bodyB_0(self), b2Body);
};
    b2FrictionJointDef.prototype['set_bodyB'] = b2FrictionJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'bodyB', { get: b2FrictionJointDef.prototype.get_bodyB, set: b2FrictionJointDef.prototype.set_bodyB });
  b2FrictionJointDef.prototype['get_collideConnected'] = b2FrictionJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2FrictionJointDef_get_collideConnected_0(self));
};
    b2FrictionJointDef.prototype['set_collideConnected'] = b2FrictionJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2FrictionJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2FrictionJointDef.prototype, 'collideConnected', { get: b2FrictionJointDef.prototype.get_collideConnected, set: b2FrictionJointDef.prototype.set_collideConnected });
  b2FrictionJointDef.prototype['__destroy__'] = b2FrictionJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2FrictionJointDef___destroy___0(self);
};
// b2GearJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2GearJoint() { throw "cannot construct a b2GearJoint, no constructor in IDL" }
b2GearJoint.prototype = Object.create(b2Joint.prototype);
b2GearJoint.prototype.constructor = b2GearJoint;
b2GearJoint.prototype.__class__ = b2GearJoint;
b2GearJoint.__cache__ = {};
Module['b2GearJoint'] = b2GearJoint;

b2GearJoint.prototype['GetJoint1'] = b2GearJoint.prototype.GetJoint1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetJoint1_0(self), b2Joint);
};;

b2GearJoint.prototype['GetJoint2'] = b2GearJoint.prototype.GetJoint2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetJoint2_0(self), b2Joint);
};;

b2GearJoint.prototype['SetRatio'] = b2GearJoint.prototype.SetRatio = /** @suppress {undefinedVars, duplicate} @this{Object} */function(ratio) {
  var self = this.ptr;
  if (ratio && typeof ratio === 'object') ratio = ratio.ptr;
  _emscripten_bind_b2GearJoint_SetRatio_1(self, ratio);
};;

b2GearJoint.prototype['GetRatio'] = b2GearJoint.prototype.GetRatio = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2GearJoint_GetRatio_0(self);
};;

b2GearJoint.prototype['GetType'] = b2GearJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2GearJoint_GetType_0(self);
};;

b2GearJoint.prototype['GetBodyA'] = b2GearJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetBodyA_0(self), b2Body);
};;

b2GearJoint.prototype['GetBodyB'] = b2GearJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetBodyB_0(self), b2Body);
};;

b2GearJoint.prototype['GetAnchorA'] = b2GearJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetAnchorA_0(self), b2Vec2);
};;

b2GearJoint.prototype['GetAnchorB'] = b2GearJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetAnchorB_0(self), b2Vec2);
};;

b2GearJoint.prototype['GetReactionForce'] = b2GearJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2GearJoint.prototype['GetReactionTorque'] = b2GearJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2GearJoint_GetReactionTorque_1(self, inv_dt);
};;

b2GearJoint.prototype['GetNext'] = b2GearJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetNext_0(self), b2Joint);
};;

b2GearJoint.prototype['GetUserData'] = b2GearJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJoint_GetUserData_0(self), b2JointUserData);
};;

b2GearJoint.prototype['GetCollideConnected'] = b2GearJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2GearJoint_GetCollideConnected_0(self));
};;

  b2GearJoint.prototype['__destroy__'] = b2GearJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2GearJoint___destroy___0(self);
};
// b2GearJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2GearJointDef() {
  this.ptr = _emscripten_bind_b2GearJointDef_b2GearJointDef_0();
  getCache(b2GearJointDef)[this.ptr] = this;
};;
b2GearJointDef.prototype = Object.create(b2JointDef.prototype);
b2GearJointDef.prototype.constructor = b2GearJointDef;
b2GearJointDef.prototype.__class__ = b2GearJointDef;
b2GearJointDef.__cache__ = {};
Module['b2GearJointDef'] = b2GearJointDef;

  b2GearJointDef.prototype['get_joint1'] = b2GearJointDef.prototype.get_joint1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJointDef_get_joint1_0(self), b2Joint);
};
    b2GearJointDef.prototype['set_joint1'] = b2GearJointDef.prototype.set_joint1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_joint1_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'joint1', { get: b2GearJointDef.prototype.get_joint1, set: b2GearJointDef.prototype.set_joint1 });
  b2GearJointDef.prototype['get_joint2'] = b2GearJointDef.prototype.get_joint2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJointDef_get_joint2_0(self), b2Joint);
};
    b2GearJointDef.prototype['set_joint2'] = b2GearJointDef.prototype.set_joint2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_joint2_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'joint2', { get: b2GearJointDef.prototype.get_joint2, set: b2GearJointDef.prototype.set_joint2 });
  b2GearJointDef.prototype['get_ratio'] = b2GearJointDef.prototype.get_ratio = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2GearJointDef_get_ratio_0(self);
};
    b2GearJointDef.prototype['set_ratio'] = b2GearJointDef.prototype.set_ratio = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_ratio_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'ratio', { get: b2GearJointDef.prototype.get_ratio, set: b2GearJointDef.prototype.set_ratio });
  b2GearJointDef.prototype['get_type'] = b2GearJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2GearJointDef_get_type_0(self);
};
    b2GearJointDef.prototype['set_type'] = b2GearJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'type', { get: b2GearJointDef.prototype.get_type, set: b2GearJointDef.prototype.set_type });
  b2GearJointDef.prototype['get_userData'] = b2GearJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJointDef_get_userData_0(self), b2JointUserData);
};
    b2GearJointDef.prototype['set_userData'] = b2GearJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'userData', { get: b2GearJointDef.prototype.get_userData, set: b2GearJointDef.prototype.set_userData });
  b2GearJointDef.prototype['get_bodyA'] = b2GearJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJointDef_get_bodyA_0(self), b2Body);
};
    b2GearJointDef.prototype['set_bodyA'] = b2GearJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'bodyA', { get: b2GearJointDef.prototype.get_bodyA, set: b2GearJointDef.prototype.set_bodyA });
  b2GearJointDef.prototype['get_bodyB'] = b2GearJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2GearJointDef_get_bodyB_0(self), b2Body);
};
    b2GearJointDef.prototype['set_bodyB'] = b2GearJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'bodyB', { get: b2GearJointDef.prototype.get_bodyB, set: b2GearJointDef.prototype.set_bodyB });
  b2GearJointDef.prototype['get_collideConnected'] = b2GearJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2GearJointDef_get_collideConnected_0(self));
};
    b2GearJointDef.prototype['set_collideConnected'] = b2GearJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2GearJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2GearJointDef.prototype, 'collideConnected', { get: b2GearJointDef.prototype.get_collideConnected, set: b2GearJointDef.prototype.set_collideConnected });
  b2GearJointDef.prototype['__destroy__'] = b2GearJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2GearJointDef___destroy___0(self);
};
// b2JointEdge
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2JointEdge() {
  this.ptr = _emscripten_bind_b2JointEdge_b2JointEdge_0();
  getCache(b2JointEdge)[this.ptr] = this;
};;
b2JointEdge.prototype = Object.create(WrapperObject.prototype);
b2JointEdge.prototype.constructor = b2JointEdge;
b2JointEdge.prototype.__class__ = b2JointEdge;
b2JointEdge.__cache__ = {};
Module['b2JointEdge'] = b2JointEdge;

  b2JointEdge.prototype['get_other'] = b2JointEdge.prototype.get_other = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointEdge_get_other_0(self), b2Body);
};
    b2JointEdge.prototype['set_other'] = b2JointEdge.prototype.set_other = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointEdge_set_other_1(self, arg0);
};
    Object.defineProperty(b2JointEdge.prototype, 'other', { get: b2JointEdge.prototype.get_other, set: b2JointEdge.prototype.set_other });
  b2JointEdge.prototype['get_joint'] = b2JointEdge.prototype.get_joint = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointEdge_get_joint_0(self), b2Joint);
};
    b2JointEdge.prototype['set_joint'] = b2JointEdge.prototype.set_joint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointEdge_set_joint_1(self, arg0);
};
    Object.defineProperty(b2JointEdge.prototype, 'joint', { get: b2JointEdge.prototype.get_joint, set: b2JointEdge.prototype.set_joint });
  b2JointEdge.prototype['get_prev'] = b2JointEdge.prototype.get_prev = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointEdge_get_prev_0(self), b2JointEdge);
};
    b2JointEdge.prototype['set_prev'] = b2JointEdge.prototype.set_prev = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointEdge_set_prev_1(self, arg0);
};
    Object.defineProperty(b2JointEdge.prototype, 'prev', { get: b2JointEdge.prototype.get_prev, set: b2JointEdge.prototype.set_prev });
  b2JointEdge.prototype['get_next'] = b2JointEdge.prototype.get_next = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2JointEdge_get_next_0(self), b2JointEdge);
};
    b2JointEdge.prototype['set_next'] = b2JointEdge.prototype.set_next = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2JointEdge_set_next_1(self, arg0);
};
    Object.defineProperty(b2JointEdge.prototype, 'next', { get: b2JointEdge.prototype.get_next, set: b2JointEdge.prototype.set_next });
  b2JointEdge.prototype['__destroy__'] = b2JointEdge.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2JointEdge___destroy___0(self);
};
// b2Manifold
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Manifold() {
  this.ptr = _emscripten_bind_b2Manifold_b2Manifold_0();
  getCache(b2Manifold)[this.ptr] = this;
};;
b2Manifold.prototype = Object.create(WrapperObject.prototype);
b2Manifold.prototype.constructor = b2Manifold;
b2Manifold.prototype.__class__ = b2Manifold;
b2Manifold.__cache__ = {};
Module['b2Manifold'] = b2Manifold;

  b2Manifold.prototype['get_points'] = b2Manifold.prototype.get_points = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return wrapPointer(_emscripten_bind_b2Manifold_get_points_1(self, arg0), b2ManifoldPoint);
};
    b2Manifold.prototype['set_points'] = b2Manifold.prototype.set_points = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2Manifold_set_points_2(self, arg0, arg1);
};
    Object.defineProperty(b2Manifold.prototype, 'points', { get: b2Manifold.prototype.get_points, set: b2Manifold.prototype.set_points });
  b2Manifold.prototype['get_localNormal'] = b2Manifold.prototype.get_localNormal = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Manifold_get_localNormal_0(self), b2Vec2);
};
    b2Manifold.prototype['set_localNormal'] = b2Manifold.prototype.set_localNormal = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Manifold_set_localNormal_1(self, arg0);
};
    Object.defineProperty(b2Manifold.prototype, 'localNormal', { get: b2Manifold.prototype.get_localNormal, set: b2Manifold.prototype.set_localNormal });
  b2Manifold.prototype['get_localPoint'] = b2Manifold.prototype.get_localPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Manifold_get_localPoint_0(self), b2Vec2);
};
    b2Manifold.prototype['set_localPoint'] = b2Manifold.prototype.set_localPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Manifold_set_localPoint_1(self, arg0);
};
    Object.defineProperty(b2Manifold.prototype, 'localPoint', { get: b2Manifold.prototype.get_localPoint, set: b2Manifold.prototype.set_localPoint });
  b2Manifold.prototype['get_type'] = b2Manifold.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Manifold_get_type_0(self);
};
    b2Manifold.prototype['set_type'] = b2Manifold.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Manifold_set_type_1(self, arg0);
};
    Object.defineProperty(b2Manifold.prototype, 'type', { get: b2Manifold.prototype.get_type, set: b2Manifold.prototype.set_type });
  b2Manifold.prototype['get_pointCount'] = b2Manifold.prototype.get_pointCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Manifold_get_pointCount_0(self);
};
    b2Manifold.prototype['set_pointCount'] = b2Manifold.prototype.set_pointCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Manifold_set_pointCount_1(self, arg0);
};
    Object.defineProperty(b2Manifold.prototype, 'pointCount', { get: b2Manifold.prototype.get_pointCount, set: b2Manifold.prototype.set_pointCount });
  b2Manifold.prototype['__destroy__'] = b2Manifold.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Manifold___destroy___0(self);
};
// b2WorldManifold
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2WorldManifold() {
  this.ptr = _emscripten_bind_b2WorldManifold_b2WorldManifold_0();
  getCache(b2WorldManifold)[this.ptr] = this;
};;
b2WorldManifold.prototype = Object.create(WrapperObject.prototype);
b2WorldManifold.prototype.constructor = b2WorldManifold;
b2WorldManifold.prototype.__class__ = b2WorldManifold;
b2WorldManifold.__cache__ = {};
Module['b2WorldManifold'] = b2WorldManifold;

b2WorldManifold.prototype['Initialize'] = b2WorldManifold.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(manifold, xfA, radiusA, xfB, radiusB) {
  var self = this.ptr;
  if (manifold && typeof manifold === 'object') manifold = manifold.ptr;
  if (xfA && typeof xfA === 'object') xfA = xfA.ptr;
  if (radiusA && typeof radiusA === 'object') radiusA = radiusA.ptr;
  if (xfB && typeof xfB === 'object') xfB = xfB.ptr;
  if (radiusB && typeof radiusB === 'object') radiusB = radiusB.ptr;
  _emscripten_bind_b2WorldManifold_Initialize_5(self, manifold, xfA, radiusA, xfB, radiusB);
};;

  b2WorldManifold.prototype['get_normal'] = b2WorldManifold.prototype.get_normal = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WorldManifold_get_normal_0(self), b2Vec2);
};
    b2WorldManifold.prototype['set_normal'] = b2WorldManifold.prototype.set_normal = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WorldManifold_set_normal_1(self, arg0);
};
    Object.defineProperty(b2WorldManifold.prototype, 'normal', { get: b2WorldManifold.prototype.get_normal, set: b2WorldManifold.prototype.set_normal });
  b2WorldManifold.prototype['get_points'] = b2WorldManifold.prototype.get_points = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return wrapPointer(_emscripten_bind_b2WorldManifold_get_points_1(self, arg0), b2Vec2);
};
    b2WorldManifold.prototype['set_points'] = b2WorldManifold.prototype.set_points = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2WorldManifold_set_points_2(self, arg0, arg1);
};
    Object.defineProperty(b2WorldManifold.prototype, 'points', { get: b2WorldManifold.prototype.get_points, set: b2WorldManifold.prototype.set_points });
  b2WorldManifold.prototype['get_separations'] = b2WorldManifold.prototype.get_separations = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return _emscripten_bind_b2WorldManifold_get_separations_1(self, arg0);
};
    b2WorldManifold.prototype['set_separations'] = b2WorldManifold.prototype.set_separations = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2WorldManifold_set_separations_2(self, arg0, arg1);
};
    Object.defineProperty(b2WorldManifold.prototype, 'separations', { get: b2WorldManifold.prototype.get_separations, set: b2WorldManifold.prototype.set_separations });
  b2WorldManifold.prototype['__destroy__'] = b2WorldManifold.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WorldManifold___destroy___0(self);
};
// b2ManifoldPoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ManifoldPoint() {
  this.ptr = _emscripten_bind_b2ManifoldPoint_b2ManifoldPoint_0();
  getCache(b2ManifoldPoint)[this.ptr] = this;
};;
b2ManifoldPoint.prototype = Object.create(WrapperObject.prototype);
b2ManifoldPoint.prototype.constructor = b2ManifoldPoint;
b2ManifoldPoint.prototype.__class__ = b2ManifoldPoint;
b2ManifoldPoint.__cache__ = {};
Module['b2ManifoldPoint'] = b2ManifoldPoint;

  b2ManifoldPoint.prototype['get_localPoint'] = b2ManifoldPoint.prototype.get_localPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ManifoldPoint_get_localPoint_0(self), b2Vec2);
};
    b2ManifoldPoint.prototype['set_localPoint'] = b2ManifoldPoint.prototype.set_localPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ManifoldPoint_set_localPoint_1(self, arg0);
};
    Object.defineProperty(b2ManifoldPoint.prototype, 'localPoint', { get: b2ManifoldPoint.prototype.get_localPoint, set: b2ManifoldPoint.prototype.set_localPoint });
  b2ManifoldPoint.prototype['get_normalImpulse'] = b2ManifoldPoint.prototype.get_normalImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ManifoldPoint_get_normalImpulse_0(self);
};
    b2ManifoldPoint.prototype['set_normalImpulse'] = b2ManifoldPoint.prototype.set_normalImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ManifoldPoint_set_normalImpulse_1(self, arg0);
};
    Object.defineProperty(b2ManifoldPoint.prototype, 'normalImpulse', { get: b2ManifoldPoint.prototype.get_normalImpulse, set: b2ManifoldPoint.prototype.set_normalImpulse });
  b2ManifoldPoint.prototype['get_tangentImpulse'] = b2ManifoldPoint.prototype.get_tangentImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2ManifoldPoint_get_tangentImpulse_0(self);
};
    b2ManifoldPoint.prototype['set_tangentImpulse'] = b2ManifoldPoint.prototype.set_tangentImpulse = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ManifoldPoint_set_tangentImpulse_1(self, arg0);
};
    Object.defineProperty(b2ManifoldPoint.prototype, 'tangentImpulse', { get: b2ManifoldPoint.prototype.get_tangentImpulse, set: b2ManifoldPoint.prototype.set_tangentImpulse });
  b2ManifoldPoint.prototype['get_id'] = b2ManifoldPoint.prototype.get_id = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ManifoldPoint_get_id_0(self), b2ContactID);
};
    b2ManifoldPoint.prototype['set_id'] = b2ManifoldPoint.prototype.set_id = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ManifoldPoint_set_id_1(self, arg0);
};
    Object.defineProperty(b2ManifoldPoint.prototype, 'id', { get: b2ManifoldPoint.prototype.get_id, set: b2ManifoldPoint.prototype.set_id });
  b2ManifoldPoint.prototype['__destroy__'] = b2ManifoldPoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ManifoldPoint___destroy___0(self);
};
// b2Mat22
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Mat22(a11, a12, a21, a22) {
  if (a11 && typeof a11 === 'object') a11 = a11.ptr;
  if (a12 && typeof a12 === 'object') a12 = a12.ptr;
  if (a21 && typeof a21 === 'object') a21 = a21.ptr;
  if (a22 && typeof a22 === 'object') a22 = a22.ptr;
  if (a11 === undefined) { this.ptr = _emscripten_bind_b2Mat22_b2Mat22_0(); getCache(b2Mat22)[this.ptr] = this;return }
  if (a12 === undefined) { this.ptr = _emscripten_bind_b2Mat22_b2Mat22_1(a11); getCache(b2Mat22)[this.ptr] = this;return }
  if (a21 === undefined) { this.ptr = _emscripten_bind_b2Mat22_b2Mat22_2(a11, a12); getCache(b2Mat22)[this.ptr] = this;return }
  if (a22 === undefined) { this.ptr = _emscripten_bind_b2Mat22_b2Mat22_3(a11, a12, a21); getCache(b2Mat22)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Mat22_b2Mat22_4(a11, a12, a21, a22);
  getCache(b2Mat22)[this.ptr] = this;
};;
b2Mat22.prototype = Object.create(WrapperObject.prototype);
b2Mat22.prototype.constructor = b2Mat22;
b2Mat22.prototype.__class__ = b2Mat22;
b2Mat22.__cache__ = {};
Module['b2Mat22'] = b2Mat22;

b2Mat22.prototype['Set'] = b2Mat22.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(c1, c2) {
  var self = this.ptr;
  if (c1 && typeof c1 === 'object') c1 = c1.ptr;
  if (c2 && typeof c2 === 'object') c2 = c2.ptr;
  _emscripten_bind_b2Mat22_Set_2(self, c1, c2);
};;

b2Mat22.prototype['SetIdentity'] = b2Mat22.prototype.SetIdentity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Mat22_SetIdentity_0(self);
};;

b2Mat22.prototype['SetZero'] = b2Mat22.prototype.SetZero = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Mat22_SetZero_0(self);
};;

b2Mat22.prototype['GetInverse'] = b2Mat22.prototype.GetInverse = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat22_GetInverse_0(self), b2Mat22);
};;

b2Mat22.prototype['Solve'] = b2Mat22.prototype.Solve = /** @suppress {undefinedVars, duplicate} @this{Object} */function(b) {
  var self = this.ptr;
  if (b && typeof b === 'object') b = b.ptr;
  return wrapPointer(_emscripten_bind_b2Mat22_Solve_1(self, b), b2Vec2);
};;

  b2Mat22.prototype['get_ex'] = b2Mat22.prototype.get_ex = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat22_get_ex_0(self), b2Vec2);
};
    b2Mat22.prototype['set_ex'] = b2Mat22.prototype.set_ex = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Mat22_set_ex_1(self, arg0);
};
    Object.defineProperty(b2Mat22.prototype, 'ex', { get: b2Mat22.prototype.get_ex, set: b2Mat22.prototype.set_ex });
  b2Mat22.prototype['get_ey'] = b2Mat22.prototype.get_ey = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat22_get_ey_0(self), b2Vec2);
};
    b2Mat22.prototype['set_ey'] = b2Mat22.prototype.set_ey = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Mat22_set_ey_1(self, arg0);
};
    Object.defineProperty(b2Mat22.prototype, 'ey', { get: b2Mat22.prototype.get_ey, set: b2Mat22.prototype.set_ey });
  b2Mat22.prototype['__destroy__'] = b2Mat22.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Mat22___destroy___0(self);
};
// b2Mat33
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Mat33(c1, c2, c3) {
  if (c1 && typeof c1 === 'object') c1 = c1.ptr;
  if (c2 && typeof c2 === 'object') c2 = c2.ptr;
  if (c3 && typeof c3 === 'object') c3 = c3.ptr;
  if (c1 === undefined) { this.ptr = _emscripten_bind_b2Mat33_b2Mat33_0(); getCache(b2Mat33)[this.ptr] = this;return }
  if (c2 === undefined) { this.ptr = _emscripten_bind_b2Mat33_b2Mat33_1(c1); getCache(b2Mat33)[this.ptr] = this;return }
  if (c3 === undefined) { this.ptr = _emscripten_bind_b2Mat33_b2Mat33_2(c1, c2); getCache(b2Mat33)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Mat33_b2Mat33_3(c1, c2, c3);
  getCache(b2Mat33)[this.ptr] = this;
};;
b2Mat33.prototype = Object.create(WrapperObject.prototype);
b2Mat33.prototype.constructor = b2Mat33;
b2Mat33.prototype.__class__ = b2Mat33;
b2Mat33.__cache__ = {};
Module['b2Mat33'] = b2Mat33;

b2Mat33.prototype['SetZero'] = b2Mat33.prototype.SetZero = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Mat33_SetZero_0(self);
};;

b2Mat33.prototype['Solve33'] = b2Mat33.prototype.Solve33 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(b) {
  var self = this.ptr;
  if (b && typeof b === 'object') b = b.ptr;
  return wrapPointer(_emscripten_bind_b2Mat33_Solve33_1(self, b), b2Vec3);
};;

b2Mat33.prototype['Solve22'] = b2Mat33.prototype.Solve22 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(b) {
  var self = this.ptr;
  if (b && typeof b === 'object') b = b.ptr;
  return wrapPointer(_emscripten_bind_b2Mat33_Solve22_1(self, b), b2Vec2);
};;

b2Mat33.prototype['GetInverse22'] = b2Mat33.prototype.GetInverse22 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(M) {
  var self = this.ptr;
  if (M && typeof M === 'object') M = M.ptr;
  _emscripten_bind_b2Mat33_GetInverse22_1(self, M);
};;

b2Mat33.prototype['GetSymInverse33'] = b2Mat33.prototype.GetSymInverse33 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(M) {
  var self = this.ptr;
  if (M && typeof M === 'object') M = M.ptr;
  _emscripten_bind_b2Mat33_GetSymInverse33_1(self, M);
};;

  b2Mat33.prototype['get_ex'] = b2Mat33.prototype.get_ex = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat33_get_ex_0(self), b2Vec3);
};
    b2Mat33.prototype['set_ex'] = b2Mat33.prototype.set_ex = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Mat33_set_ex_1(self, arg0);
};
    Object.defineProperty(b2Mat33.prototype, 'ex', { get: b2Mat33.prototype.get_ex, set: b2Mat33.prototype.set_ex });
  b2Mat33.prototype['get_ey'] = b2Mat33.prototype.get_ey = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat33_get_ey_0(self), b2Vec3);
};
    b2Mat33.prototype['set_ey'] = b2Mat33.prototype.set_ey = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Mat33_set_ey_1(self, arg0);
};
    Object.defineProperty(b2Mat33.prototype, 'ey', { get: b2Mat33.prototype.get_ey, set: b2Mat33.prototype.set_ey });
  b2Mat33.prototype['get_ez'] = b2Mat33.prototype.get_ez = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Mat33_get_ez_0(self), b2Vec3);
};
    b2Mat33.prototype['set_ez'] = b2Mat33.prototype.set_ez = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Mat33_set_ez_1(self, arg0);
};
    Object.defineProperty(b2Mat33.prototype, 'ez', { get: b2Mat33.prototype.get_ez, set: b2Mat33.prototype.set_ez });
  b2Mat33.prototype['__destroy__'] = b2Mat33.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Mat33___destroy___0(self);
};
// b2MouseJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2MouseJoint() { throw "cannot construct a b2MouseJoint, no constructor in IDL" }
b2MouseJoint.prototype = Object.create(b2Joint.prototype);
b2MouseJoint.prototype.constructor = b2MouseJoint;
b2MouseJoint.prototype.__class__ = b2MouseJoint;
b2MouseJoint.__cache__ = {};
Module['b2MouseJoint'] = b2MouseJoint;

b2MouseJoint.prototype['SetTarget'] = b2MouseJoint.prototype.SetTarget = /** @suppress {undefinedVars, duplicate} @this{Object} */function(target) {
  var self = this.ptr;
  if (target && typeof target === 'object') target = target.ptr;
  _emscripten_bind_b2MouseJoint_SetTarget_1(self, target);
};;

b2MouseJoint.prototype['GetTarget'] = b2MouseJoint.prototype.GetTarget = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetTarget_0(self), b2Vec2);
};;

b2MouseJoint.prototype['SetMaxForce'] = b2MouseJoint.prototype.SetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  _emscripten_bind_b2MouseJoint_SetMaxForce_1(self, force);
};;

b2MouseJoint.prototype['GetMaxForce'] = b2MouseJoint.prototype.GetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJoint_GetMaxForce_0(self);
};;

b2MouseJoint.prototype['SetStiffness'] = b2MouseJoint.prototype.SetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(stiffness) {
  var self = this.ptr;
  if (stiffness && typeof stiffness === 'object') stiffness = stiffness.ptr;
  _emscripten_bind_b2MouseJoint_SetStiffness_1(self, stiffness);
};;

b2MouseJoint.prototype['GetStiffness'] = b2MouseJoint.prototype.GetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJoint_GetStiffness_0(self);
};;

b2MouseJoint.prototype['SetDamping'] = b2MouseJoint.prototype.SetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(damping) {
  var self = this.ptr;
  if (damping && typeof damping === 'object') damping = damping.ptr;
  _emscripten_bind_b2MouseJoint_SetDamping_1(self, damping);
};;

b2MouseJoint.prototype['GetDamping'] = b2MouseJoint.prototype.GetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJoint_GetDamping_0(self);
};;

b2MouseJoint.prototype['GetType'] = b2MouseJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJoint_GetType_0(self);
};;

b2MouseJoint.prototype['GetBodyA'] = b2MouseJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetBodyA_0(self), b2Body);
};;

b2MouseJoint.prototype['GetBodyB'] = b2MouseJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetBodyB_0(self), b2Body);
};;

b2MouseJoint.prototype['GetAnchorA'] = b2MouseJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetAnchorA_0(self), b2Vec2);
};;

b2MouseJoint.prototype['GetAnchorB'] = b2MouseJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetAnchorB_0(self), b2Vec2);
};;

b2MouseJoint.prototype['GetReactionForce'] = b2MouseJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2MouseJoint.prototype['GetReactionTorque'] = b2MouseJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2MouseJoint_GetReactionTorque_1(self, inv_dt);
};;

b2MouseJoint.prototype['GetNext'] = b2MouseJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetNext_0(self), b2Joint);
};;

b2MouseJoint.prototype['GetUserData'] = b2MouseJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJoint_GetUserData_0(self), b2JointUserData);
};;

b2MouseJoint.prototype['GetCollideConnected'] = b2MouseJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2MouseJoint_GetCollideConnected_0(self));
};;

  b2MouseJoint.prototype['__destroy__'] = b2MouseJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2MouseJoint___destroy___0(self);
};
// b2MouseJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2MouseJointDef() {
  this.ptr = _emscripten_bind_b2MouseJointDef_b2MouseJointDef_0();
  getCache(b2MouseJointDef)[this.ptr] = this;
};;
b2MouseJointDef.prototype = Object.create(b2JointDef.prototype);
b2MouseJointDef.prototype.constructor = b2MouseJointDef;
b2MouseJointDef.prototype.__class__ = b2MouseJointDef;
b2MouseJointDef.__cache__ = {};
Module['b2MouseJointDef'] = b2MouseJointDef;

  b2MouseJointDef.prototype['get_target'] = b2MouseJointDef.prototype.get_target = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJointDef_get_target_0(self), b2Vec2);
};
    b2MouseJointDef.prototype['set_target'] = b2MouseJointDef.prototype.set_target = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_target_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'target', { get: b2MouseJointDef.prototype.get_target, set: b2MouseJointDef.prototype.set_target });
  b2MouseJointDef.prototype['get_maxForce'] = b2MouseJointDef.prototype.get_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJointDef_get_maxForce_0(self);
};
    b2MouseJointDef.prototype['set_maxForce'] = b2MouseJointDef.prototype.set_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_maxForce_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'maxForce', { get: b2MouseJointDef.prototype.get_maxForce, set: b2MouseJointDef.prototype.set_maxForce });
  b2MouseJointDef.prototype['get_stiffness'] = b2MouseJointDef.prototype.get_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJointDef_get_stiffness_0(self);
};
    b2MouseJointDef.prototype['set_stiffness'] = b2MouseJointDef.prototype.set_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_stiffness_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'stiffness', { get: b2MouseJointDef.prototype.get_stiffness, set: b2MouseJointDef.prototype.set_stiffness });
  b2MouseJointDef.prototype['get_damping'] = b2MouseJointDef.prototype.get_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJointDef_get_damping_0(self);
};
    b2MouseJointDef.prototype['set_damping'] = b2MouseJointDef.prototype.set_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_damping_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'damping', { get: b2MouseJointDef.prototype.get_damping, set: b2MouseJointDef.prototype.set_damping });
  b2MouseJointDef.prototype['get_type'] = b2MouseJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MouseJointDef_get_type_0(self);
};
    b2MouseJointDef.prototype['set_type'] = b2MouseJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'type', { get: b2MouseJointDef.prototype.get_type, set: b2MouseJointDef.prototype.set_type });
  b2MouseJointDef.prototype['get_userData'] = b2MouseJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJointDef_get_userData_0(self), b2JointUserData);
};
    b2MouseJointDef.prototype['set_userData'] = b2MouseJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'userData', { get: b2MouseJointDef.prototype.get_userData, set: b2MouseJointDef.prototype.set_userData });
  b2MouseJointDef.prototype['get_bodyA'] = b2MouseJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJointDef_get_bodyA_0(self), b2Body);
};
    b2MouseJointDef.prototype['set_bodyA'] = b2MouseJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'bodyA', { get: b2MouseJointDef.prototype.get_bodyA, set: b2MouseJointDef.prototype.set_bodyA });
  b2MouseJointDef.prototype['get_bodyB'] = b2MouseJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MouseJointDef_get_bodyB_0(self), b2Body);
};
    b2MouseJointDef.prototype['set_bodyB'] = b2MouseJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'bodyB', { get: b2MouseJointDef.prototype.get_bodyB, set: b2MouseJointDef.prototype.set_bodyB });
  b2MouseJointDef.prototype['get_collideConnected'] = b2MouseJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2MouseJointDef_get_collideConnected_0(self));
};
    b2MouseJointDef.prototype['set_collideConnected'] = b2MouseJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MouseJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2MouseJointDef.prototype, 'collideConnected', { get: b2MouseJointDef.prototype.get_collideConnected, set: b2MouseJointDef.prototype.set_collideConnected });
  b2MouseJointDef.prototype['__destroy__'] = b2MouseJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2MouseJointDef___destroy___0(self);
};
// b2PolygonShape
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2PolygonShape() {
  this.ptr = _emscripten_bind_b2PolygonShape_b2PolygonShape_0();
  getCache(b2PolygonShape)[this.ptr] = this;
};;
b2PolygonShape.prototype = Object.create(b2Shape.prototype);
b2PolygonShape.prototype.constructor = b2PolygonShape;
b2PolygonShape.prototype.__class__ = b2PolygonShape;
b2PolygonShape.__cache__ = {};
Module['b2PolygonShape'] = b2PolygonShape;

b2PolygonShape.prototype['Set'] = b2PolygonShape.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(vertices, vertexCount) {
  var self = this.ptr;
  if (vertices && typeof vertices === 'object') vertices = vertices.ptr;
  if (vertexCount && typeof vertexCount === 'object') vertexCount = vertexCount.ptr;
  _emscripten_bind_b2PolygonShape_Set_2(self, vertices, vertexCount);
};;

b2PolygonShape.prototype['SetAsBox'] = b2PolygonShape.prototype.SetAsBox = /** @suppress {undefinedVars, duplicate} @this{Object} */function(hx, hy, center, angle) {
  var self = this.ptr;
  if (hx && typeof hx === 'object') hx = hx.ptr;
  if (hy && typeof hy === 'object') hy = hy.ptr;
  if (center && typeof center === 'object') center = center.ptr;
  if (angle && typeof angle === 'object') angle = angle.ptr;
  if (center === undefined) { _emscripten_bind_b2PolygonShape_SetAsBox_2(self, hx, hy);  return }
  if (angle === undefined) { _emscripten_bind_b2PolygonShape_SetAsBox_3(self, hx, hy, center);  return }
  _emscripten_bind_b2PolygonShape_SetAsBox_4(self, hx, hy, center, angle);
};;

b2PolygonShape.prototype['GetType'] = b2PolygonShape.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PolygonShape_GetType_0(self);
};;

b2PolygonShape.prototype['GetChildCount'] = b2PolygonShape.prototype.GetChildCount = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PolygonShape_GetChildCount_0(self);
};;

b2PolygonShape.prototype['TestPoint'] = b2PolygonShape.prototype.TestPoint = /** @suppress {undefinedVars, duplicate} @this{Object} */function(xf, p) {
  var self = this.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (p && typeof p === 'object') p = p.ptr;
  return !!(_emscripten_bind_b2PolygonShape_TestPoint_2(self, xf, p));
};;

b2PolygonShape.prototype['RayCast'] = b2PolygonShape.prototype.RayCast = /** @suppress {undefinedVars, duplicate} @this{Object} */function(output, input, transform, childIndex) {
  var self = this.ptr;
  if (output && typeof output === 'object') output = output.ptr;
  if (input && typeof input === 'object') input = input.ptr;
  if (transform && typeof transform === 'object') transform = transform.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  return !!(_emscripten_bind_b2PolygonShape_RayCast_4(self, output, input, transform, childIndex));
};;

b2PolygonShape.prototype['ComputeAABB'] = b2PolygonShape.prototype.ComputeAABB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(aabb, xf, childIndex) {
  var self = this.ptr;
  if (aabb && typeof aabb === 'object') aabb = aabb.ptr;
  if (xf && typeof xf === 'object') xf = xf.ptr;
  if (childIndex && typeof childIndex === 'object') childIndex = childIndex.ptr;
  _emscripten_bind_b2PolygonShape_ComputeAABB_3(self, aabb, xf, childIndex);
};;

b2PolygonShape.prototype['ComputeMass'] = b2PolygonShape.prototype.ComputeMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(massData, density) {
  var self = this.ptr;
  if (massData && typeof massData === 'object') massData = massData.ptr;
  if (density && typeof density === 'object') density = density.ptr;
  _emscripten_bind_b2PolygonShape_ComputeMass_2(self, massData, density);
};;

  b2PolygonShape.prototype['get_m_centroid'] = b2PolygonShape.prototype.get_m_centroid = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PolygonShape_get_m_centroid_0(self), b2Vec2);
};
    b2PolygonShape.prototype['set_m_centroid'] = b2PolygonShape.prototype.set_m_centroid = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PolygonShape_set_m_centroid_1(self, arg0);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_centroid', { get: b2PolygonShape.prototype.get_m_centroid, set: b2PolygonShape.prototype.set_m_centroid });
  b2PolygonShape.prototype['get_m_vertices'] = b2PolygonShape.prototype.get_m_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return wrapPointer(_emscripten_bind_b2PolygonShape_get_m_vertices_1(self, arg0), b2Vec2);
};
    b2PolygonShape.prototype['set_m_vertices'] = b2PolygonShape.prototype.set_m_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2PolygonShape_set_m_vertices_2(self, arg0, arg1);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_vertices', { get: b2PolygonShape.prototype.get_m_vertices, set: b2PolygonShape.prototype.set_m_vertices });
  b2PolygonShape.prototype['get_m_normals'] = b2PolygonShape.prototype.get_m_normals = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  return wrapPointer(_emscripten_bind_b2PolygonShape_get_m_normals_1(self, arg0), b2Vec2);
};
    b2PolygonShape.prototype['set_m_normals'] = b2PolygonShape.prototype.set_m_normals = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0, arg1) {
  var self = this.ptr;
  ensureCache.prepare();
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  if (arg1 && typeof arg1 === 'object') arg1 = arg1.ptr;
  _emscripten_bind_b2PolygonShape_set_m_normals_2(self, arg0, arg1);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_normals', { get: b2PolygonShape.prototype.get_m_normals, set: b2PolygonShape.prototype.set_m_normals });
  b2PolygonShape.prototype['get_m_count'] = b2PolygonShape.prototype.get_m_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PolygonShape_get_m_count_0(self);
};
    b2PolygonShape.prototype['set_m_count'] = b2PolygonShape.prototype.set_m_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PolygonShape_set_m_count_1(self, arg0);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_count', { get: b2PolygonShape.prototype.get_m_count, set: b2PolygonShape.prototype.set_m_count });
  b2PolygonShape.prototype['get_m_type'] = b2PolygonShape.prototype.get_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PolygonShape_get_m_type_0(self);
};
    b2PolygonShape.prototype['set_m_type'] = b2PolygonShape.prototype.set_m_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PolygonShape_set_m_type_1(self, arg0);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_type', { get: b2PolygonShape.prototype.get_m_type, set: b2PolygonShape.prototype.set_m_type });
  b2PolygonShape.prototype['get_m_radius'] = b2PolygonShape.prototype.get_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PolygonShape_get_m_radius_0(self);
};
    b2PolygonShape.prototype['set_m_radius'] = b2PolygonShape.prototype.set_m_radius = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PolygonShape_set_m_radius_1(self, arg0);
};
    Object.defineProperty(b2PolygonShape.prototype, 'm_radius', { get: b2PolygonShape.prototype.get_m_radius, set: b2PolygonShape.prototype.set_m_radius });
  b2PolygonShape.prototype['__destroy__'] = b2PolygonShape.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2PolygonShape___destroy___0(self);
};
// b2PrismaticJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2PrismaticJoint() { throw "cannot construct a b2PrismaticJoint, no constructor in IDL" }
b2PrismaticJoint.prototype = Object.create(b2Joint.prototype);
b2PrismaticJoint.prototype.constructor = b2PrismaticJoint;
b2PrismaticJoint.prototype.__class__ = b2PrismaticJoint;
b2PrismaticJoint.__cache__ = {};
Module['b2PrismaticJoint'] = b2PrismaticJoint;

b2PrismaticJoint.prototype['GetLocalAnchorA'] = b2PrismaticJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2PrismaticJoint.prototype['GetLocalAnchorB'] = b2PrismaticJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2PrismaticJoint.prototype['GetLocalAxisA'] = b2PrismaticJoint.prototype.GetLocalAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetLocalAxisA_0(self), b2Vec2);
};;

b2PrismaticJoint.prototype['GetReferenceAngle'] = b2PrismaticJoint.prototype.GetReferenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetReferenceAngle_0(self);
};;

b2PrismaticJoint.prototype['GetJointTranslation'] = b2PrismaticJoint.prototype.GetJointTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetJointTranslation_0(self);
};;

b2PrismaticJoint.prototype['GetJointSpeed'] = b2PrismaticJoint.prototype.GetJointSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetJointSpeed_0(self);
};;

b2PrismaticJoint.prototype['IsLimitEnabled'] = b2PrismaticJoint.prototype.IsLimitEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJoint_IsLimitEnabled_0(self));
};;

b2PrismaticJoint.prototype['EnableLimit'] = b2PrismaticJoint.prototype.EnableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2PrismaticJoint_EnableLimit_1(self, flag);
};;

b2PrismaticJoint.prototype['GetLowerLimit'] = b2PrismaticJoint.prototype.GetLowerLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetLowerLimit_0(self);
};;

b2PrismaticJoint.prototype['GetUpperLimit'] = b2PrismaticJoint.prototype.GetUpperLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetUpperLimit_0(self);
};;

b2PrismaticJoint.prototype['SetLimits'] = b2PrismaticJoint.prototype.SetLimits = /** @suppress {undefinedVars, duplicate} @this{Object} */function(lower, upper) {
  var self = this.ptr;
  if (lower && typeof lower === 'object') lower = lower.ptr;
  if (upper && typeof upper === 'object') upper = upper.ptr;
  _emscripten_bind_b2PrismaticJoint_SetLimits_2(self, lower, upper);
};;

b2PrismaticJoint.prototype['IsMotorEnabled'] = b2PrismaticJoint.prototype.IsMotorEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJoint_IsMotorEnabled_0(self));
};;

b2PrismaticJoint.prototype['EnableMotor'] = b2PrismaticJoint.prototype.EnableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2PrismaticJoint_EnableMotor_1(self, flag);
};;

b2PrismaticJoint.prototype['SetMotorSpeed'] = b2PrismaticJoint.prototype.SetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(speed) {
  var self = this.ptr;
  if (speed && typeof speed === 'object') speed = speed.ptr;
  _emscripten_bind_b2PrismaticJoint_SetMotorSpeed_1(self, speed);
};;

b2PrismaticJoint.prototype['GetMotorSpeed'] = b2PrismaticJoint.prototype.GetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetMotorSpeed_0(self);
};;

b2PrismaticJoint.prototype['SetMaxMotorForce'] = b2PrismaticJoint.prototype.SetMaxMotorForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  _emscripten_bind_b2PrismaticJoint_SetMaxMotorForce_1(self, force);
};;

b2PrismaticJoint.prototype['GetMaxMotorForce'] = b2PrismaticJoint.prototype.GetMaxMotorForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetMaxMotorForce_0(self);
};;

b2PrismaticJoint.prototype['GetMotorForce'] = b2PrismaticJoint.prototype.GetMotorForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetMotorForce_1(self, inv_dt);
};;

b2PrismaticJoint.prototype['GetType'] = b2PrismaticJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetType_0(self);
};;

b2PrismaticJoint.prototype['GetBodyA'] = b2PrismaticJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetBodyA_0(self), b2Body);
};;

b2PrismaticJoint.prototype['GetBodyB'] = b2PrismaticJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetBodyB_0(self), b2Body);
};;

b2PrismaticJoint.prototype['GetAnchorA'] = b2PrismaticJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetAnchorA_0(self), b2Vec2);
};;

b2PrismaticJoint.prototype['GetAnchorB'] = b2PrismaticJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetAnchorB_0(self), b2Vec2);
};;

b2PrismaticJoint.prototype['GetReactionForce'] = b2PrismaticJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2PrismaticJoint.prototype['GetReactionTorque'] = b2PrismaticJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2PrismaticJoint_GetReactionTorque_1(self, inv_dt);
};;

b2PrismaticJoint.prototype['GetNext'] = b2PrismaticJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetNext_0(self), b2Joint);
};;

b2PrismaticJoint.prototype['GetUserData'] = b2PrismaticJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJoint_GetUserData_0(self), b2JointUserData);
};;

b2PrismaticJoint.prototype['GetCollideConnected'] = b2PrismaticJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJoint_GetCollideConnected_0(self));
};;

  b2PrismaticJoint.prototype['__destroy__'] = b2PrismaticJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2PrismaticJoint___destroy___0(self);
};
// b2PrismaticJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2PrismaticJointDef() {
  this.ptr = _emscripten_bind_b2PrismaticJointDef_b2PrismaticJointDef_0();
  getCache(b2PrismaticJointDef)[this.ptr] = this;
};;
b2PrismaticJointDef.prototype = Object.create(b2JointDef.prototype);
b2PrismaticJointDef.prototype.constructor = b2PrismaticJointDef;
b2PrismaticJointDef.prototype.__class__ = b2PrismaticJointDef;
b2PrismaticJointDef.__cache__ = {};
Module['b2PrismaticJointDef'] = b2PrismaticJointDef;

b2PrismaticJointDef.prototype['Initialize'] = b2PrismaticJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchor, axis) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchor && typeof anchor === 'object') anchor = anchor.ptr;
  if (axis && typeof axis === 'object') axis = axis.ptr;
  _emscripten_bind_b2PrismaticJointDef_Initialize_4(self, bodyA, bodyB, anchor, axis);
};;

  b2PrismaticJointDef.prototype['get_localAnchorA'] = b2PrismaticJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2PrismaticJointDef.prototype['set_localAnchorA'] = b2PrismaticJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'localAnchorA', { get: b2PrismaticJointDef.prototype.get_localAnchorA, set: b2PrismaticJointDef.prototype.set_localAnchorA });
  b2PrismaticJointDef.prototype['get_localAnchorB'] = b2PrismaticJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2PrismaticJointDef.prototype['set_localAnchorB'] = b2PrismaticJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'localAnchorB', { get: b2PrismaticJointDef.prototype.get_localAnchorB, set: b2PrismaticJointDef.prototype.set_localAnchorB });
  b2PrismaticJointDef.prototype['get_localAxisA'] = b2PrismaticJointDef.prototype.get_localAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_localAxisA_0(self), b2Vec2);
};
    b2PrismaticJointDef.prototype['set_localAxisA'] = b2PrismaticJointDef.prototype.set_localAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_localAxisA_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'localAxisA', { get: b2PrismaticJointDef.prototype.get_localAxisA, set: b2PrismaticJointDef.prototype.set_localAxisA });
  b2PrismaticJointDef.prototype['get_referenceAngle'] = b2PrismaticJointDef.prototype.get_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_referenceAngle_0(self);
};
    b2PrismaticJointDef.prototype['set_referenceAngle'] = b2PrismaticJointDef.prototype.set_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_referenceAngle_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'referenceAngle', { get: b2PrismaticJointDef.prototype.get_referenceAngle, set: b2PrismaticJointDef.prototype.set_referenceAngle });
  b2PrismaticJointDef.prototype['get_enableLimit'] = b2PrismaticJointDef.prototype.get_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJointDef_get_enableLimit_0(self));
};
    b2PrismaticJointDef.prototype['set_enableLimit'] = b2PrismaticJointDef.prototype.set_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_enableLimit_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'enableLimit', { get: b2PrismaticJointDef.prototype.get_enableLimit, set: b2PrismaticJointDef.prototype.set_enableLimit });
  b2PrismaticJointDef.prototype['get_lowerTranslation'] = b2PrismaticJointDef.prototype.get_lowerTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_lowerTranslation_0(self);
};
    b2PrismaticJointDef.prototype['set_lowerTranslation'] = b2PrismaticJointDef.prototype.set_lowerTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_lowerTranslation_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'lowerTranslation', { get: b2PrismaticJointDef.prototype.get_lowerTranslation, set: b2PrismaticJointDef.prototype.set_lowerTranslation });
  b2PrismaticJointDef.prototype['get_upperTranslation'] = b2PrismaticJointDef.prototype.get_upperTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_upperTranslation_0(self);
};
    b2PrismaticJointDef.prototype['set_upperTranslation'] = b2PrismaticJointDef.prototype.set_upperTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_upperTranslation_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'upperTranslation', { get: b2PrismaticJointDef.prototype.get_upperTranslation, set: b2PrismaticJointDef.prototype.set_upperTranslation });
  b2PrismaticJointDef.prototype['get_enableMotor'] = b2PrismaticJointDef.prototype.get_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJointDef_get_enableMotor_0(self));
};
    b2PrismaticJointDef.prototype['set_enableMotor'] = b2PrismaticJointDef.prototype.set_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_enableMotor_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'enableMotor', { get: b2PrismaticJointDef.prototype.get_enableMotor, set: b2PrismaticJointDef.prototype.set_enableMotor });
  b2PrismaticJointDef.prototype['get_maxMotorForce'] = b2PrismaticJointDef.prototype.get_maxMotorForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_maxMotorForce_0(self);
};
    b2PrismaticJointDef.prototype['set_maxMotorForce'] = b2PrismaticJointDef.prototype.set_maxMotorForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_maxMotorForce_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'maxMotorForce', { get: b2PrismaticJointDef.prototype.get_maxMotorForce, set: b2PrismaticJointDef.prototype.set_maxMotorForce });
  b2PrismaticJointDef.prototype['get_motorSpeed'] = b2PrismaticJointDef.prototype.get_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_motorSpeed_0(self);
};
    b2PrismaticJointDef.prototype['set_motorSpeed'] = b2PrismaticJointDef.prototype.set_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_motorSpeed_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'motorSpeed', { get: b2PrismaticJointDef.prototype.get_motorSpeed, set: b2PrismaticJointDef.prototype.set_motorSpeed });
  b2PrismaticJointDef.prototype['get_type'] = b2PrismaticJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PrismaticJointDef_get_type_0(self);
};
    b2PrismaticJointDef.prototype['set_type'] = b2PrismaticJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'type', { get: b2PrismaticJointDef.prototype.get_type, set: b2PrismaticJointDef.prototype.set_type });
  b2PrismaticJointDef.prototype['get_userData'] = b2PrismaticJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_userData_0(self), b2JointUserData);
};
    b2PrismaticJointDef.prototype['set_userData'] = b2PrismaticJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'userData', { get: b2PrismaticJointDef.prototype.get_userData, set: b2PrismaticJointDef.prototype.set_userData });
  b2PrismaticJointDef.prototype['get_bodyA'] = b2PrismaticJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_bodyA_0(self), b2Body);
};
    b2PrismaticJointDef.prototype['set_bodyA'] = b2PrismaticJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'bodyA', { get: b2PrismaticJointDef.prototype.get_bodyA, set: b2PrismaticJointDef.prototype.set_bodyA });
  b2PrismaticJointDef.prototype['get_bodyB'] = b2PrismaticJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PrismaticJointDef_get_bodyB_0(self), b2Body);
};
    b2PrismaticJointDef.prototype['set_bodyB'] = b2PrismaticJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'bodyB', { get: b2PrismaticJointDef.prototype.get_bodyB, set: b2PrismaticJointDef.prototype.set_bodyB });
  b2PrismaticJointDef.prototype['get_collideConnected'] = b2PrismaticJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PrismaticJointDef_get_collideConnected_0(self));
};
    b2PrismaticJointDef.prototype['set_collideConnected'] = b2PrismaticJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PrismaticJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2PrismaticJointDef.prototype, 'collideConnected', { get: b2PrismaticJointDef.prototype.get_collideConnected, set: b2PrismaticJointDef.prototype.set_collideConnected });
  b2PrismaticJointDef.prototype['__destroy__'] = b2PrismaticJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2PrismaticJointDef___destroy___0(self);
};
// b2Profile
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Profile() { throw "cannot construct a b2Profile, no constructor in IDL" }
b2Profile.prototype = Object.create(WrapperObject.prototype);
b2Profile.prototype.constructor = b2Profile;
b2Profile.prototype.__class__ = b2Profile;
b2Profile.__cache__ = {};
Module['b2Profile'] = b2Profile;

  b2Profile.prototype['get_step'] = b2Profile.prototype.get_step = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_step_0(self);
};
    b2Profile.prototype['set_step'] = b2Profile.prototype.set_step = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_step_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'step', { get: b2Profile.prototype.get_step, set: b2Profile.prototype.set_step });
  b2Profile.prototype['get_collide'] = b2Profile.prototype.get_collide = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_collide_0(self);
};
    b2Profile.prototype['set_collide'] = b2Profile.prototype.set_collide = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_collide_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'collide', { get: b2Profile.prototype.get_collide, set: b2Profile.prototype.set_collide });
  b2Profile.prototype['get_solve'] = b2Profile.prototype.get_solve = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_solve_0(self);
};
    b2Profile.prototype['set_solve'] = b2Profile.prototype.set_solve = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_solve_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'solve', { get: b2Profile.prototype.get_solve, set: b2Profile.prototype.set_solve });
  b2Profile.prototype['get_solveInit'] = b2Profile.prototype.get_solveInit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_solveInit_0(self);
};
    b2Profile.prototype['set_solveInit'] = b2Profile.prototype.set_solveInit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_solveInit_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'solveInit', { get: b2Profile.prototype.get_solveInit, set: b2Profile.prototype.set_solveInit });
  b2Profile.prototype['get_solveVelocity'] = b2Profile.prototype.get_solveVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_solveVelocity_0(self);
};
    b2Profile.prototype['set_solveVelocity'] = b2Profile.prototype.set_solveVelocity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_solveVelocity_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'solveVelocity', { get: b2Profile.prototype.get_solveVelocity, set: b2Profile.prototype.set_solveVelocity });
  b2Profile.prototype['get_solvePosition'] = b2Profile.prototype.get_solvePosition = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_solvePosition_0(self);
};
    b2Profile.prototype['set_solvePosition'] = b2Profile.prototype.set_solvePosition = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_solvePosition_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'solvePosition', { get: b2Profile.prototype.get_solvePosition, set: b2Profile.prototype.set_solvePosition });
  b2Profile.prototype['get_broadphase'] = b2Profile.prototype.get_broadphase = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_broadphase_0(self);
};
    b2Profile.prototype['set_broadphase'] = b2Profile.prototype.set_broadphase = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_broadphase_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'broadphase', { get: b2Profile.prototype.get_broadphase, set: b2Profile.prototype.set_broadphase });
  b2Profile.prototype['get_solveTOI'] = b2Profile.prototype.get_solveTOI = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Profile_get_solveTOI_0(self);
};
    b2Profile.prototype['set_solveTOI'] = b2Profile.prototype.set_solveTOI = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Profile_set_solveTOI_1(self, arg0);
};
    Object.defineProperty(b2Profile.prototype, 'solveTOI', { get: b2Profile.prototype.get_solveTOI, set: b2Profile.prototype.set_solveTOI });
  b2Profile.prototype['__destroy__'] = b2Profile.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Profile___destroy___0(self);
};
// b2PulleyJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2PulleyJoint() { throw "cannot construct a b2PulleyJoint, no constructor in IDL" }
b2PulleyJoint.prototype = Object.create(b2Joint.prototype);
b2PulleyJoint.prototype.constructor = b2PulleyJoint;
b2PulleyJoint.prototype.__class__ = b2PulleyJoint;
b2PulleyJoint.__cache__ = {};
Module['b2PulleyJoint'] = b2PulleyJoint;

b2PulleyJoint.prototype['GetGroundAnchorA'] = b2PulleyJoint.prototype.GetGroundAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetGroundAnchorA_0(self), b2Vec2);
};;

b2PulleyJoint.prototype['GetGroundAnchorB'] = b2PulleyJoint.prototype.GetGroundAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetGroundAnchorB_0(self), b2Vec2);
};;

b2PulleyJoint.prototype['GetLengthA'] = b2PulleyJoint.prototype.GetLengthA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetLengthA_0(self);
};;

b2PulleyJoint.prototype['GetLengthB'] = b2PulleyJoint.prototype.GetLengthB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetLengthB_0(self);
};;

b2PulleyJoint.prototype['GetRatio'] = b2PulleyJoint.prototype.GetRatio = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetRatio_0(self);
};;

b2PulleyJoint.prototype['GetCurrentLengthA'] = b2PulleyJoint.prototype.GetCurrentLengthA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetCurrentLengthA_0(self);
};;

b2PulleyJoint.prototype['GetCurrentLengthB'] = b2PulleyJoint.prototype.GetCurrentLengthB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetCurrentLengthB_0(self);
};;

b2PulleyJoint.prototype['GetType'] = b2PulleyJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJoint_GetType_0(self);
};;

b2PulleyJoint.prototype['GetBodyA'] = b2PulleyJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetBodyA_0(self), b2Body);
};;

b2PulleyJoint.prototype['GetBodyB'] = b2PulleyJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetBodyB_0(self), b2Body);
};;

b2PulleyJoint.prototype['GetAnchorA'] = b2PulleyJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetAnchorA_0(self), b2Vec2);
};;

b2PulleyJoint.prototype['GetAnchorB'] = b2PulleyJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetAnchorB_0(self), b2Vec2);
};;

b2PulleyJoint.prototype['GetReactionForce'] = b2PulleyJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2PulleyJoint.prototype['GetReactionTorque'] = b2PulleyJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2PulleyJoint_GetReactionTorque_1(self, inv_dt);
};;

b2PulleyJoint.prototype['GetNext'] = b2PulleyJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetNext_0(self), b2Joint);
};;

b2PulleyJoint.prototype['GetUserData'] = b2PulleyJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJoint_GetUserData_0(self), b2JointUserData);
};;

b2PulleyJoint.prototype['GetCollideConnected'] = b2PulleyJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PulleyJoint_GetCollideConnected_0(self));
};;

  b2PulleyJoint.prototype['__destroy__'] = b2PulleyJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2PulleyJoint___destroy___0(self);
};
// b2PulleyJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2PulleyJointDef() {
  this.ptr = _emscripten_bind_b2PulleyJointDef_b2PulleyJointDef_0();
  getCache(b2PulleyJointDef)[this.ptr] = this;
};;
b2PulleyJointDef.prototype = Object.create(b2JointDef.prototype);
b2PulleyJointDef.prototype.constructor = b2PulleyJointDef;
b2PulleyJointDef.prototype.__class__ = b2PulleyJointDef;
b2PulleyJointDef.__cache__ = {};
Module['b2PulleyJointDef'] = b2PulleyJointDef;

b2PulleyJointDef.prototype['Initialize'] = b2PulleyJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, groundAnchorA, groundAnchorB, anchorA, anchorB, ratio) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (groundAnchorA && typeof groundAnchorA === 'object') groundAnchorA = groundAnchorA.ptr;
  if (groundAnchorB && typeof groundAnchorB === 'object') groundAnchorB = groundAnchorB.ptr;
  if (anchorA && typeof anchorA === 'object') anchorA = anchorA.ptr;
  if (anchorB && typeof anchorB === 'object') anchorB = anchorB.ptr;
  if (ratio && typeof ratio === 'object') ratio = ratio.ptr;
  _emscripten_bind_b2PulleyJointDef_Initialize_7(self, bodyA, bodyB, groundAnchorA, groundAnchorB, anchorA, anchorB, ratio);
};;

  b2PulleyJointDef.prototype['get_groundAnchorA'] = b2PulleyJointDef.prototype.get_groundAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_groundAnchorA_0(self), b2Vec2);
};
    b2PulleyJointDef.prototype['set_groundAnchorA'] = b2PulleyJointDef.prototype.set_groundAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_groundAnchorA_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'groundAnchorA', { get: b2PulleyJointDef.prototype.get_groundAnchorA, set: b2PulleyJointDef.prototype.set_groundAnchorA });
  b2PulleyJointDef.prototype['get_groundAnchorB'] = b2PulleyJointDef.prototype.get_groundAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_groundAnchorB_0(self), b2Vec2);
};
    b2PulleyJointDef.prototype['set_groundAnchorB'] = b2PulleyJointDef.prototype.set_groundAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_groundAnchorB_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'groundAnchorB', { get: b2PulleyJointDef.prototype.get_groundAnchorB, set: b2PulleyJointDef.prototype.set_groundAnchorB });
  b2PulleyJointDef.prototype['get_localAnchorA'] = b2PulleyJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2PulleyJointDef.prototype['set_localAnchorA'] = b2PulleyJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'localAnchorA', { get: b2PulleyJointDef.prototype.get_localAnchorA, set: b2PulleyJointDef.prototype.set_localAnchorA });
  b2PulleyJointDef.prototype['get_localAnchorB'] = b2PulleyJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2PulleyJointDef.prototype['set_localAnchorB'] = b2PulleyJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'localAnchorB', { get: b2PulleyJointDef.prototype.get_localAnchorB, set: b2PulleyJointDef.prototype.set_localAnchorB });
  b2PulleyJointDef.prototype['get_lengthA'] = b2PulleyJointDef.prototype.get_lengthA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJointDef_get_lengthA_0(self);
};
    b2PulleyJointDef.prototype['set_lengthA'] = b2PulleyJointDef.prototype.set_lengthA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_lengthA_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'lengthA', { get: b2PulleyJointDef.prototype.get_lengthA, set: b2PulleyJointDef.prototype.set_lengthA });
  b2PulleyJointDef.prototype['get_lengthB'] = b2PulleyJointDef.prototype.get_lengthB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJointDef_get_lengthB_0(self);
};
    b2PulleyJointDef.prototype['set_lengthB'] = b2PulleyJointDef.prototype.set_lengthB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_lengthB_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'lengthB', { get: b2PulleyJointDef.prototype.get_lengthB, set: b2PulleyJointDef.prototype.set_lengthB });
  b2PulleyJointDef.prototype['get_ratio'] = b2PulleyJointDef.prototype.get_ratio = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJointDef_get_ratio_0(self);
};
    b2PulleyJointDef.prototype['set_ratio'] = b2PulleyJointDef.prototype.set_ratio = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_ratio_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'ratio', { get: b2PulleyJointDef.prototype.get_ratio, set: b2PulleyJointDef.prototype.set_ratio });
  b2PulleyJointDef.prototype['get_type'] = b2PulleyJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2PulleyJointDef_get_type_0(self);
};
    b2PulleyJointDef.prototype['set_type'] = b2PulleyJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'type', { get: b2PulleyJointDef.prototype.get_type, set: b2PulleyJointDef.prototype.set_type });
  b2PulleyJointDef.prototype['get_userData'] = b2PulleyJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_userData_0(self), b2JointUserData);
};
    b2PulleyJointDef.prototype['set_userData'] = b2PulleyJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'userData', { get: b2PulleyJointDef.prototype.get_userData, set: b2PulleyJointDef.prototype.set_userData });
  b2PulleyJointDef.prototype['get_bodyA'] = b2PulleyJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_bodyA_0(self), b2Body);
};
    b2PulleyJointDef.prototype['set_bodyA'] = b2PulleyJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'bodyA', { get: b2PulleyJointDef.prototype.get_bodyA, set: b2PulleyJointDef.prototype.set_bodyA });
  b2PulleyJointDef.prototype['get_bodyB'] = b2PulleyJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2PulleyJointDef_get_bodyB_0(self), b2Body);
};
    b2PulleyJointDef.prototype['set_bodyB'] = b2PulleyJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'bodyB', { get: b2PulleyJointDef.prototype.get_bodyB, set: b2PulleyJointDef.prototype.set_bodyB });
  b2PulleyJointDef.prototype['get_collideConnected'] = b2PulleyJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2PulleyJointDef_get_collideConnected_0(self));
};
    b2PulleyJointDef.prototype['set_collideConnected'] = b2PulleyJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2PulleyJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2PulleyJointDef.prototype, 'collideConnected', { get: b2PulleyJointDef.prototype.get_collideConnected, set: b2PulleyJointDef.prototype.set_collideConnected });
  b2PulleyJointDef.prototype['__destroy__'] = b2PulleyJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2PulleyJointDef___destroy___0(self);
};
// b2RayCastInput
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RayCastInput() { throw "cannot construct a b2RayCastInput, no constructor in IDL" }
b2RayCastInput.prototype = Object.create(WrapperObject.prototype);
b2RayCastInput.prototype.constructor = b2RayCastInput;
b2RayCastInput.prototype.__class__ = b2RayCastInput;
b2RayCastInput.__cache__ = {};
Module['b2RayCastInput'] = b2RayCastInput;

  b2RayCastInput.prototype['get_p1'] = b2RayCastInput.prototype.get_p1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RayCastInput_get_p1_0(self), b2Vec2);
};
    b2RayCastInput.prototype['set_p1'] = b2RayCastInput.prototype.set_p1 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RayCastInput_set_p1_1(self, arg0);
};
    Object.defineProperty(b2RayCastInput.prototype, 'p1', { get: b2RayCastInput.prototype.get_p1, set: b2RayCastInput.prototype.set_p1 });
  b2RayCastInput.prototype['get_p2'] = b2RayCastInput.prototype.get_p2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RayCastInput_get_p2_0(self), b2Vec2);
};
    b2RayCastInput.prototype['set_p2'] = b2RayCastInput.prototype.set_p2 = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RayCastInput_set_p2_1(self, arg0);
};
    Object.defineProperty(b2RayCastInput.prototype, 'p2', { get: b2RayCastInput.prototype.get_p2, set: b2RayCastInput.prototype.set_p2 });
  b2RayCastInput.prototype['get_maxFraction'] = b2RayCastInput.prototype.get_maxFraction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RayCastInput_get_maxFraction_0(self);
};
    b2RayCastInput.prototype['set_maxFraction'] = b2RayCastInput.prototype.set_maxFraction = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RayCastInput_set_maxFraction_1(self, arg0);
};
    Object.defineProperty(b2RayCastInput.prototype, 'maxFraction', { get: b2RayCastInput.prototype.get_maxFraction, set: b2RayCastInput.prototype.set_maxFraction });
  b2RayCastInput.prototype['__destroy__'] = b2RayCastInput.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RayCastInput___destroy___0(self);
};
// b2RayCastOutput
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RayCastOutput() { throw "cannot construct a b2RayCastOutput, no constructor in IDL" }
b2RayCastOutput.prototype = Object.create(WrapperObject.prototype);
b2RayCastOutput.prototype.constructor = b2RayCastOutput;
b2RayCastOutput.prototype.__class__ = b2RayCastOutput;
b2RayCastOutput.__cache__ = {};
Module['b2RayCastOutput'] = b2RayCastOutput;

  b2RayCastOutput.prototype['get_normal'] = b2RayCastOutput.prototype.get_normal = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RayCastOutput_get_normal_0(self), b2Vec2);
};
    b2RayCastOutput.prototype['set_normal'] = b2RayCastOutput.prototype.set_normal = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RayCastOutput_set_normal_1(self, arg0);
};
    Object.defineProperty(b2RayCastOutput.prototype, 'normal', { get: b2RayCastOutput.prototype.get_normal, set: b2RayCastOutput.prototype.set_normal });
  b2RayCastOutput.prototype['get_fraction'] = b2RayCastOutput.prototype.get_fraction = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RayCastOutput_get_fraction_0(self);
};
    b2RayCastOutput.prototype['set_fraction'] = b2RayCastOutput.prototype.set_fraction = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RayCastOutput_set_fraction_1(self, arg0);
};
    Object.defineProperty(b2RayCastOutput.prototype, 'fraction', { get: b2RayCastOutput.prototype.get_fraction, set: b2RayCastOutput.prototype.set_fraction });
  b2RayCastOutput.prototype['__destroy__'] = b2RayCastOutput.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RayCastOutput___destroy___0(self);
};
// b2RevoluteJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RevoluteJoint() { throw "cannot construct a b2RevoluteJoint, no constructor in IDL" }
b2RevoluteJoint.prototype = Object.create(b2Joint.prototype);
b2RevoluteJoint.prototype.constructor = b2RevoluteJoint;
b2RevoluteJoint.prototype.__class__ = b2RevoluteJoint;
b2RevoluteJoint.__cache__ = {};
Module['b2RevoluteJoint'] = b2RevoluteJoint;

b2RevoluteJoint.prototype['GetLocalAnchorA'] = b2RevoluteJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2RevoluteJoint.prototype['GetLocalAnchorB'] = b2RevoluteJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2RevoluteJoint.prototype['GetReferenceAngle'] = b2RevoluteJoint.prototype.GetReferenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetReferenceAngle_0(self);
};;

b2RevoluteJoint.prototype['GetJointAngle'] = b2RevoluteJoint.prototype.GetJointAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetJointAngle_0(self);
};;

b2RevoluteJoint.prototype['GetJointSpeed'] = b2RevoluteJoint.prototype.GetJointSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetJointSpeed_0(self);
};;

b2RevoluteJoint.prototype['IsLimitEnabled'] = b2RevoluteJoint.prototype.IsLimitEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJoint_IsLimitEnabled_0(self));
};;

b2RevoluteJoint.prototype['EnableLimit'] = b2RevoluteJoint.prototype.EnableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2RevoluteJoint_EnableLimit_1(self, flag);
};;

b2RevoluteJoint.prototype['GetLowerLimit'] = b2RevoluteJoint.prototype.GetLowerLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetLowerLimit_0(self);
};;

b2RevoluteJoint.prototype['GetUpperLimit'] = b2RevoluteJoint.prototype.GetUpperLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetUpperLimit_0(self);
};;

b2RevoluteJoint.prototype['SetLimits'] = b2RevoluteJoint.prototype.SetLimits = /** @suppress {undefinedVars, duplicate} @this{Object} */function(lower, upper) {
  var self = this.ptr;
  if (lower && typeof lower === 'object') lower = lower.ptr;
  if (upper && typeof upper === 'object') upper = upper.ptr;
  _emscripten_bind_b2RevoluteJoint_SetLimits_2(self, lower, upper);
};;

b2RevoluteJoint.prototype['IsMotorEnabled'] = b2RevoluteJoint.prototype.IsMotorEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJoint_IsMotorEnabled_0(self));
};;

b2RevoluteJoint.prototype['EnableMotor'] = b2RevoluteJoint.prototype.EnableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2RevoluteJoint_EnableMotor_1(self, flag);
};;

b2RevoluteJoint.prototype['SetMotorSpeed'] = b2RevoluteJoint.prototype.SetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(speed) {
  var self = this.ptr;
  if (speed && typeof speed === 'object') speed = speed.ptr;
  _emscripten_bind_b2RevoluteJoint_SetMotorSpeed_1(self, speed);
};;

b2RevoluteJoint.prototype['GetMotorSpeed'] = b2RevoluteJoint.prototype.GetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetMotorSpeed_0(self);
};;

b2RevoluteJoint.prototype['SetMaxMotorTorque'] = b2RevoluteJoint.prototype.SetMaxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(torque) {
  var self = this.ptr;
  if (torque && typeof torque === 'object') torque = torque.ptr;
  _emscripten_bind_b2RevoluteJoint_SetMaxMotorTorque_1(self, torque);
};;

b2RevoluteJoint.prototype['GetMaxMotorTorque'] = b2RevoluteJoint.prototype.GetMaxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetMaxMotorTorque_0(self);
};;

b2RevoluteJoint.prototype['GetMotorTorque'] = b2RevoluteJoint.prototype.GetMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetMotorTorque_1(self, inv_dt);
};;

b2RevoluteJoint.prototype['GetType'] = b2RevoluteJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetType_0(self);
};;

b2RevoluteJoint.prototype['GetBodyA'] = b2RevoluteJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetBodyA_0(self), b2Body);
};;

b2RevoluteJoint.prototype['GetBodyB'] = b2RevoluteJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetBodyB_0(self), b2Body);
};;

b2RevoluteJoint.prototype['GetAnchorA'] = b2RevoluteJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetAnchorA_0(self), b2Vec2);
};;

b2RevoluteJoint.prototype['GetAnchorB'] = b2RevoluteJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetAnchorB_0(self), b2Vec2);
};;

b2RevoluteJoint.prototype['GetReactionForce'] = b2RevoluteJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2RevoluteJoint.prototype['GetReactionTorque'] = b2RevoluteJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2RevoluteJoint_GetReactionTorque_1(self, inv_dt);
};;

b2RevoluteJoint.prototype['GetNext'] = b2RevoluteJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetNext_0(self), b2Joint);
};;

b2RevoluteJoint.prototype['GetUserData'] = b2RevoluteJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJoint_GetUserData_0(self), b2JointUserData);
};;

b2RevoluteJoint.prototype['GetCollideConnected'] = b2RevoluteJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJoint_GetCollideConnected_0(self));
};;

  b2RevoluteJoint.prototype['__destroy__'] = b2RevoluteJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RevoluteJoint___destroy___0(self);
};
// b2RevoluteJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RevoluteJointDef() {
  this.ptr = _emscripten_bind_b2RevoluteJointDef_b2RevoluteJointDef_0();
  getCache(b2RevoluteJointDef)[this.ptr] = this;
};;
b2RevoluteJointDef.prototype = Object.create(b2JointDef.prototype);
b2RevoluteJointDef.prototype.constructor = b2RevoluteJointDef;
b2RevoluteJointDef.prototype.__class__ = b2RevoluteJointDef;
b2RevoluteJointDef.__cache__ = {};
Module['b2RevoluteJointDef'] = b2RevoluteJointDef;

b2RevoluteJointDef.prototype['Initialize'] = b2RevoluteJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchor) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchor && typeof anchor === 'object') anchor = anchor.ptr;
  _emscripten_bind_b2RevoluteJointDef_Initialize_3(self, bodyA, bodyB, anchor);
};;

  b2RevoluteJointDef.prototype['get_localAnchorA'] = b2RevoluteJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2RevoluteJointDef.prototype['set_localAnchorA'] = b2RevoluteJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'localAnchorA', { get: b2RevoluteJointDef.prototype.get_localAnchorA, set: b2RevoluteJointDef.prototype.set_localAnchorA });
  b2RevoluteJointDef.prototype['get_localAnchorB'] = b2RevoluteJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2RevoluteJointDef.prototype['set_localAnchorB'] = b2RevoluteJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'localAnchorB', { get: b2RevoluteJointDef.prototype.get_localAnchorB, set: b2RevoluteJointDef.prototype.set_localAnchorB });
  b2RevoluteJointDef.prototype['get_referenceAngle'] = b2RevoluteJointDef.prototype.get_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_referenceAngle_0(self);
};
    b2RevoluteJointDef.prototype['set_referenceAngle'] = b2RevoluteJointDef.prototype.set_referenceAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_referenceAngle_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'referenceAngle', { get: b2RevoluteJointDef.prototype.get_referenceAngle, set: b2RevoluteJointDef.prototype.set_referenceAngle });
  b2RevoluteJointDef.prototype['get_enableLimit'] = b2RevoluteJointDef.prototype.get_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJointDef_get_enableLimit_0(self));
};
    b2RevoluteJointDef.prototype['set_enableLimit'] = b2RevoluteJointDef.prototype.set_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_enableLimit_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'enableLimit', { get: b2RevoluteJointDef.prototype.get_enableLimit, set: b2RevoluteJointDef.prototype.set_enableLimit });
  b2RevoluteJointDef.prototype['get_lowerAngle'] = b2RevoluteJointDef.prototype.get_lowerAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_lowerAngle_0(self);
};
    b2RevoluteJointDef.prototype['set_lowerAngle'] = b2RevoluteJointDef.prototype.set_lowerAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_lowerAngle_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'lowerAngle', { get: b2RevoluteJointDef.prototype.get_lowerAngle, set: b2RevoluteJointDef.prototype.set_lowerAngle });
  b2RevoluteJointDef.prototype['get_upperAngle'] = b2RevoluteJointDef.prototype.get_upperAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_upperAngle_0(self);
};
    b2RevoluteJointDef.prototype['set_upperAngle'] = b2RevoluteJointDef.prototype.set_upperAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_upperAngle_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'upperAngle', { get: b2RevoluteJointDef.prototype.get_upperAngle, set: b2RevoluteJointDef.prototype.set_upperAngle });
  b2RevoluteJointDef.prototype['get_enableMotor'] = b2RevoluteJointDef.prototype.get_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJointDef_get_enableMotor_0(self));
};
    b2RevoluteJointDef.prototype['set_enableMotor'] = b2RevoluteJointDef.prototype.set_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_enableMotor_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'enableMotor', { get: b2RevoluteJointDef.prototype.get_enableMotor, set: b2RevoluteJointDef.prototype.set_enableMotor });
  b2RevoluteJointDef.prototype['get_motorSpeed'] = b2RevoluteJointDef.prototype.get_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_motorSpeed_0(self);
};
    b2RevoluteJointDef.prototype['set_motorSpeed'] = b2RevoluteJointDef.prototype.set_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_motorSpeed_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'motorSpeed', { get: b2RevoluteJointDef.prototype.get_motorSpeed, set: b2RevoluteJointDef.prototype.set_motorSpeed });
  b2RevoluteJointDef.prototype['get_maxMotorTorque'] = b2RevoluteJointDef.prototype.get_maxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_maxMotorTorque_0(self);
};
    b2RevoluteJointDef.prototype['set_maxMotorTorque'] = b2RevoluteJointDef.prototype.set_maxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_maxMotorTorque_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'maxMotorTorque', { get: b2RevoluteJointDef.prototype.get_maxMotorTorque, set: b2RevoluteJointDef.prototype.set_maxMotorTorque });
  b2RevoluteJointDef.prototype['get_type'] = b2RevoluteJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RevoluteJointDef_get_type_0(self);
};
    b2RevoluteJointDef.prototype['set_type'] = b2RevoluteJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'type', { get: b2RevoluteJointDef.prototype.get_type, set: b2RevoluteJointDef.prototype.set_type });
  b2RevoluteJointDef.prototype['get_userData'] = b2RevoluteJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJointDef_get_userData_0(self), b2JointUserData);
};
    b2RevoluteJointDef.prototype['set_userData'] = b2RevoluteJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'userData', { get: b2RevoluteJointDef.prototype.get_userData, set: b2RevoluteJointDef.prototype.set_userData });
  b2RevoluteJointDef.prototype['get_bodyA'] = b2RevoluteJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJointDef_get_bodyA_0(self), b2Body);
};
    b2RevoluteJointDef.prototype['set_bodyA'] = b2RevoluteJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'bodyA', { get: b2RevoluteJointDef.prototype.get_bodyA, set: b2RevoluteJointDef.prototype.set_bodyA });
  b2RevoluteJointDef.prototype['get_bodyB'] = b2RevoluteJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RevoluteJointDef_get_bodyB_0(self), b2Body);
};
    b2RevoluteJointDef.prototype['set_bodyB'] = b2RevoluteJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'bodyB', { get: b2RevoluteJointDef.prototype.get_bodyB, set: b2RevoluteJointDef.prototype.set_bodyB });
  b2RevoluteJointDef.prototype['get_collideConnected'] = b2RevoluteJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RevoluteJointDef_get_collideConnected_0(self));
};
    b2RevoluteJointDef.prototype['set_collideConnected'] = b2RevoluteJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RevoluteJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2RevoluteJointDef.prototype, 'collideConnected', { get: b2RevoluteJointDef.prototype.get_collideConnected, set: b2RevoluteJointDef.prototype.set_collideConnected });
  b2RevoluteJointDef.prototype['__destroy__'] = b2RevoluteJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RevoluteJointDef___destroy___0(self);
};
// b2Rot
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Rot(angle) {
  if (angle && typeof angle === 'object') angle = angle.ptr;
  if (angle === undefined) { this.ptr = _emscripten_bind_b2Rot_b2Rot_0(); getCache(b2Rot)[this.ptr] = this;return }
  this.ptr = _emscripten_bind_b2Rot_b2Rot_1(angle);
  getCache(b2Rot)[this.ptr] = this;
};;
b2Rot.prototype = Object.create(WrapperObject.prototype);
b2Rot.prototype.constructor = b2Rot;
b2Rot.prototype.__class__ = b2Rot;
b2Rot.__cache__ = {};
Module['b2Rot'] = b2Rot;

b2Rot.prototype['Set'] = b2Rot.prototype.Set = /** @suppress {undefinedVars, duplicate} @this{Object} */function(angle) {
  var self = this.ptr;
  if (angle && typeof angle === 'object') angle = angle.ptr;
  _emscripten_bind_b2Rot_Set_1(self, angle);
};;

b2Rot.prototype['SetIdentity'] = b2Rot.prototype.SetIdentity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Rot_SetIdentity_0(self);
};;

b2Rot.prototype['GetAngle'] = b2Rot.prototype.GetAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Rot_GetAngle_0(self);
};;

b2Rot.prototype['GetXAxis'] = b2Rot.prototype.GetXAxis = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Rot_GetXAxis_0(self), b2Vec2);
};;

b2Rot.prototype['GetYAxis'] = b2Rot.prototype.GetYAxis = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2Rot_GetYAxis_0(self), b2Vec2);
};;

  b2Rot.prototype['get_s'] = b2Rot.prototype.get_s = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Rot_get_s_0(self);
};
    b2Rot.prototype['set_s'] = b2Rot.prototype.set_s = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Rot_set_s_1(self, arg0);
};
    Object.defineProperty(b2Rot.prototype, 's', { get: b2Rot.prototype.get_s, set: b2Rot.prototype.set_s });
  b2Rot.prototype['get_c'] = b2Rot.prototype.get_c = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2Rot_get_c_0(self);
};
    b2Rot.prototype['set_c'] = b2Rot.prototype.set_c = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2Rot_set_c_1(self, arg0);
};
    Object.defineProperty(b2Rot.prototype, 'c', { get: b2Rot.prototype.get_c, set: b2Rot.prototype.set_c });
  b2Rot.prototype['__destroy__'] = b2Rot.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Rot___destroy___0(self);
};
// b2WheelJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2WheelJoint() { throw "cannot construct a b2WheelJoint, no constructor in IDL" }
b2WheelJoint.prototype = Object.create(b2Joint.prototype);
b2WheelJoint.prototype.constructor = b2WheelJoint;
b2WheelJoint.prototype.__class__ = b2WheelJoint;
b2WheelJoint.__cache__ = {};
Module['b2WheelJoint'] = b2WheelJoint;

b2WheelJoint.prototype['GetLocalAnchorA'] = b2WheelJoint.prototype.GetLocalAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetLocalAnchorA_0(self), b2Vec2);
};;

b2WheelJoint.prototype['GetLocalAnchorB'] = b2WheelJoint.prototype.GetLocalAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetLocalAnchorB_0(self), b2Vec2);
};;

b2WheelJoint.prototype['GetLocalAxisA'] = b2WheelJoint.prototype.GetLocalAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetLocalAxisA_0(self), b2Vec2);
};;

b2WheelJoint.prototype['GetJointTranslation'] = b2WheelJoint.prototype.GetJointTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetJointTranslation_0(self);
};;

b2WheelJoint.prototype['GetJointLinearSpeed'] = b2WheelJoint.prototype.GetJointLinearSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetJointLinearSpeed_0(self);
};;

b2WheelJoint.prototype['GetJointAngle'] = b2WheelJoint.prototype.GetJointAngle = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetJointAngle_0(self);
};;

b2WheelJoint.prototype['GetJointAngularSpeed'] = b2WheelJoint.prototype.GetJointAngularSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetJointAngularSpeed_0(self);
};;

b2WheelJoint.prototype['IsLimitEnabled'] = b2WheelJoint.prototype.IsLimitEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJoint_IsLimitEnabled_0(self));
};;

b2WheelJoint.prototype['EnableLimit'] = b2WheelJoint.prototype.EnableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2WheelJoint_EnableLimit_1(self, flag);
};;

b2WheelJoint.prototype['GetLowerLimit'] = b2WheelJoint.prototype.GetLowerLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetLowerLimit_0(self);
};;

b2WheelJoint.prototype['GetUpperLimit'] = b2WheelJoint.prototype.GetUpperLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetUpperLimit_0(self);
};;

b2WheelJoint.prototype['SetLimits'] = b2WheelJoint.prototype.SetLimits = /** @suppress {undefinedVars, duplicate} @this{Object} */function(lower, upper) {
  var self = this.ptr;
  if (lower && typeof lower === 'object') lower = lower.ptr;
  if (upper && typeof upper === 'object') upper = upper.ptr;
  _emscripten_bind_b2WheelJoint_SetLimits_2(self, lower, upper);
};;

b2WheelJoint.prototype['IsMotorEnabled'] = b2WheelJoint.prototype.IsMotorEnabled = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJoint_IsMotorEnabled_0(self));
};;

b2WheelJoint.prototype['EnableMotor'] = b2WheelJoint.prototype.EnableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(flag) {
  var self = this.ptr;
  if (flag && typeof flag === 'object') flag = flag.ptr;
  _emscripten_bind_b2WheelJoint_EnableMotor_1(self, flag);
};;

b2WheelJoint.prototype['SetMotorSpeed'] = b2WheelJoint.prototype.SetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(speed) {
  var self = this.ptr;
  if (speed && typeof speed === 'object') speed = speed.ptr;
  _emscripten_bind_b2WheelJoint_SetMotorSpeed_1(self, speed);
};;

b2WheelJoint.prototype['GetMotorSpeed'] = b2WheelJoint.prototype.GetMotorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetMotorSpeed_0(self);
};;

b2WheelJoint.prototype['SetMaxMotorTorque'] = b2WheelJoint.prototype.SetMaxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(torque) {
  var self = this.ptr;
  if (torque && typeof torque === 'object') torque = torque.ptr;
  _emscripten_bind_b2WheelJoint_SetMaxMotorTorque_1(self, torque);
};;

b2WheelJoint.prototype['GetMaxMotorTorque'] = b2WheelJoint.prototype.GetMaxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetMaxMotorTorque_0(self);
};;

b2WheelJoint.prototype['GetMotorTorque'] = b2WheelJoint.prototype.GetMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2WheelJoint_GetMotorTorque_1(self, inv_dt);
};;

b2WheelJoint.prototype['SetStiffness'] = b2WheelJoint.prototype.SetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(stiffness) {
  var self = this.ptr;
  if (stiffness && typeof stiffness === 'object') stiffness = stiffness.ptr;
  _emscripten_bind_b2WheelJoint_SetStiffness_1(self, stiffness);
};;

b2WheelJoint.prototype['GetStiffness'] = b2WheelJoint.prototype.GetStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetStiffness_0(self);
};;

b2WheelJoint.prototype['SetDamping'] = b2WheelJoint.prototype.SetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(damping) {
  var self = this.ptr;
  if (damping && typeof damping === 'object') damping = damping.ptr;
  _emscripten_bind_b2WheelJoint_SetDamping_1(self, damping);
};;

b2WheelJoint.prototype['GetDamping'] = b2WheelJoint.prototype.GetDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetDamping_0(self);
};;

b2WheelJoint.prototype['GetType'] = b2WheelJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJoint_GetType_0(self);
};;

b2WheelJoint.prototype['GetBodyA'] = b2WheelJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetBodyA_0(self), b2Body);
};;

b2WheelJoint.prototype['GetBodyB'] = b2WheelJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetBodyB_0(self), b2Body);
};;

b2WheelJoint.prototype['GetAnchorA'] = b2WheelJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetAnchorA_0(self), b2Vec2);
};;

b2WheelJoint.prototype['GetAnchorB'] = b2WheelJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetAnchorB_0(self), b2Vec2);
};;

b2WheelJoint.prototype['GetReactionForce'] = b2WheelJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2WheelJoint.prototype['GetReactionTorque'] = b2WheelJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2WheelJoint_GetReactionTorque_1(self, inv_dt);
};;

b2WheelJoint.prototype['GetNext'] = b2WheelJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetNext_0(self), b2Joint);
};;

b2WheelJoint.prototype['GetUserData'] = b2WheelJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJoint_GetUserData_0(self), b2JointUserData);
};;

b2WheelJoint.prototype['GetCollideConnected'] = b2WheelJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJoint_GetCollideConnected_0(self));
};;

  b2WheelJoint.prototype['__destroy__'] = b2WheelJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WheelJoint___destroy___0(self);
};
// b2WheelJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2WheelJointDef() {
  this.ptr = _emscripten_bind_b2WheelJointDef_b2WheelJointDef_0();
  getCache(b2WheelJointDef)[this.ptr] = this;
};;
b2WheelJointDef.prototype = Object.create(b2JointDef.prototype);
b2WheelJointDef.prototype.constructor = b2WheelJointDef;
b2WheelJointDef.prototype.__class__ = b2WheelJointDef;
b2WheelJointDef.__cache__ = {};
Module['b2WheelJointDef'] = b2WheelJointDef;

b2WheelJointDef.prototype['Initialize'] = b2WheelJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB, anchor, axis) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  if (anchor && typeof anchor === 'object') anchor = anchor.ptr;
  if (axis && typeof axis === 'object') axis = axis.ptr;
  _emscripten_bind_b2WheelJointDef_Initialize_4(self, bodyA, bodyB, anchor, axis);
};;

  b2WheelJointDef.prototype['get_localAnchorA'] = b2WheelJointDef.prototype.get_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_localAnchorA_0(self), b2Vec2);
};
    b2WheelJointDef.prototype['set_localAnchorA'] = b2WheelJointDef.prototype.set_localAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_localAnchorA_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'localAnchorA', { get: b2WheelJointDef.prototype.get_localAnchorA, set: b2WheelJointDef.prototype.set_localAnchorA });
  b2WheelJointDef.prototype['get_localAnchorB'] = b2WheelJointDef.prototype.get_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_localAnchorB_0(self), b2Vec2);
};
    b2WheelJointDef.prototype['set_localAnchorB'] = b2WheelJointDef.prototype.set_localAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_localAnchorB_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'localAnchorB', { get: b2WheelJointDef.prototype.get_localAnchorB, set: b2WheelJointDef.prototype.set_localAnchorB });
  b2WheelJointDef.prototype['get_localAxisA'] = b2WheelJointDef.prototype.get_localAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_localAxisA_0(self), b2Vec2);
};
    b2WheelJointDef.prototype['set_localAxisA'] = b2WheelJointDef.prototype.set_localAxisA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_localAxisA_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'localAxisA', { get: b2WheelJointDef.prototype.get_localAxisA, set: b2WheelJointDef.prototype.set_localAxisA });
  b2WheelJointDef.prototype['get_enableLimit'] = b2WheelJointDef.prototype.get_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJointDef_get_enableLimit_0(self));
};
    b2WheelJointDef.prototype['set_enableLimit'] = b2WheelJointDef.prototype.set_enableLimit = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_enableLimit_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'enableLimit', { get: b2WheelJointDef.prototype.get_enableLimit, set: b2WheelJointDef.prototype.set_enableLimit });
  b2WheelJointDef.prototype['get_lowerTranslation'] = b2WheelJointDef.prototype.get_lowerTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_lowerTranslation_0(self);
};
    b2WheelJointDef.prototype['set_lowerTranslation'] = b2WheelJointDef.prototype.set_lowerTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_lowerTranslation_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'lowerTranslation', { get: b2WheelJointDef.prototype.get_lowerTranslation, set: b2WheelJointDef.prototype.set_lowerTranslation });
  b2WheelJointDef.prototype['get_upperTranslation'] = b2WheelJointDef.prototype.get_upperTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_upperTranslation_0(self);
};
    b2WheelJointDef.prototype['set_upperTranslation'] = b2WheelJointDef.prototype.set_upperTranslation = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_upperTranslation_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'upperTranslation', { get: b2WheelJointDef.prototype.get_upperTranslation, set: b2WheelJointDef.prototype.set_upperTranslation });
  b2WheelJointDef.prototype['get_enableMotor'] = b2WheelJointDef.prototype.get_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJointDef_get_enableMotor_0(self));
};
    b2WheelJointDef.prototype['set_enableMotor'] = b2WheelJointDef.prototype.set_enableMotor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_enableMotor_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'enableMotor', { get: b2WheelJointDef.prototype.get_enableMotor, set: b2WheelJointDef.prototype.set_enableMotor });
  b2WheelJointDef.prototype['get_maxMotorTorque'] = b2WheelJointDef.prototype.get_maxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_maxMotorTorque_0(self);
};
    b2WheelJointDef.prototype['set_maxMotorTorque'] = b2WheelJointDef.prototype.set_maxMotorTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_maxMotorTorque_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'maxMotorTorque', { get: b2WheelJointDef.prototype.get_maxMotorTorque, set: b2WheelJointDef.prototype.set_maxMotorTorque });
  b2WheelJointDef.prototype['get_motorSpeed'] = b2WheelJointDef.prototype.get_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_motorSpeed_0(self);
};
    b2WheelJointDef.prototype['set_motorSpeed'] = b2WheelJointDef.prototype.set_motorSpeed = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_motorSpeed_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'motorSpeed', { get: b2WheelJointDef.prototype.get_motorSpeed, set: b2WheelJointDef.prototype.set_motorSpeed });
  b2WheelJointDef.prototype['get_stiffness'] = b2WheelJointDef.prototype.get_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_stiffness_0(self);
};
    b2WheelJointDef.prototype['set_stiffness'] = b2WheelJointDef.prototype.set_stiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_stiffness_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'stiffness', { get: b2WheelJointDef.prototype.get_stiffness, set: b2WheelJointDef.prototype.set_stiffness });
  b2WheelJointDef.prototype['get_damping'] = b2WheelJointDef.prototype.get_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_damping_0(self);
};
    b2WheelJointDef.prototype['set_damping'] = b2WheelJointDef.prototype.set_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_damping_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'damping', { get: b2WheelJointDef.prototype.get_damping, set: b2WheelJointDef.prototype.set_damping });
  b2WheelJointDef.prototype['get_type'] = b2WheelJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2WheelJointDef_get_type_0(self);
};
    b2WheelJointDef.prototype['set_type'] = b2WheelJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'type', { get: b2WheelJointDef.prototype.get_type, set: b2WheelJointDef.prototype.set_type });
  b2WheelJointDef.prototype['get_userData'] = b2WheelJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_userData_0(self), b2JointUserData);
};
    b2WheelJointDef.prototype['set_userData'] = b2WheelJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'userData', { get: b2WheelJointDef.prototype.get_userData, set: b2WheelJointDef.prototype.set_userData });
  b2WheelJointDef.prototype['get_bodyA'] = b2WheelJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_bodyA_0(self), b2Body);
};
    b2WheelJointDef.prototype['set_bodyA'] = b2WheelJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'bodyA', { get: b2WheelJointDef.prototype.get_bodyA, set: b2WheelJointDef.prototype.set_bodyA });
  b2WheelJointDef.prototype['get_bodyB'] = b2WheelJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2WheelJointDef_get_bodyB_0(self), b2Body);
};
    b2WheelJointDef.prototype['set_bodyB'] = b2WheelJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'bodyB', { get: b2WheelJointDef.prototype.get_bodyB, set: b2WheelJointDef.prototype.set_bodyB });
  b2WheelJointDef.prototype['get_collideConnected'] = b2WheelJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2WheelJointDef_get_collideConnected_0(self));
};
    b2WheelJointDef.prototype['set_collideConnected'] = b2WheelJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2WheelJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2WheelJointDef.prototype, 'collideConnected', { get: b2WheelJointDef.prototype.get_collideConnected, set: b2WheelJointDef.prototype.set_collideConnected });
  b2WheelJointDef.prototype['__destroy__'] = b2WheelJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2WheelJointDef___destroy___0(self);
};
// b2MotorJoint
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2MotorJoint() { throw "cannot construct a b2MotorJoint, no constructor in IDL" }
b2MotorJoint.prototype = Object.create(b2Joint.prototype);
b2MotorJoint.prototype.constructor = b2MotorJoint;
b2MotorJoint.prototype.__class__ = b2MotorJoint;
b2MotorJoint.__cache__ = {};
Module['b2MotorJoint'] = b2MotorJoint;

b2MotorJoint.prototype['SetLinearOffset'] = b2MotorJoint.prototype.SetLinearOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function(linearOffset) {
  var self = this.ptr;
  if (linearOffset && typeof linearOffset === 'object') linearOffset = linearOffset.ptr;
  _emscripten_bind_b2MotorJoint_SetLinearOffset_1(self, linearOffset);
};;

b2MotorJoint.prototype['GetLinearOffset'] = b2MotorJoint.prototype.GetLinearOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetLinearOffset_0(self), b2Vec2);
};;

b2MotorJoint.prototype['SetAngularOffset'] = b2MotorJoint.prototype.SetAngularOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function(angularOffset) {
  var self = this.ptr;
  if (angularOffset && typeof angularOffset === 'object') angularOffset = angularOffset.ptr;
  _emscripten_bind_b2MotorJoint_SetAngularOffset_1(self, angularOffset);
};;

b2MotorJoint.prototype['GetAngularOffset'] = b2MotorJoint.prototype.GetAngularOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJoint_GetAngularOffset_0(self);
};;

b2MotorJoint.prototype['SetMaxForce'] = b2MotorJoint.prototype.SetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(force) {
  var self = this.ptr;
  if (force && typeof force === 'object') force = force.ptr;
  _emscripten_bind_b2MotorJoint_SetMaxForce_1(self, force);
};;

b2MotorJoint.prototype['GetMaxForce'] = b2MotorJoint.prototype.GetMaxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJoint_GetMaxForce_0(self);
};;

b2MotorJoint.prototype['SetMaxTorque'] = b2MotorJoint.prototype.SetMaxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(torque) {
  var self = this.ptr;
  if (torque && typeof torque === 'object') torque = torque.ptr;
  _emscripten_bind_b2MotorJoint_SetMaxTorque_1(self, torque);
};;

b2MotorJoint.prototype['GetMaxTorque'] = b2MotorJoint.prototype.GetMaxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJoint_GetMaxTorque_0(self);
};;

b2MotorJoint.prototype['SetCorrectionFactor'] = b2MotorJoint.prototype.SetCorrectionFactor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(factor) {
  var self = this.ptr;
  if (factor && typeof factor === 'object') factor = factor.ptr;
  _emscripten_bind_b2MotorJoint_SetCorrectionFactor_1(self, factor);
};;

b2MotorJoint.prototype['GetCorrectionFactor'] = b2MotorJoint.prototype.GetCorrectionFactor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJoint_GetCorrectionFactor_0(self);
};;

b2MotorJoint.prototype['GetType'] = b2MotorJoint.prototype.GetType = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJoint_GetType_0(self);
};;

b2MotorJoint.prototype['GetBodyA'] = b2MotorJoint.prototype.GetBodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetBodyA_0(self), b2Body);
};;

b2MotorJoint.prototype['GetBodyB'] = b2MotorJoint.prototype.GetBodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetBodyB_0(self), b2Body);
};;

b2MotorJoint.prototype['GetAnchorA'] = b2MotorJoint.prototype.GetAnchorA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetAnchorA_0(self), b2Vec2);
};;

b2MotorJoint.prototype['GetAnchorB'] = b2MotorJoint.prototype.GetAnchorB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetAnchorB_0(self), b2Vec2);
};;

b2MotorJoint.prototype['GetReactionForce'] = b2MotorJoint.prototype.GetReactionForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetReactionForce_1(self, inv_dt), b2Vec2);
};;

b2MotorJoint.prototype['GetReactionTorque'] = b2MotorJoint.prototype.GetReactionTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(inv_dt) {
  var self = this.ptr;
  if (inv_dt && typeof inv_dt === 'object') inv_dt = inv_dt.ptr;
  return _emscripten_bind_b2MotorJoint_GetReactionTorque_1(self, inv_dt);
};;

b2MotorJoint.prototype['GetNext'] = b2MotorJoint.prototype.GetNext = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetNext_0(self), b2Joint);
};;

b2MotorJoint.prototype['GetUserData'] = b2MotorJoint.prototype.GetUserData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJoint_GetUserData_0(self), b2JointUserData);
};;

b2MotorJoint.prototype['GetCollideConnected'] = b2MotorJoint.prototype.GetCollideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2MotorJoint_GetCollideConnected_0(self));
};;

  b2MotorJoint.prototype['__destroy__'] = b2MotorJoint.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2MotorJoint___destroy___0(self);
};
// b2MotorJointDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2MotorJointDef() {
  this.ptr = _emscripten_bind_b2MotorJointDef_b2MotorJointDef_0();
  getCache(b2MotorJointDef)[this.ptr] = this;
};;
b2MotorJointDef.prototype = Object.create(b2JointDef.prototype);
b2MotorJointDef.prototype.constructor = b2MotorJointDef;
b2MotorJointDef.prototype.__class__ = b2MotorJointDef;
b2MotorJointDef.__cache__ = {};
Module['b2MotorJointDef'] = b2MotorJointDef;

b2MotorJointDef.prototype['Initialize'] = b2MotorJointDef.prototype.Initialize = /** @suppress {undefinedVars, duplicate} @this{Object} */function(bodyA, bodyB) {
  var self = this.ptr;
  if (bodyA && typeof bodyA === 'object') bodyA = bodyA.ptr;
  if (bodyB && typeof bodyB === 'object') bodyB = bodyB.ptr;
  _emscripten_bind_b2MotorJointDef_Initialize_2(self, bodyA, bodyB);
};;

  b2MotorJointDef.prototype['get_linearOffset'] = b2MotorJointDef.prototype.get_linearOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJointDef_get_linearOffset_0(self), b2Vec2);
};
    b2MotorJointDef.prototype['set_linearOffset'] = b2MotorJointDef.prototype.set_linearOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_linearOffset_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'linearOffset', { get: b2MotorJointDef.prototype.get_linearOffset, set: b2MotorJointDef.prototype.set_linearOffset });
  b2MotorJointDef.prototype['get_angularOffset'] = b2MotorJointDef.prototype.get_angularOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJointDef_get_angularOffset_0(self);
};
    b2MotorJointDef.prototype['set_angularOffset'] = b2MotorJointDef.prototype.set_angularOffset = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_angularOffset_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'angularOffset', { get: b2MotorJointDef.prototype.get_angularOffset, set: b2MotorJointDef.prototype.set_angularOffset });
  b2MotorJointDef.prototype['get_maxForce'] = b2MotorJointDef.prototype.get_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJointDef_get_maxForce_0(self);
};
    b2MotorJointDef.prototype['set_maxForce'] = b2MotorJointDef.prototype.set_maxForce = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_maxForce_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'maxForce', { get: b2MotorJointDef.prototype.get_maxForce, set: b2MotorJointDef.prototype.set_maxForce });
  b2MotorJointDef.prototype['get_maxTorque'] = b2MotorJointDef.prototype.get_maxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJointDef_get_maxTorque_0(self);
};
    b2MotorJointDef.prototype['set_maxTorque'] = b2MotorJointDef.prototype.set_maxTorque = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_maxTorque_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'maxTorque', { get: b2MotorJointDef.prototype.get_maxTorque, set: b2MotorJointDef.prototype.set_maxTorque });
  b2MotorJointDef.prototype['get_correctionFactor'] = b2MotorJointDef.prototype.get_correctionFactor = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJointDef_get_correctionFactor_0(self);
};
    b2MotorJointDef.prototype['set_correctionFactor'] = b2MotorJointDef.prototype.set_correctionFactor = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_correctionFactor_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'correctionFactor', { get: b2MotorJointDef.prototype.get_correctionFactor, set: b2MotorJointDef.prototype.set_correctionFactor });
  b2MotorJointDef.prototype['get_type'] = b2MotorJointDef.prototype.get_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2MotorJointDef_get_type_0(self);
};
    b2MotorJointDef.prototype['set_type'] = b2MotorJointDef.prototype.set_type = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_type_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'type', { get: b2MotorJointDef.prototype.get_type, set: b2MotorJointDef.prototype.set_type });
  b2MotorJointDef.prototype['get_userData'] = b2MotorJointDef.prototype.get_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJointDef_get_userData_0(self), b2JointUserData);
};
    b2MotorJointDef.prototype['set_userData'] = b2MotorJointDef.prototype.set_userData = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_userData_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'userData', { get: b2MotorJointDef.prototype.get_userData, set: b2MotorJointDef.prototype.set_userData });
  b2MotorJointDef.prototype['get_bodyA'] = b2MotorJointDef.prototype.get_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJointDef_get_bodyA_0(self), b2Body);
};
    b2MotorJointDef.prototype['set_bodyA'] = b2MotorJointDef.prototype.set_bodyA = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_bodyA_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'bodyA', { get: b2MotorJointDef.prototype.get_bodyA, set: b2MotorJointDef.prototype.set_bodyA });
  b2MotorJointDef.prototype['get_bodyB'] = b2MotorJointDef.prototype.get_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2MotorJointDef_get_bodyB_0(self), b2Body);
};
    b2MotorJointDef.prototype['set_bodyB'] = b2MotorJointDef.prototype.set_bodyB = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_bodyB_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'bodyB', { get: b2MotorJointDef.prototype.get_bodyB, set: b2MotorJointDef.prototype.set_bodyB });
  b2MotorJointDef.prototype['get_collideConnected'] = b2MotorJointDef.prototype.get_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2MotorJointDef_get_collideConnected_0(self));
};
    b2MotorJointDef.prototype['set_collideConnected'] = b2MotorJointDef.prototype.set_collideConnected = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2MotorJointDef_set_collideConnected_1(self, arg0);
};
    Object.defineProperty(b2MotorJointDef.prototype, 'collideConnected', { get: b2MotorJointDef.prototype.get_collideConnected, set: b2MotorJointDef.prototype.set_collideConnected });
  b2MotorJointDef.prototype['__destroy__'] = b2MotorJointDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2MotorJointDef___destroy___0(self);
};
// b2RopeTuning
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RopeTuning() {
  this.ptr = _emscripten_bind_b2RopeTuning_b2RopeTuning_0();
  getCache(b2RopeTuning)[this.ptr] = this;
};;
b2RopeTuning.prototype = Object.create(WrapperObject.prototype);
b2RopeTuning.prototype.constructor = b2RopeTuning;
b2RopeTuning.prototype.__class__ = b2RopeTuning;
b2RopeTuning.__cache__ = {};
Module['b2RopeTuning'] = b2RopeTuning;

  b2RopeTuning.prototype['get_stretchingModel'] = b2RopeTuning.prototype.get_stretchingModel = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_stretchingModel_0(self);
};
    b2RopeTuning.prototype['set_stretchingModel'] = b2RopeTuning.prototype.set_stretchingModel = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_stretchingModel_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'stretchingModel', { get: b2RopeTuning.prototype.get_stretchingModel, set: b2RopeTuning.prototype.set_stretchingModel });
  b2RopeTuning.prototype['get_bendingModel'] = b2RopeTuning.prototype.get_bendingModel = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_bendingModel_0(self);
};
    b2RopeTuning.prototype['set_bendingModel'] = b2RopeTuning.prototype.set_bendingModel = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_bendingModel_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'bendingModel', { get: b2RopeTuning.prototype.get_bendingModel, set: b2RopeTuning.prototype.set_bendingModel });
  b2RopeTuning.prototype['get_damping'] = b2RopeTuning.prototype.get_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_damping_0(self);
};
    b2RopeTuning.prototype['set_damping'] = b2RopeTuning.prototype.set_damping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_damping_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'damping', { get: b2RopeTuning.prototype.get_damping, set: b2RopeTuning.prototype.set_damping });
  b2RopeTuning.prototype['get_stretchStiffness'] = b2RopeTuning.prototype.get_stretchStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_stretchStiffness_0(self);
};
    b2RopeTuning.prototype['set_stretchStiffness'] = b2RopeTuning.prototype.set_stretchStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_stretchStiffness_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'stretchStiffness', { get: b2RopeTuning.prototype.get_stretchStiffness, set: b2RopeTuning.prototype.set_stretchStiffness });
  b2RopeTuning.prototype['get_stretchHertz'] = b2RopeTuning.prototype.get_stretchHertz = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_stretchHertz_0(self);
};
    b2RopeTuning.prototype['set_stretchHertz'] = b2RopeTuning.prototype.set_stretchHertz = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_stretchHertz_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'stretchHertz', { get: b2RopeTuning.prototype.get_stretchHertz, set: b2RopeTuning.prototype.set_stretchHertz });
  b2RopeTuning.prototype['get_stretchDamping'] = b2RopeTuning.prototype.get_stretchDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_stretchDamping_0(self);
};
    b2RopeTuning.prototype['set_stretchDamping'] = b2RopeTuning.prototype.set_stretchDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_stretchDamping_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'stretchDamping', { get: b2RopeTuning.prototype.get_stretchDamping, set: b2RopeTuning.prototype.set_stretchDamping });
  b2RopeTuning.prototype['get_bendStiffness'] = b2RopeTuning.prototype.get_bendStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_bendStiffness_0(self);
};
    b2RopeTuning.prototype['set_bendStiffness'] = b2RopeTuning.prototype.set_bendStiffness = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_bendStiffness_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'bendStiffness', { get: b2RopeTuning.prototype.get_bendStiffness, set: b2RopeTuning.prototype.set_bendStiffness });
  b2RopeTuning.prototype['get_bendHertz'] = b2RopeTuning.prototype.get_bendHertz = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_bendHertz_0(self);
};
    b2RopeTuning.prototype['set_bendHertz'] = b2RopeTuning.prototype.set_bendHertz = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_bendHertz_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'bendHertz', { get: b2RopeTuning.prototype.get_bendHertz, set: b2RopeTuning.prototype.set_bendHertz });
  b2RopeTuning.prototype['get_bendDamping'] = b2RopeTuning.prototype.get_bendDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeTuning_get_bendDamping_0(self);
};
    b2RopeTuning.prototype['set_bendDamping'] = b2RopeTuning.prototype.set_bendDamping = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_bendDamping_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'bendDamping', { get: b2RopeTuning.prototype.get_bendDamping, set: b2RopeTuning.prototype.set_bendDamping });
  b2RopeTuning.prototype['get_isometric'] = b2RopeTuning.prototype.get_isometric = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RopeTuning_get_isometric_0(self));
};
    b2RopeTuning.prototype['set_isometric'] = b2RopeTuning.prototype.set_isometric = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_isometric_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'isometric', { get: b2RopeTuning.prototype.get_isometric, set: b2RopeTuning.prototype.set_isometric });
  b2RopeTuning.prototype['get_fixedEffectiveMass'] = b2RopeTuning.prototype.get_fixedEffectiveMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RopeTuning_get_fixedEffectiveMass_0(self));
};
    b2RopeTuning.prototype['set_fixedEffectiveMass'] = b2RopeTuning.prototype.set_fixedEffectiveMass = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_fixedEffectiveMass_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'fixedEffectiveMass', { get: b2RopeTuning.prototype.get_fixedEffectiveMass, set: b2RopeTuning.prototype.set_fixedEffectiveMass });
  b2RopeTuning.prototype['get_warmStart'] = b2RopeTuning.prototype.get_warmStart = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return !!(_emscripten_bind_b2RopeTuning_get_warmStart_0(self));
};
    b2RopeTuning.prototype['set_warmStart'] = b2RopeTuning.prototype.set_warmStart = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeTuning_set_warmStart_1(self, arg0);
};
    Object.defineProperty(b2RopeTuning.prototype, 'warmStart', { get: b2RopeTuning.prototype.get_warmStart, set: b2RopeTuning.prototype.set_warmStart });
  b2RopeTuning.prototype['__destroy__'] = b2RopeTuning.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RopeTuning___destroy___0(self);
};
// b2RopeDef
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2RopeDef() {
  this.ptr = _emscripten_bind_b2RopeDef_b2RopeDef_0();
  getCache(b2RopeDef)[this.ptr] = this;
};;
b2RopeDef.prototype = Object.create(WrapperObject.prototype);
b2RopeDef.prototype.constructor = b2RopeDef;
b2RopeDef.prototype.__class__ = b2RopeDef;
b2RopeDef.__cache__ = {};
Module['b2RopeDef'] = b2RopeDef;

  b2RopeDef.prototype['get_position'] = b2RopeDef.prototype.get_position = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RopeDef_get_position_0(self), b2Vec2);
};
    b2RopeDef.prototype['set_position'] = b2RopeDef.prototype.set_position = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeDef_set_position_1(self, arg0);
};
    Object.defineProperty(b2RopeDef.prototype, 'position', { get: b2RopeDef.prototype.get_position, set: b2RopeDef.prototype.set_position });
  b2RopeDef.prototype['get_vertices'] = b2RopeDef.prototype.get_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RopeDef_get_vertices_0(self), b2Vec2);
};
    b2RopeDef.prototype['set_vertices'] = b2RopeDef.prototype.set_vertices = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeDef_set_vertices_1(self, arg0);
};
    Object.defineProperty(b2RopeDef.prototype, 'vertices', { get: b2RopeDef.prototype.get_vertices, set: b2RopeDef.prototype.set_vertices });
  b2RopeDef.prototype['get_count'] = b2RopeDef.prototype.get_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return _emscripten_bind_b2RopeDef_get_count_0(self);
};
    b2RopeDef.prototype['set_count'] = b2RopeDef.prototype.set_count = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeDef_set_count_1(self, arg0);
};
    Object.defineProperty(b2RopeDef.prototype, 'count', { get: b2RopeDef.prototype.get_count, set: b2RopeDef.prototype.set_count });
  b2RopeDef.prototype['get_gravity'] = b2RopeDef.prototype.get_gravity = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RopeDef_get_gravity_0(self), b2Vec2);
};
    b2RopeDef.prototype['set_gravity'] = b2RopeDef.prototype.set_gravity = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeDef_set_gravity_1(self, arg0);
};
    Object.defineProperty(b2RopeDef.prototype, 'gravity', { get: b2RopeDef.prototype.get_gravity, set: b2RopeDef.prototype.set_gravity });
  b2RopeDef.prototype['get_tuning'] = b2RopeDef.prototype.get_tuning = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2RopeDef_get_tuning_0(self), b2RopeTuning);
};
    b2RopeDef.prototype['set_tuning'] = b2RopeDef.prototype.set_tuning = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2RopeDef_set_tuning_1(self, arg0);
};
    Object.defineProperty(b2RopeDef.prototype, 'tuning', { get: b2RopeDef.prototype.get_tuning, set: b2RopeDef.prototype.set_tuning });
  b2RopeDef.prototype['__destroy__'] = b2RopeDef.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2RopeDef___destroy___0(self);
};
// b2Rope
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2Rope() {
  this.ptr = _emscripten_bind_b2Rope_b2Rope_0();
  getCache(b2Rope)[this.ptr] = this;
};;
b2Rope.prototype = Object.create(WrapperObject.prototype);
b2Rope.prototype.constructor = b2Rope;
b2Rope.prototype.__class__ = b2Rope;
b2Rope.__cache__ = {};
Module['b2Rope'] = b2Rope;

b2Rope.prototype['Create'] = b2Rope.prototype.Create = /** @suppress {undefinedVars, duplicate} @this{Object} */function(def) {
  var self = this.ptr;
  if (def && typeof def === 'object') def = def.ptr;
  _emscripten_bind_b2Rope_Create_1(self, def);
};;

b2Rope.prototype['SetTuning'] = b2Rope.prototype.SetTuning = /** @suppress {undefinedVars, duplicate} @this{Object} */function(tuning) {
  var self = this.ptr;
  if (tuning && typeof tuning === 'object') tuning = tuning.ptr;
  _emscripten_bind_b2Rope_SetTuning_1(self, tuning);
};;

b2Rope.prototype['Step'] = b2Rope.prototype.Step = /** @suppress {undefinedVars, duplicate} @this{Object} */function(timeStep, iterations, position) {
  var self = this.ptr;
  if (timeStep && typeof timeStep === 'object') timeStep = timeStep.ptr;
  if (iterations && typeof iterations === 'object') iterations = iterations.ptr;
  if (position && typeof position === 'object') position = position.ptr;
  _emscripten_bind_b2Rope_Step_3(self, timeStep, iterations, position);
};;

b2Rope.prototype['Reset'] = b2Rope.prototype.Reset = /** @suppress {undefinedVars, duplicate} @this{Object} */function(position) {
  var self = this.ptr;
  if (position && typeof position === 'object') position = position.ptr;
  _emscripten_bind_b2Rope_Reset_1(self, position);
};;

b2Rope.prototype['Draw'] = b2Rope.prototype.Draw = /** @suppress {undefinedVars, duplicate} @this{Object} */function(draw) {
  var self = this.ptr;
  if (draw && typeof draw === 'object') draw = draw.ptr;
  _emscripten_bind_b2Rope_Draw_1(self, draw);
};;

  b2Rope.prototype['__destroy__'] = b2Rope.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2Rope___destroy___0(self);
};
// b2ClipVertex
/** @suppress {undefinedVars, duplicate} @this{Object} */function b2ClipVertex() {
  this.ptr = _emscripten_bind_b2ClipVertex_b2ClipVertex_0();
  getCache(b2ClipVertex)[this.ptr] = this;
};;
b2ClipVertex.prototype = Object.create(WrapperObject.prototype);
b2ClipVertex.prototype.constructor = b2ClipVertex;
b2ClipVertex.prototype.__class__ = b2ClipVertex;
b2ClipVertex.__cache__ = {};
Module['b2ClipVertex'] = b2ClipVertex;

  b2ClipVertex.prototype['get_v'] = b2ClipVertex.prototype.get_v = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ClipVertex_get_v_0(self), b2Vec2);
};
    b2ClipVertex.prototype['set_v'] = b2ClipVertex.prototype.set_v = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ClipVertex_set_v_1(self, arg0);
};
    Object.defineProperty(b2ClipVertex.prototype, 'v', { get: b2ClipVertex.prototype.get_v, set: b2ClipVertex.prototype.set_v });
  b2ClipVertex.prototype['get_id'] = b2ClipVertex.prototype.get_id = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  return wrapPointer(_emscripten_bind_b2ClipVertex_get_id_0(self), b2ContactID);
};
    b2ClipVertex.prototype['set_id'] = b2ClipVertex.prototype.set_id = /** @suppress {undefinedVars, duplicate} @this{Object} */function(arg0) {
  var self = this.ptr;
  if (arg0 && typeof arg0 === 'object') arg0 = arg0.ptr;
  _emscripten_bind_b2ClipVertex_set_id_1(self, arg0);
};
    Object.defineProperty(b2ClipVertex.prototype, 'id', { get: b2ClipVertex.prototype.get_id, set: b2ClipVertex.prototype.set_id });
  b2ClipVertex.prototype['__destroy__'] = b2ClipVertex.prototype.__destroy__ = /** @suppress {undefinedVars, duplicate} @this{Object} */function() {
  var self = this.ptr;
  _emscripten_bind_b2ClipVertex___destroy___0(self);
};
(function() {
  function setupEnums() {
    

    // b2ShapeType

    Module['b2Shape']['e_circle'] = _emscripten_enum_b2ShapeType_e_circle();

    Module['b2Shape']['e_edge'] = _emscripten_enum_b2ShapeType_e_edge();

    Module['b2Shape']['e_polygon'] = _emscripten_enum_b2ShapeType_e_polygon();

    Module['b2Shape']['e_chain'] = _emscripten_enum_b2ShapeType_e_chain();

    Module['b2Shape']['e_typeCount'] = _emscripten_enum_b2ShapeType_e_typeCount();

    

    // b2BodyType

    Module['b2_staticBody'] = _emscripten_enum_b2BodyType_b2_staticBody();

    Module['b2_kinematicBody'] = _emscripten_enum_b2BodyType_b2_kinematicBody();

    Module['b2_dynamicBody'] = _emscripten_enum_b2BodyType_b2_dynamicBody();

    

    // b2JointType

    Module['e_unknownJoint'] = _emscripten_enum_b2JointType_e_unknownJoint();

    Module['e_revoluteJoint'] = _emscripten_enum_b2JointType_e_revoluteJoint();

    Module['e_prismaticJoint'] = _emscripten_enum_b2JointType_e_prismaticJoint();

    Module['e_distanceJoint'] = _emscripten_enum_b2JointType_e_distanceJoint();

    Module['e_pulleyJoint'] = _emscripten_enum_b2JointType_e_pulleyJoint();

    Module['e_mouseJoint'] = _emscripten_enum_b2JointType_e_mouseJoint();

    Module['e_gearJoint'] = _emscripten_enum_b2JointType_e_gearJoint();

    Module['e_wheelJoint'] = _emscripten_enum_b2JointType_e_wheelJoint();

    Module['e_weldJoint'] = _emscripten_enum_b2JointType_e_weldJoint();

    Module['e_frictionJoint'] = _emscripten_enum_b2JointType_e_frictionJoint();

    Module['e_ropeJoint'] = _emscripten_enum_b2JointType_e_ropeJoint();

    Module['e_motorJoint'] = _emscripten_enum_b2JointType_e_motorJoint();

    

    // b2ContactFeatureType

    Module['b2ContactFeature']['e_vertex'] = _emscripten_enum_b2ContactFeatureType_e_vertex();

    Module['b2ContactFeature']['e_face'] = _emscripten_enum_b2ContactFeatureType_e_face();

    

    // b2DrawFlag

    Module['b2Draw']['e_shapeBit'] = _emscripten_enum_b2DrawFlag_e_shapeBit();

    Module['b2Draw']['e_jointBit'] = _emscripten_enum_b2DrawFlag_e_jointBit();

    Module['b2Draw']['e_aabbBit'] = _emscripten_enum_b2DrawFlag_e_aabbBit();

    Module['b2Draw']['e_pairBit'] = _emscripten_enum_b2DrawFlag_e_pairBit();

    Module['b2Draw']['e_centerOfMassBit'] = _emscripten_enum_b2DrawFlag_e_centerOfMassBit();

    

    // b2ManifoldType

    Module['b2Manifold']['e_circles'] = _emscripten_enum_b2ManifoldType_e_circles();

    Module['b2Manifold']['e_faceA'] = _emscripten_enum_b2ManifoldType_e_faceA();

    Module['b2Manifold']['e_faceB'] = _emscripten_enum_b2ManifoldType_e_faceB();

    

    // b2PointState

    Module['b2_nullState'] = _emscripten_enum_b2PointState_b2_nullState();

    Module['b2_addState'] = _emscripten_enum_b2PointState_b2_addState();

    Module['b2_persistState'] = _emscripten_enum_b2PointState_b2_persistState();

    Module['b2_removeState'] = _emscripten_enum_b2PointState_b2_removeState();

    

    // b2StretchingModel

    Module['b2_pbdStretchingModel'] = _emscripten_enum_b2StretchingModel_b2_pbdStretchingModel();

    Module['b2_xpbdStretchingModel'] = _emscripten_enum_b2StretchingModel_b2_xpbdStretchingModel();

    

    // b2BendingModel

    Module['b2_springAngleBendingModel'] = _emscripten_enum_b2BendingModel_b2_springAngleBendingModel();

    Module['b2_pbdAngleBendingModel'] = _emscripten_enum_b2BendingModel_b2_pbdAngleBendingModel();

    Module['b2_xpbdAngleBendingModel'] = _emscripten_enum_b2BendingModel_b2_xpbdAngleBendingModel();

    Module['b2_pbdDistanceBendingModel'] = _emscripten_enum_b2BendingModel_b2_pbdDistanceBendingModel();

    Module['b2_pbdHeightBendingModel'] = _emscripten_enum_b2BendingModel_b2_pbdHeightBendingModel();

  }
  if (runtimeInitialized) setupEnums();
  else addOnInit(setupEnums);
})();
