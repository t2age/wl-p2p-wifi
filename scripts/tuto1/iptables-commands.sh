#  Good to run to add the firewall rules.
#  Works OK with ufw rules.
#
#  "eth0" is the wired interface where the Internet is
#  "wlan0" is the WiFi interface to where the Internet
#  will be shared with...
#
sudo iptables -t nat -A POSTROUTING  -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

#  Every time the system restarts, you need to run again these rules...
