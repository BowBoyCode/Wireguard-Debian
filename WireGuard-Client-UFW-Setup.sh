#!/bin/bash

# Enable UFW
sudo ufw enable

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow WireGuard traffic (adjust port if needed)
sudo ufw allow out to any port 51820 proto udp

# Optional: Allow incoming traffic on WireGuard interface
# sudo ufw allow in on wg0 from any to any

# Reload UFW to apply changes
sudo ufw reload

echo "Basic UFW rules for WireGuard client have been set up."
