#!/bin/sh

# Secure Users' Home Folder Permissions
chmod go-rx ~
chmod go-rx /Users/Guest


# disable Unnecessary Services
launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.RemoteDesktop.PrivilegeProxy.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.racoon.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist
launchctl unload -w /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist
launchctl unload -w /System/Library/LaunchDaemons/org.postfix.master.plist

# disable remote desktop
launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist

# disable notification center
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist


# disable Setuid and Setguid Binaries
chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent
chmod ug-s /System/Library/Printers/IOMs/LPRIOM.plugin/Contents/MacOS/LPRIOMHelper
#/System/Library/PrivateFrameworks/Admin.framework/Versions/A/Resources/readconfig
#/System/Library/PrivateFrameworks/Install.framework/Versions/A/Resources/runner

chmod ug-s /sbin/mount_nfs

chmod ug-s /usr/bin/at
chmod ug-s /usr/bin/atq
chmod ug-s /usr/bin/atrm
chmod ug-s /usr/bin/batch
chmod ug-s /usr/bin/chpass
chmod ug-s /usr/bin/crontab
chmod ug-s /usr/bin/ipcs
chmod ug-s /usr/bin/newgrp
chmod ug-s /usr/bin/procmail
chmod ug-s /usr/bin/wall
chmod ug-s /usr/bin/write
chmod ug-s /bin/rcp
chmod ug-s /usr/bin/rlogin
chmod ug-s /usr/bin/rsh
chmod ug-s /usr/lib/sa/sadc

chmod ug-s /usr/sbin/postdrop
chmod ug-s /usr/sbin/postqueue
chmod ug-s /usr/sbin/scselect
chmod ug-s /usr/sbin/traceroute
chmod ug-s /usr/sbin/traceroute6


# disable Bonjour
# defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"

# disable SafeSleep/Hibernate
# pmset hibernatemode 0
# rm -rf /var/vm/sleepimage

# disable AutoPowerOff
# pmset -a autopoweroff 0

# disable sudden motion sensor
# sudo pmset -a sms 0

# update sysctl settings
cat sysctl.conf >> /etc/sysctl.conf

# restart sysctl
sysctl -w
