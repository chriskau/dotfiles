# secure Home folder
sudo chmod go-rx /Users/chris/

# disable unnecessary services
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist #Bluetooth
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist #NIS
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.com.apple.RemoteDesktop.PrivilegeProxy.plist #Remote Desktop
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist

# com.apple.racoon.plist #VPN
# com.apple.UserNotificationCenter.plist #User notifications
# com.apple.webdavfs_load_kext.plist #WebDAV
# org.postfix.master.plist

sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist


# disable setuid and setguid binaries
sudo chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent
sudo chmod ug-s /System/Library/Printers/IOMs/LPRIOM.plugin/Contents/MacOS/LPRIOMHelper
sudo chmod ug-s /sbin/mount_nfs
sudo chmod ug-s /usr/bin/at
sudo chmod ug-s /usr/bin/atq
sudo chmod ug-s /usr/bin/atrm
sudo chmod ug-s /usr/bin/chpass
sudo chmod ug-s /usr/bin/crontab
sudo chmod ug-s /usr/bin/ipcs
sudo chmod ug-s /usr/bin/newgrp
sudo chmod ug-s /usr/sbin/postdrop
sudo chmod ug-s /usr/sbin/postqueue
sudo chmod ug-s /usr/bin/procmail
sudo chmod ug-s /usr/bin/wall
sudo chmod ug-s /usr/bin/write
sudo chmod ug-s /bin/rcp
sudo chmod ug-s /usr/bin/rlogi
sudo chmod ug-s /usr/bin/rsh
sudo chmod ug-s /usr/lib/sa/sad
sudo chmod ug-s /usr/sbin/scselect
sudo chmod ug-s /usr/sbin/traceroute
sudo chmod ug-s /usr/sbin/traceroute6

# disable Bonjour
# sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"

