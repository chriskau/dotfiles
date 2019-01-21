alias reload!='. ~/.zshrc'

# global aliases
alias -g ...='../..'

# suffix aliases
# alias -s js=vim
alias -s txt=vim
alias -s log="less -MN"
alias -s db="open -a /Applications/Base.app/Contents/MacOS/Base"
alias -s md="open -a '/Applications/iA Writer.app/Contents/MacOS/iA Writer'"

# general aliases
alias am="open -a 'Activity Monitor'"
alias cls="clear"
alias con="tail -40 -f /var/log/system.log"
alias dl='chdiff --local-scm'
alias ducks='du -ksh * |sort -rn |head -11'
alias ll="ls -lahL"
alias ll@="ls -la@"
alias llt="ls -lahLt"
alias lsregister="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
alias lt="date"
alias p="ps ax|grep"
alias pbs="/System/Library/CoreServices/pbs"
alias rmds='find . -name .DS_Store -delete'
alias rmo='find . -name *.orig -delete'

# Quick way to rebuild the Launch Services database and get rid of duplicates in the Open With submenu
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
