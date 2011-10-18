defaults write com.apple.Safari WebKitShowsURLsInToolTips -boolean yes
defaults write com.apple.Safari IncludeInternalDebugMenu -boolean yes
defaults write com.apple.Safari IncludeDebugMenu -boolean yes
defaults write com.apple.mail AllowArrowKeyMainWindowFocusChange 1
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
defaults write com.apple.finder ShowSidebar 0
defaults write com.apple.dock no-glass -boolean YES
defaults write com.apple.Finder QLEnableXRayFolders 1
defaults write com.apple.dock use-new-list-stack -bool YES


# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
# and then run 'killall Dock'

# Show the ~/Library folder
chflags nohidden ~/Library

# Use AirDrop over every interface
defaults write -g com.apple.NetworkBrowser BrowseAllInterfaces 1

# Finder always opens in List view
defaults write com.apple.Finder.FXPreferredViewStyle Nlsv

