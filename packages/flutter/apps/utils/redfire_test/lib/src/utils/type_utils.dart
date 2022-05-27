/// find.byType doesn't find generic types
/// see: https://github.com/flutter/flutter/issues/58876
/// How to get generic Type?
/// see: https://stackoverflow.com/a/52891829/1992736
Type typeOf<T>() => T;
