# identify_affected_packages

*A Dart CLI app to identify which packages need testing during CI.*

The app reads in the set of all packages (saved in .github/matrix.json), calls git diff via Process.run to get the paths of the changed files, checks those paths against the set of all packages and writes out an adjusted matrix.json so that the tests still run in parallel.
