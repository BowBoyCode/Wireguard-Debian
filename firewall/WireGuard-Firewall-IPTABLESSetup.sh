#!/bin/bash

# Enable IP forwarding
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# iptables rules
sudo iptables -A INPUT -i wg0 -j ACCEPT
sudo iptables -A OUTPUT -o wg0 -j ACCEPT
sudo iptables -A FORWARD -i wg0 -j ACCEPT
sudo iptables -A FORWARD -o wg0 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# UFW rules (if using UFW)
sudo ufw allow 51820/udp
sudo ufw reload

# Save iptables rules (Debian)
sudo sh -c 'iptables-save > /etc/iptables.up.rules'

# To load these rules on boot, create a file /etc/network/if-pre-up.d/iptables with:
# #!/bin/sh
# /sbin/iptables-restore < /etc/iptables.up.rules

echo "Firewall rules for WireGuard have been set up."
