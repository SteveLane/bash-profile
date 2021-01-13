#!/bin/bash
# First make my own readlink function that should be portable
# (Looking at you mac os...)
function myreadlink() {
    (
	cd $(dirname $1)         # or  cd ${1%/*}
	echo $PWD/$(basename $1) # or  echo $PWD/${1##*/}
    )
}
ln -s $(myreadlink .bash_profile) ~/.bash_profile
ln -s $(myreadlink .git-prompt.sh) ~/.git-prompt.sh
ln -s $(myreadlink .git-completion.bash) ~/.git-completion.bash
# Loop in my user scripts (make them executable, so new function)
function myscripts() {
    (
	# Change to script directory
	cd $(dirname $1)
	# Make script executable
	chmod u+x $(basename $1)
	# Copy out full path to script
	echo $PWD/$(basename $1)
    )
}
# ln -s $(myscripts scripts/docker-cleanup.sh) /usr/local/bin/docker-cleanup
# ln -s $(myscripts scripts/reviewer-responses.sh) \
#    /usr/local/bin/reviewer-responses
