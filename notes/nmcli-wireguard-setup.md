Certainly, let's set up WireGuard using NetworkManager (nmcli) on Debian. This method integrates WireGuard with your system's network management, which can be convenient for desktop use. Here's a step-by-step guide:

1. Install WireGuard and NetworkManager WireGuard plugin:
   ```
   sudo apt update
   sudo apt install wireguard network-manager-wireguard
   ```

2. Generate private and public keys:
   ```
   wg genkey | tee privatekey | wg pubkey > publickey
   ```

3. Create a new WireGuard connection:
   ```
   nmcli connection add type wireguard \
   con-name "WireGuard1" \
   ifname wg0 \
   ipv4.method manual \
   ipv4.addresses "10.0.0.2/24"
   ```

4. Set the private key:
   ```
   nmcli connection modify WireGuard1 wireguard.private-key-file ./privatekey
   ```

5. Add a peer:
   ```
   nmcli connection modify WireGuard1 +wireguard.peer-routes yes \
   wireguard.persistent-keepalive 25 \
   +wireguard.peer-public-key "<Peer-Public-Key>" \
   +wireguard.peer-allowed-ips "10.0.0.1/32"
   ```
   Replace <Peer-Public-Key> with the public key of the peer you're connecting to

6. Set DNS if needed:
   ```
   nmcli connection modify WireGuard1 ipv4.dns "8.8.8.8"
   ```

7. Activate the connection:
   ```
   nmcli connection up WireGuard1
   ```

8. Check the connection status:
   ```
   nmcli connection show WireGuard1
   ```

9. To automatically connect on boot:
   ```
   nmcli connection modify WireGuard1 connection.autoconnect yes
   ```

This method integrates WireGuard with NetworkManager, making it easier to manage alongside other network connections on your system.

Would you like me to clarify any part of this process or compare it with the wg-quick method we discussed earlier?
