# The Ubiquitous Language

## AppState

- dependencies: Set<Dependency>
- packages: Set<Package>

For convenience there are two different structures holding the set of dependencies:

- `dependencies` is the set of all dependencies
- `packages`, in aggregate, holds the same set of dependencies

## Package

- name = the name of the package
- location = the path to where the package is stored locally
- dependencies = the set of Dependency objects that belong to this package

We keep the location so we can save the packages metadata somewhere and easily
reload the dependency graph by parsing the relevant pubspec files.

## Dependency

name = the name of the dependency
package = the package this dependency belongs to
version = the version constraint for this dependency as described in the pubspec
type = the type of dependency (regular, dev, etc.)
