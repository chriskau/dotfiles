alias reload!='. ~/.zshrc'

# global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# suffix aliases
alias -s js=vim
alias -s txt=vim
alias -s rb=vim
alias -s log="less -MN"
alias -s db="open -a /Applications/Base.app/Contents/MacOS/Base"
alias -s md="open -a '/Applications/iA Writer.app/Contents/MacOS/iA Writer'"

# general aliases
alias ax="axel -a"
alias am="open -a 'Activity Monitor'"
alias con="tail -40 -f /var/log/system.log"
alias dl='chdiff --local-scm'
alias ducks='du -ksh * |sort -rn |head -11'
alias hist="history"
alias ll="ls -lahL"
alias ll@="ls -la@"
alias llt="ls -lahLt"
alias lsregister="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
alias lt="date"
alias p="ps ax|grep"
alias pbs="/System/Library/CoreServices/pbs"
alias pbztar='tar --use-compress-prog=pbzip2'
alias rmds='find . -name .DS_Store -delete'
alias rmo='find . -name *.orig -delete'

# git aliases
alias b="git blame"
alias bl="git blame -L"
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gai="git add -i"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch -a"
alias gbr="git branch -r"
alias gca="git commit --amend"
alias gcim="git commit -m"
alias gcoh="git checkout HEAD"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdt="git difftool"
alias gi="gity"
alias gf="git fetch -v"
alias gll="git log"
alias gmt="git mergetool"
alias go="git checkout"
alias gp="git pull origin"
alias gpa="g format-patch --attach -1 -o ~/Desktop/Patches"
alias gpam="gpa | xargs open -a Mail.app"
alias gpom="git push origin master"
alias gpr="git pull --rebase origin"
alias gt="git status"
alias grh="git reset --hard"
alias grh1="git reset --hard HEAD^"
alias grs="git reset --soft"
alias gs="git show"
alias gse="git send-email"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gsr="git svn rebase"
alias gw="git wc"

alias tmux="TERM=screen-256color-bce tmux"

# Quick way to rebuild the Launch Services database and get rid of duplicates in the Open With submenu
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

