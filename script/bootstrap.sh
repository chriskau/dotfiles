# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils


# Binaries
binaries=(
  awscli
  chkrootkit
  fasd
  git
  htop
  httpie
  jq
  lynis
  msmtp
  mutt
#  muttqt
  node
  notmuch
  offline-imap
  sshguard
  sqlite
  tmux
  urlview
  vim
  wget
  youtube-dl
  zsh
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup


# Apps
brew install caskroom/cask/brew-cask

apps=(
    adium
    alfred
    arq
    bartender
    base
#    calca
    dhs
    framer
    gitup
    google-chrome
    kaleidoscope
    little-snitch
    lockdown
#    numi
    oryoki
    oversight
    ransomwhere
    sketch
    slack
    spotify
    things
    transmit
    visual-studio-code
#    vox
    zeplin
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
