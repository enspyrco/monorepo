import Box2DFactory from './Box2D.js';
window.Box2DFactory = Box2DFactory;
Box2DFactory().then(box2D => {
  // Finished downloading Box2D.wasm, now we add classes on to window
  // to expose them to the rest of the JS.
  const {
    b2BodyDef, b2CircleShape, b2PolygonShape, b2Vec2, b2World
  } = box2D;
  window.b2BodyDef = b2BodyDef;
  window.b2CircleShape = b2CircleShape;
  window.b2PolygonShape = b2PolygonShape;
  window.b2Vec2 = b2Vec2;
  window.b2World = b2World;

  // console.log(box2D);
});