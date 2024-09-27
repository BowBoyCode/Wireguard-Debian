When using NetworkManager (NM) with WireGuard, it's important to store your keys securely and set the correct permissions. Here are some best practices:

### Storing WireGuard Keys
1. **Location**: Store your keys in a secure directory, such as `/etc/wireguard/`. This directory is typically used for WireGuard configuration files and keys.
2. **Permissions**: Ensure that the directory and files have the correct permissions to prevent unauthorized access. You can set the permissions using the following commands:
   ```sh
   sudo mkdir -p /etc/wireguard
   sudo chmod 700 /etc/wireguard
   sudo touch /etc/wireguard/privatekey /etc/wireguard/publickey
   sudo chmod 600 /etc/wireguard/privatekey
   sudo chmod 644 /etc/wireguard/publickey
   ```

### Generating WireGuard Keys with Correct Permissions
1. **Generate Keys**: Use the `wg` command to generate your private and public keys. Ensure you set the correct permissions immediately after generating the keys:
   ```sh
   cd /etc/wireguard
   umask 077
   wg genkey | tee privatekey | wg pubkey > publickey
   ```

2. **Verify Permissions**: After generating the keys, verify that the permissions are set correctly:
   ```sh
   ls -l /etc/wireguard
   ```

### Configuring NetworkManager
1. **Import Configuration**: Once your keys are generated and stored securely, you can import your WireGuard configuration into NetworkManager:
   ```sh
   nmcli connection import type wireguard file /etc/wireguard/wg0.conf
   ```

2. **Activate Connection**: Activate the WireGuard connection using NetworkManager:
   ```sh
   nmcli connection up wg0
   ```

By following these steps, you ensure that your WireGuard keys are stored securely and have the appropriate permissions¹²³.

If you have any more questions or need further assistance, feel free to ask!

Source: Conversation with Copilot, 9/26/2024
(1) How to Install and Configure WireGuard on Ubuntu 22.04 with Network Manager. https://hatchjs.com/ubuntu-22-04-network-manager-wireguard/.
(2) WireGuard in NetworkManager – Thomas Haller's Blog - GNOME. https://blogs.gnome.org/thaller/2019/03/15/wireguard-in-networkmanager/.
(3) How to configure WireGuard VPN client with NetworkManager GUI - Xmodulo. https://www.xmodulo.com/wireguard-vpn-network-manager-gui.html.
(4) WireGuard installation and configuration - on Linux. https://www.youtube.com/watch?v=bVKNSf1p1d0.
(5) Install and Configure WireGuard Server on Windows. https://www.youtube.com/watch?v=AR5IWUpZbsk.
(6) How to create WireGuard server from AKUNSSH. https://www.youtube.com/watch?v=wIvJBL7eoFs.
(7) Configure WireGuard VPNs with NetworkManager - Fedora ... - Fedora Magazine. https://fedoramagazine.org/configure-wireguard-vpns-with-networkmanager/.
(8) WireGuard using NetworkManager Setup Guide - IVPN. https://www.ivpn.net/setup/linux-wireguard-netman/.
(9) How to set up a manual WireGuard® connection on Linux via Network Manager. https://support.surfshark.com/hc/en-us/articles/19262406140306-How-to-set-up-a-manual-WireGuard-connection-on-Linux-via-Network-Manager.
