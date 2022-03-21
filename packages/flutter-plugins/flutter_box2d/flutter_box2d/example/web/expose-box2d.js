import Box2DFactory from './Box2D.js';
window.Box2DFactory = Box2DFactory;
Box2DFactory().then(box2D => {
  // finished downloading Box2D.wasm
  const {
    b2BodyDef, b2_dynamicBody, b2PolygonShape, b2Vec2, b2World
  } = box2D;
  window.b2BodyDef = b2BodyDef; 
  window.b2_dynamicBody = b2_dynamicBody 
  window.b2PolygonShape = b2PolygonShape;
  window.b2Vec2 = b2Vec2;
  window.b2World = b2World;

  console.log(box2D);
});