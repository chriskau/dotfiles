#use git autocompletion for inner commands
completion=~/.dotfiles/git/git-completion.bash

if test -f $completion
then
	source $completion
fi
