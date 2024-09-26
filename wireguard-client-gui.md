To install and configure WireGuard on a Debian 12 client with a graphical user interface (GUI), follow these steps:

### Step 1: Install WireGuard
1. **Update your package list**:
   Open a terminal and run the following command to ensure your system is up-to-date.
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install WireGuard**:
   Install the WireGuard package on Debian.
   ```bash
   sudo apt install wireguard
   ```

3. **Install WireGuard GUI**:
   Debian does not provide an official GUI for WireGuard, but there are third-party options like `WireGuard-UI` or `wg-quick`. Alternatively, `NetworkManager` has built-in support for WireGuard, which provides a convenient GUI through network settings.

   To use **NetworkManager** with WireGuard, install the following:
   ```bash
   sudo apt install network-manager-wireguard
   ```

### Step 2: Configure WireGuard with NetworkManager (GUI)

1. **Open Network Settings**:
   Open your network settings from your desktop environment's control panel or system tray.

2. **Add a WireGuard Connection**:
   - In **Network Settings**, click the `+` button to add a new connection.
   - Choose **WireGuard** as the connection type.

3. **Import or Set Up the Configuration**:
   - If you have a `.conf` file (received from the server), you can import it.
   - Alternatively, you can manually enter your **Private Key**, **Public Key**, **Endpoint**, and **Allowed IPs**.
   
4. **Save the Configuration**:
   Once you've set up or imported your configuration, save the settings.

### Step 3: Activate WireGuard
To activate WireGuard through NetworkManager:
1. Go to your **Network Settings**.
2. Find the WireGuard connection you created and enable it.

WireGuard should now connect, and you’ll be able to route traffic through the VPN.

### Step 4: Verify the Connection
To confirm your WireGuard connection is working:
1. Open a terminal and check the status with:
   ```bash
   sudo wg
   ```
   This should show the current WireGuard status, including peers and transfer information.

Let me know if you encounter any issues!
