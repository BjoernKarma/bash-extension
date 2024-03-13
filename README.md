# bash-extension
Scripts for the bash

## git functions

The script `git_functions.sh` provides additional functions for git that allow running a recursive git pull on all git directories beneath a base path.

### Install

If you want to use the scripts in every bash instance, you can add `git_functions.sh` to your `.bashrc` (adjust the path to the script if necessary):

```bash
test -f ~/git_functions.sh && . ~/git_functions.sh
```

### Configure

If you want to use the config file, you need to create a file called `.gitrepos` in your home directory:

`touch ~/.gitrepos`

You can then add the directories you want to use as search paths for git repositories. For example:

```
C://dev//awesome-project/
C://dev//another-awesome-project/

```

Please add an empty line at the end.

### Usage: gitPull

Runs a `git pull` on all git directories based on the current directory with a maximum search depth of 5 levels.

### Usage: gitPullAll

Runs a `git pull` on all git directories based on the repositories defined in the config file with a maximum search depth of 5 levels.

