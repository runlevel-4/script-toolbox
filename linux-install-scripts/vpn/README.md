# What this does

1. This script will check for `OpenVPN` and if it is installed, pull from the `Riseup VPN` API to get a private key, cert, and ca cert.
2. It will then build a OpenVPN config file (riseup.ovpn) and launch OpenVPN using the config file with `sudo openvpn --config riseup.ovpn`
