# mac-firstlogin-setup

A one-time setup script that runs after initial login or Migration Assistant. It:

- Installs [Homebrew](https://brew.sh) (optional)
- Adds Homebrew to your `$PATH`
- Restores your Launchpad layout from a backup script
- Optionally installs default command-line tools
- Removes itself after first run

## 🔧 Installation

### Option 1: Clone the repo

```bash
git clone https://github.com/yourusername/mac-firstlogin-setup.git ~/mac-setup
cd ~/mac-setup
chmod +x install.sh
./install.sh
```

### Option 2: Download ZIP

- Download the ZIP from GitHub
- Unzip it to `~/mac-setup`
- Then run:

```bash
cd ~/mac-setup
chmod +x install.sh
./install.sh
```

## 🛠 Contents

| File | Purpose |
|------|---------|
| `bin/mac-setup.sh` | Main setup logic |
| `bin/mac-setup-wrapper.sh` | Ensures script runs only after Setup Assistant |
| `Library/LaunchAgents/com.user.firstlogin.setup.plist` | Launches the setup script once on login |
| `install.sh` | Moves everything into place |

## ✅ Why This Works

- All files live inside your home folder
- No admin or Gatekeeper bypass needed
- Compatible with Migration Assistant
- No system-wide changes or elevated access required

