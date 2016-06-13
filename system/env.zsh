# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  export EDITOR='vim'
fi

# opt out of homebrew analytics
export HOMEBREW_NO_ANALYTICS=1
