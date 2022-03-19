# flutter_box2d_platform_interface

This interface allows platform-specific implementations of the flutter_box2d plugin, as well as the plugin itself, to ensure they are supporting the same interface.

## Usage

To implement a new platform-specific implementation of flutter_box2d, extend FlutterBox2DPlatform with an implementation that performs the platform-specific behavior, and when you register your plugin, set the default FlutterBox2DPlatform by calling FlutterBox2DPlatform.instance = MyFlutterBox2DPlatform().

## Note on breaking changes

Strongly prefer non-breaking changes (such as adding a method to the interface) over breaking changes for this package.

See <https://flutter.dev/go/platform-interface-breaking-changes> for a discussion on why a less-clean interface is preferable to a breaking change.
