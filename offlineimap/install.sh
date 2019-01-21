#!/bin/sh

cp -R com.chriskau.offlineimap.plist ~/Library/LaunchAgents/

brew services start offlineimap
