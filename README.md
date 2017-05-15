# git-repos
A git plugin to iterate over multiple git repositories and quick directory switcher

# Installation

Place `git-repos` somewhere in you path, such as /usr/local/bin.

`cr.sh` needs to be sourced to add the `cr` command and auto-completer; you can
do this in your .bashrc or place it somewhere that will source it automatically,
such as /usr/local/etc/bash_completion.d/.


# Usage

You must set an environment variable to inform git-repos of where you store your
repositories. For example:

```
export GITREPOS_PATH=${HOME}/my_git_dir:${HOME}/my_other_git_dir
```

`git-repos` adds the `repos` command to git which can be usage to list all your
repos or iterrate over them, running a command in each. Run `git help repos` for
more information.

`cr` is a quick directory switcher with tab completion of repository names to
allow quickly changing into a repository directory without needing to type in
the entire path -- or even the entire repository name. You must source `cr.sh`
to acquire this command.
