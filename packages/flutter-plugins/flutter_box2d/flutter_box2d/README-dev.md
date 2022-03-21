# flutter_box2d dev notes

## Notes on architecture

### covariant

We use the covariant keyword to allow the classes subtype to tighten the type of
the parameter, in this case allowing (eg.) B2Vec2JSImpl to be passed in to
the overridden set_position
see: <https://dart.dev/guides/language/sound-problems#the-covariant-keyword>

