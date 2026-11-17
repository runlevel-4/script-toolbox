# get RiseupVPN keys and certs
curl -Os https://api.black.riseup.net/3/cert
curl -Os https://black.riseup.net/ca.crt

# get RiseupVPN JSON file
curl -Os https://api.black.riseup.net/3/config/eip-service.json

# initialize the riseup.ovpn config file
printf 'client\ndev tun\nproto tcp\nnobind\nremote-random\npersist-key\npersist-tun\npull-filter ignore "ping"\npull-filter ignore "ping-restart"\nkeepalive 10 20\nserver-poll-timeout 10\nconnect-retry 1 2\nconnect-retry-max 1\ncipher AES-256-GCM\ndata-ciphers AES-256-GCM\nremote-cert-tls server\nverb 3\nremote-random\n' > riseup.ovpn

# parse JSON with jq to get a list of the gateway IPs
parse_gateways=$(jq -r '.gateways[].ip_address' eip-service.json)

# add the gateways to the OpenVPN config file
for line in $parse_gateways; do
	echo "remote $line 1194"
done >> riseup.ovpn

# parse cert with awk to get the private key and cert
pk=$(echo "<key>" >> riseup.ovpn; awk '/-----BEGIN RSA PRIVATE KEY-----/,/-----END RSA PRIVATE KEY-----/' cert >> riseup.ovpn; echo "</key>" >> riseup.ovpn)
cert=$(echo "<cert>" >> riseup.ovpn; awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/' cert >> riseup.ovpn; echo "</cert>" >> riseup.ovpn)
ca=$(echo "<ca>" >> riseup.ovpn; cat ca.crt >> riseup.ovpn; echo "</ca>" >> riseup.ovpn)

# add the private key and cers to the OpenVPN config file
$pk; $cert; $ca

# check if openvpn is installed
if command -v openvpn >/dev/null 2>&1; then
	echo "OpenVPN is installed"
	sudo openvpn --config riseup.ovpn
else
	echo "OpenVPN is NOT installed.  Install it using your package manager."
fi
