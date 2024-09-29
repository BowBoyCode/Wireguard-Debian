To install and configure WireGuard on a Debian 12 **server** with a graphical user interface (GUI), the process is similar to setting up on a client, but with a few server-specific configurations. Follow these steps:

### Step 1: Install WireGuard

1. **Update the package list**:
   Open a terminal and run the following commands to ensure your system is up-to-date.
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install WireGuard**:
   Install WireGuard on your server.
   ```bash
   sudo apt install wireguard
   ```

3. **Install NetworkManager for WireGuard (optional for GUI management)**:
   If you want to use a GUI to manage WireGuard connections, you can install `NetworkManager` support for WireGuard. This allows management through the network settings GUI.
   ```bash
   sudo apt install network-manager-wireguard
   ```

### Step 2: Set Up WireGuard Server Configuration

WireGuard uses configuration files located in `/etc/wireguard/`. You will need to create one for your server interface (e.g., `wg0.conf`).

1. **Generate Server Keys**:
   Run the following commands to generate a private and public key for your WireGuard server:
   ```bash
   umask 077
   wg genkey | tee privatekey | wg pubkey > publickey
   ```

   You will have two files:
   - `privatekey` – Your server's private key.
   - `publickey` – Your server's public key (to be shared with clients).

2. **Create the WireGuard Configuration File**:
   Create the server configuration file at `/etc/wireguard/wg0.conf`:
   ```bash
   sudo nano /etc/wireguard/wg0.conf
   ```

   Example server configuration for `wg0.conf`:
   ```ini
   [Interface]
   Address = 10.0.0.1/24          # IP address of the WireGuard interface on the server
   SaveConfig = true
   ListenPort = 51820             # Port WireGuard will listen on (default is 51820)
   PrivateKey = YOUR_PRIVATE_KEY  # Replace with the contents of your privatekey file

   # Enable IP forwarding
   PostUp = sysctl -w net.ipv4.ip_forward=1
   PostDown = sysctl -w net.ipv4.ip_forward=0

   [Peer]
   PublicKey = CLIENT_PUBLIC_KEY  # Replace with your client's public key
   AllowedIPs = 10.0.0.2/32       # Allowed IPs for this client
   ```

   Replace `YOUR_PRIVATE_KEY` with the content of your `privatekey` file and `CLIENT_PUBLIC_KEY` with the public key of a client that will connect to your server.

3. **Enable IP Forwarding**:
   Ensure IP forwarding is enabled so the server can route traffic. Edit the sysctl configuration file:
   ```bash
   sudo nano /etc/sysctl.conf
   ```
   Uncomment or add the following line:
   ```bash
   net.ipv4.ip_forward=1
   ```
   Apply the change:
   ```bash
   sudo sysctl -p
   ```

### Step 3: Start and Enable WireGuard

1. **Bring up the WireGuard interface**:
   Use the following command to start WireGuard on the server:
   ```bash
   sudo wg-quick up wg0
   ```

2. **Enable WireGuard at Boot**:
   To ensure WireGuard starts at boot, enable the service:
   ```bash
   sudo systemctl enable wg-quick@wg0
   ```

3. **Verify WireGuard Status**:
   To check if WireGuard is running correctly, run:
   ```bash
   sudo wg
   ```

### Step 4: Configure Firewall (Optional)
If you have a firewall enabled (such as `ufw` or `iptables`), make sure to allow traffic on the WireGuard port (default is UDP 51820).

For `ufw`:
```bash
sudo ufw allow 51820/udp
```

### Step 5: Configure WireGuard with NetworkManager (GUI Option)

If you prefer using a GUI to manage the WireGuard server:

1. **Open Network Settings**:
   - Open the network settings through your desktop environment.
   - You should see a **WireGuard** option under VPN types if `network-manager-wireguard` is installed.

2. **Add a WireGuard Connection**:
   - Click the `+` icon to create a new connection.
   - Select **WireGuard** and fill in the appropriate details (such as the private key, port, and peer information).

3. **Start the VPN**:
   - Once the configuration is saved, you can easily manage the WireGuard interface through the GUI.

### Step 6: Set Up Client Configuration

You will need to set up the client side with the correct peer information (server public key, endpoint IP, and allowed IPs). This is similar to the setup you've already done for the server but configured for the client.

Let me know if you need help with client configuration or any other steps!
