# Obsidian Linux Installer

An automated installer that downloads the latest official Obsidian release and installs it on Linux.

## Prerequisites

- Linux
- `curl` or `wget`
- `sudo` privileges

## Installation

```bash
git clone https://github.com/runlevel-4/script-toolbox
cd script-toolbox/linux-install-scripts/obsidian
sh install_obsidian_void_linux.sh
```

The script downloads the appropriate package for Obsidian and adds a desktop entry for easy launching.

## Uninstallation

`sudo sh uninstall_obsidian_void_linux.sh`

## Troubleshooting

- **Download fails:** verify network access and that `curl` or `wget` is installed.
- **Cannot start Obsidian:** restart the session or run `obsidian` from a terminal.
- **Installation permission denied:** run the script with sufficient privileges.
