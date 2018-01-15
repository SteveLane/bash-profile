# Nice git completion stuff
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\e[1;32m\w\e[1;31m$(__git_ps1 " (%s)")\e[0m\n🔥 '
# For (oracle) java through brew
export JAVA_HOME=$(/usr/libexec/java_home -v 9)
export PATH=$JAVA_HOME/bin:$PATH
# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# aliases
# list with:
# h: human readable file sizes
# G: coloured output
# F: / after directories (+ others)
# l: list in long format
alias lc='ls -hGFl'
