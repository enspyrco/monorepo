# identify_affected_packages

*A Dart CLI app to identify which packages need testing during CI.*

The app reads in the set of all packages (saved in .github/matrix.json), calls
git diff via Process.run to get the paths of the changed files, checks those
paths against the set of all packages and writes out an adjusted matrix.json
so that the tests still run in parallel.

## Compiling for CI

We have a workflow (`.github/workflows/compile_identify_affected_packages.yaml`)
that compiles this Dart CLI app for use as a CI script. We compile so that the CI
doesn't need to have Dart installed to run the script.

The workflow compiles on a Linux runner (which is x86_64 architecture)
as the identify_affected_packages script will also be run in a Linux runner.

### Steps for updating the script

1. Create a new branch named `__compile__identify_affected_packages`

    > The branch name must be exactly that or the workflow will not trigger

2. Push branch to the remote
3. Make the changes you want
4. Push changes to remote branch

    > Each push will trigger a GitHub Action that compiles the script then commits and
    > pushes the new script to the __compile__identify_affected_packages branch

5. Pull down the change made by CI (ie. the updated script)
6. PR the branch on to main
