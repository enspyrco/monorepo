/// Current Limitations
/// - Only one object of a certain type can be added/located
/// - The Locator is a currently singleton, but the object it creates allows
///   the service locator pattern.

/// add a service:
///   `Locator.add<ServiceType>(Service());`
/// locate a service:
///   `var service = locate<ServiceType>();`

/// A global variable for more readable calls eg. locate<Type>();
final locate = Locator.instance;

/// The singleton Locator class
class Locator {
  static final Locator _instance = Locator();
  static Locator get instance => _instance;

  static final Map<Type, Object> _objectOfType = {};

  T call<T>() {
    var object = _objectOfType[T] as T?;

    if (object == null) {
      throw 'You attempted to locate an object before it has been added.\n'
          'Make sure to call the `add` function before calling the Locator object.';
    }

    return object;
  }

  /// Creates an entry in the _objectOfType map.
  /// The object can now be located witout error.
  ///
  /// Setting `overwrite: false` will throw if an object has already been added
  /// for the given type.
  static void add<T>(Object object, {bool overwrite = true}) {
    if (!overwrite) {
      if (_objectOfType[T] != null) {
        throw 'You attempted to add an object with a type that has already been added.\n'
            'Consider using a collection of the given type.';
      }
    }

    _objectOfType[T] = object;
  }
}
