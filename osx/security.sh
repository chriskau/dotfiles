# Secure Users' Home Folder Permissions
sudo chmod go-rx /Users/chris
sudo chmod go-rx /Users/Guest
sudo chmod go-rx /Users/Shared


# Disable Unnecessary Services
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.com.apple.RemoteDesktop.PrivilegeProxy.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.racoon.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/org.postfix.master.plist

sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist


# Disable Setuid and Setguid Binaries
sudo chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent
sudo chmod ug-s /System/Library/Printers/IOMs/LPRIOM.plugin/Contents/MacOS/LPRIOMHelper
# /System/Library/PrivateFrameworks/Admin.framework/Versions/A/Resources/readconfig
# /System/Library/PrivateFrameworks/Install.framework/Versions/A/Resources/runner

sudo chmod ug-s /sbin/mount_nfs

sudo chmod ug-s /usr/bin/at
sudo chmod ug-s /usr/bin/atq
sudo chmod ug-s /usr/bin/atrm
sudo chmod ug-s /usr/bin/batch
sudo chmod ug-s /usr/bin/chpass
sudo chmod ug-s /usr/bin/crontab
sudo chmod ug-s /usr/bin/ipcs
sudo chmod ug-s /usr/bin/newgrp
sudo chmod ug-s /usr/bin/procmail
sudo chmod ug-s /usr/bin/wall
sudo chmod ug-s /usr/bin/write
sudo chmod ug-s /bin/rcp
sudo chmod ug-s /usr/bin/rlogin
sudo chmod ug-s /usr/bin/rsh
sudo chmod ug-s /usr/lib/sa/sadc

sudo chmod ug-s /usr/sbin/postdrop
sudo chmod ug-s /usr/sbin/postqueue
sudo chmod ug-s /usr/sbin/scselect
sudo chmod ug-s /usr/sbin/traceroute
sudo chmod ug-s /usr/sbin/traceroute6


# Disable Bonjour
sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"

