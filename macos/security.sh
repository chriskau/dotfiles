#!/bin/sh

echo "Starting security hardening..."

# Secure Home Folder Permissions
# Ensures other local users cannot traverse your home directory.
chmod -R go-rx ~

# Secure Shared Folder Permissions
# Prevents other users from seeing what is in the /Users/Shared directory.
chmod -R go-rx /Users/Shared

# Enable Application Layer Firewall (ALF)
# Sets the firewall to 'On' and blocks all incoming non-essential connections.
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Reduce Sudo Timeout
# By default, sudo stays authenticated for 5 minutes. This reduces it to 0,
# requiring a password for every sudo command (increase to 1 or 2 if preferred).
if ! grep -q "timestamp_timeout" /etc/sudoers; then
    echo "Defaults timestamp_timeout=0" | sudo tee -a /etc/sudoers > /dev/null
fi

# Disable Captive Portal Detection (Privacy)
# Prevents the Mac from automatically pinging Apple's servers when joining Wi-Fi.
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Ensure Gatekeeper is Enabled
# Re-arms Gatekeeper to ensure only signed/notarized apps can run.
sudo spctl --master-enable

# Metadata Privacy
# Disables the creation of .DS_Store files on network and USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Require password after 23 hours; Touch ID works within that window
sudo bioutil -ws -o 82800

# Lock screen immediately on sleep/screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable remote login (SSH in)
# Closes the SSH attack surface; re-enable with: sudo systemsetup -setremotelogin on
sudo systemsetup -setremotelogin off

# Disable remote Apple Events
# Prevents remote apps from sending Apple Events to this machine (e.g. via AppleScript over network)
sudo systemsetup -setremoteappleevents off

# Disable wake-on-network
# Prevents the machine from waking in response to network traffic, reducing remote attack surface
sudo pmset -a womp 0

# Enable firewall logging
# Records blocked/allowed connections for later incident review
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# Disable Spotlight Suggestions
# Stops Spotlight from sending search queries to Apple servers
defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true

# Disable Siri analytics sharing
defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2

# Disable crash reporter dialogs
# Crash data is still written locally but no dialog or Apple upload
defaults write com.apple.CrashReporter DialogType none

# Secure keyboard entry in Terminal
# Blocks other processes from reading keystrokes while Terminal is focused
defaults write -app Terminal SecureKeyboardEntry -bool true

# Disable AirDrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true

# Warn if FileVault is not enabled (cannot enable non-interactively)
if ! fdesetup status | grep -q "FileVault is On"; then
    echo "WARNING: FileVault is not enabled. Enable it in System Settings > Privacy & Security."
fi

# Check SIP status (can only be changed from Recovery Mode)
if ! csrutil status | grep -q "enabled"; then
    echo "WARNING: System Integrity Protection is disabled. Re-enable it from Recovery Mode."
fi

echo "Hardening complete. Some changes may require a logout or restart."
