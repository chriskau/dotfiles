# initialise colours
autoload -U colors
colors

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export GREP_COLOR=32    # some greps have colorized ouput. enable...
export GREPCOLOR=32     # dito here


autoload -U compinit promptinit
compinit
promptinit

autoload -U zmv         # for massive renames

# autoload zsh functions
fpath=($ZSH/zsh/functions $fpath)

autoload -U $ZSH/zsh/functions/*(:t)

# history options
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS
setopt NO_HIST_BEEP
setopt SHARE_HISTORY

# input/output
setopt CORRECT

setopt autocd

# allow for functions in the prompt
setopt PROMPT_SUBST

setopt COMPLETE_ALIASES

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char


# show full history or search history
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

#mkdir, cd into it
function mkcd {
	mkdir -p "$*"
	cd "$*"
}

# open man page in Preview
pman () {
	man -t "${1}" | open -f -a /Applications/Preview.app
}

# open Mail.app with specified file as attachement
mf () {
	open "${1}" -a Mail.app
}

# print all commit messages since commit/tag
notes() {
	if [ -n "$1" ]; then
		git log "${1}.." --pretty='%s %b' --abbrev-commit
	else
		echo "error: missing version or SHA"
	fi
}

# git interactive rebase
gri() {
	if [ -n "$1" ]; then
		git rebase -i "HEAD~${1}"
	fi
}

# git log nicely formatted
gl() {
	if [ -n "$1" ]; then
		git log "${1}" --pretty=format:'%Cred%h%Creset -%Creset %s %Cblue(%cr)%Creset %Cgreen(%an)%Creset' --abbrev-commit --date=relative
	else
		git lg
	fi
}

# drop stash
gsd() {
	if [ -n "$1" ]; then
		git stash drop stash@{$1}
	else
		git stash drop stash@{0}
	fi
}

# show stash
gss() {
	if [ -n "$1" ]; then
		git stash show stash@{$1}
	else
		git stash show stash@{0}
	fi
}

# show stash in patch form
gssp() {
	if [ -n "$1" ]; then
		git stash show -p stash@{$1}
	else
		git stash show -p stash@{0}
	fi
}

