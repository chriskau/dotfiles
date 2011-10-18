#use git autocompletion for inner commands
completion=~/.dotfiles/zsh/functions/git-completion.bash

if test -f $completion
then
	source $completion
fi
