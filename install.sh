#!/bin/bash

echo "[*] Installing mac-firstlogin setup files..."

mkdir -p ~/bin
mkdir -p ~/Library/LaunchAgents

cp -f bin/* ~/bin/
cp -f Library/LaunchAgents/* ~/Library/LaunchAgents/

chmod +x ~/bin/mac-setup.sh
chmod +x ~/bin/mac-setup-wrapper.sh

launchctl load ~/Library/LaunchAgents/com.user.firstlogin.setup.plist

echo "[✓] Setup files installed and LaunchAgent loaded."
