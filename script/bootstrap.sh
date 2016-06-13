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

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep


# Binaries
binaries=(
  fasd
  git
  httpie
  jq
  lynis
  msmtp
  mutt
  muttqt
  node
  notmuch
  offline-imap
  rethinkdb
  sshguard
  tmux
  urlview
  vim
  wget
  youtube-dl
  zsh
)

echo "installing binaries..."
brew install ${binaries[@]}

# install swiftenv
brew install kylef/formulae/swiftenv

brew cleanup


# Apps
brew install caskroom/cask/brew-cask

apps=(
    adium
    alfred
    bartender
    base
    # blocs
    cactus
    # Calca
    cloak
    framer-studio
    gitup
    google-chrome
    # iA Writer ???
    kaleidoscope
    numi
    paw
    # Quartz Composer
    seil
    sketch
    skype
    slack
    # Spectrum
    spotify
    things
    transmit
    vagrant
    visual-studio-code
    vox
    # Xcode
    # Xcode-beta
    xscope  
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
