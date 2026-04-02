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

echo "Hardening complete. Some changes may require a logout or restart."
