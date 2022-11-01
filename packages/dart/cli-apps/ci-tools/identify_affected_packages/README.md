# identify_affected_packages

*A Dart script that identifies which packages need testing during CI.*

The script will:

- read in the set of all packages, saved in `.github/matrix.json`
- call `git diff` via `Process.run` to get the paths of changed files
- check paths of changed files against the set of all packages
- write out an adjusted `matrix.json` with only affected packages

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

## Testing locally

- Open the project folder with VS Code (so .vscode is at the top level)
- Run the "identify_affected_packages" launch.config
- Observe the output in the Debug Console

> Note: this will save over the .github/matrix.json file in the monorepo so remember
> not to commit the change.
