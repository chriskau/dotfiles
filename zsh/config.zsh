# initialise colours
autoload -U colors
colors

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export GREP_COLOR=32    # some greps have colorized ouput. enable...
export GREPCOLOR=32     # ditto here

autoload -U compinit promptinit
compinit
promptinit

autoload -U zmv         # for massive renames

# autoload zsh functions
fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)

# history options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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
setopt HIST_SAVE_NO_DUPS

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
