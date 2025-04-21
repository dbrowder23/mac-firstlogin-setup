#!/bin/zsh

echo "[*] Starting macOS setup script..."

# Step 1: Prompt to install Homebrew (user-approved)
if ! command -v brew >/dev/null 2>&1; then
  echo "[!] Homebrew is not installed."

  osascript -e 'display dialog "Homebrew is not installed. Would you like to install it now?" buttons {"Cancel", "Install"} default button "Install"' > /dev/null

  if [[ $? -eq 0 ]]; then
    echo "[*] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "[!] Skipped Homebrew installation."
  fi
else
  echo "[✓] Homebrew already installed."
fi

# Step 2: Ensure Homebrew is in PATH
if ! grep -q 'brew shellenv' ~/.zshrc; then
  echo "[*] Adding Homebrew to PATH in .zshrc..."
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
fi

# Step 3: Restore Launchpad layout if available
if [[ -x "$HOME/bin/restore-launchpad-interactive.sh" ]]; then
  echo "[*] Restoring Launchpad layout..."
  sudo "$HOME/bin/restore-launchpad-interactive.sh"
else
  echo "[!] Launchpad restore script not found or not executable."
fi

# Step 4: Optionally install default packages
read "INSTALL_PKGS?Install default packages (nano, git, wget)? [y/N]: "
if [[ "$INSTALL_PKGS" == [yY] ]]; then
  brew install nano git wget
fi

# Step 5: Clean up LaunchAgent so it doesn't re-run
launchctl bootout gui/$(id -u) "$HOME/Library/LaunchAgents/com.user.firstlogin.setup.plist"
rm "$HOME/Library/LaunchAgents/com.user.firstlogin.setup.plist"

echo "[✓] Setup script complete. LaunchAgent removed."
