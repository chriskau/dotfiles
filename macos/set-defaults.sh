#!/bin/sh

# Set computer name (as done via System Preferences → Sharing)
scutil --set ComputerName "musashi"
scutil --set HostName "musashi"
scutil --set LocalHostName "musashi"

# Disable Liquid Glass (Solarium) effects for a flatter, faster UI
# This replaces the old Menu Bar transparency toggle
defaults write -g com.apple.SwiftUI.DisableSolarium -bool YES

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# --- Trackpad & Keyboard ---
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Blazingly fast keyboard repeat rate
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# --- Screen & Screenshots ---
# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to Desktop in PNG without shadow
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# --- Finder ---
# Show all filename extensions and hidden files
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Display full POSIX path in Finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep .DS_Store off network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# --- Dock ---
# Set icon size and autohide behavior
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# --- Safari ---
# Hide Safari's bookmark bar.
defaults write com.apple.Safari.plist ShowFavoritesBar -bool false

# Always show Safari's "URL display" tab in the lower left on mouseover.
defaults write com.apple.Safari ShowOverlayStatusBar -bool true

# Set up Safari for development.
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari.plist IncludeDevelopMenu -bool true
defaults write com.apple.Safari.plist WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari.plist "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# --- Security ---
# Set the auto log out delay to 10 mins
defaults write /Library/Preferences/.GlobalPreferences com.apple.autologout.AutoLogOutDelay -int 600

# Kill affected applications to apply changes
for app in Finder Dock SystemUIServer; do
	killall "$app" > /dev/null 2>&1
done
