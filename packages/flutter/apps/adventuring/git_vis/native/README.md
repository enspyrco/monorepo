# git_vis > native

The `CMakeLists.txt` defines libgit2 as a subdirectory so we can compile both
libgit2 and our glue code.

## Defining terms

### glue code

There are times when using libgit2 requires writing extra C glue code, eg:

- `git_tree_walk` takes a [git_treewalk_cb](https://libgit2.org/libgit2/#HEAD/group/callback/git_treewalk_cb) so we need to define the callback in C
