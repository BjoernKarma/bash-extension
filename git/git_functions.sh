# -------------
# git Functions
# -------------

# Finds directories with the name .git based on the current directory with a maximum search depth of 5 levels
# Removes the .git from the result to get the parent directory
# For each result, it prints the name of the directory, executes git pull and adds an empty line as separator for the output
alias gitPull='find . -maxdepth 5 -type d -name .git | sed "s/\/.git//" | xargs -P3 -I{} bash -c "echo {} && git -C {} pull && echo """;'

# Starts a recursive git pull on all git repositories based on the input directory.
# This function uses the input directory as base path and recursively executes a git pull in all sub directories that contain a .git folder.
function recursiveGitPull() {
	basePath=$1
	echo "Do a recursive git pull on $1"
	cd $1
	gitPull
	echo "Done with recursive git pull"
}

# Starts a recursive git pull on all git repositories defined in the config file.
# This function uses the directories from the config file `.gitrepos` that is located in the home directory. 
function recursiveGitPullAll() {
	gitRepoConfigFile=${HOME}/.gitrepos
	if [ ! -f $gitRepoConfigFile ]; then
		echo "$gitRepoConfigFile is required, but absent. "
		echo "Please create the file and add the base paths of the git repositories that you want to pull."
	else
		while read path; do
		recursiveGitPull "${path//[$'\t\r\n ']}"
		done < $gitRepoConfigFile
	fi
}

alias gitPullAll='recursiveGitPullAll'