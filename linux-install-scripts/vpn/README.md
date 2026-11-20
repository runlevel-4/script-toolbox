# Riseup VPN Config Script

A shell script that connects to the [Riseup VPN](https://riseup.net/en/vpn) using OpenVPN.

## Prerequisites

- Linux
- `sudo` privileges
- `openvpn`
- `jq`

Install the required tools:

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install openvpn jq
```

### Arch
```bash
sudo pacman -Syu
sudo pacman -S openvpn jq
```

### Fedora/RHEL
```bash
sudo dnf update
sudo dnf install openvpn jq
```

## Usage

```bash
chmod +x riseup_vpn_automation.sh
sh riseup_vpn_automation.sh
```

The script checks for OpenVPN and jq before attempting to configure and start the VPN connection.

## Configuration

Describe any required environment variables, credentials, or config files here. If the script prompts for input, document those prompts and their purpose.

## Troubleshooting

- If OpenVPN or jq is missing, install both prerequisites and retry.
- If the connection fails, run the script from a terminal and inspect OpenVPN's output.
- Verify that required Riseup VPN credentials or certificates are valid.
- Ensure the script is being run by a user with sufficient privileges.

## Disconnect
`sudo pkill openvpn` or `CTRL + C`
