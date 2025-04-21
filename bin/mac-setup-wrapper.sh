#!/bin/zsh

if [[ -f /var/db/.AppleSetupDone ]]; then
  echo "[*] Setup Assistant completed. Running setup script..."
  "$HOME/bin/mac-setup.sh"
else
  echo "[!] Setup Assistant not finished. Skipping setup script."
fi
