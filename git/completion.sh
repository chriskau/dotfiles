#use git autocompletion for inner commands

completion='$(brew --prefix)/share/zsh/site-functions/_git'

if test -f $completion
then
	source $completion
fi
