# Riseup VPN Config Script

A shell script that connects to the [Riseup VPN](https://riseup.net/en/vpn) using OpenVPN.

## Prerequisites

- Linux
- `openvpn`
- `jq`
- A Riseup account
- Root or `sudo` privileges

Install the required tools on Debian/Ubuntu:

```bash
sudo apt update
sudo apt install openvpn jq
```

## Usage

From the repository root:

```bash
chmod +x riseup_vpn_automation.sh
sudo ./riseup_vpn_automation.sh
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
