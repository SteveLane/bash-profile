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
