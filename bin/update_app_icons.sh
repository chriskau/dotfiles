#!/bin/bash

sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;

sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;

sudo rm -rf /Library/Caches/com.apple.iconservices.store
