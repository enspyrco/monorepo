# flutter_box2d plugin

This is a folder containing the packages that make up the `flutter_box2d` plugin.

## Development

### Cache busting (iOS/macOS)

During development, while using the example project to test changes, it
can be useful to clean and delete all the potentially cached pods stuff
so any changes to the build or the C/C++ code isn't cached away and we
get a shiny clean build that includes our most recent changes.

To this end, there are launch configs, eg. "example [macos with deep_clean]"
that perform a `flutter clean` and a `pod deintegrate` before running the
example app on the given platform. This will be a much longer build and is
probbaly only useful when making changes that could potentially get cached
by cocoapods.
