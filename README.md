![BowBoyCode Chain](https://github.com/BowBoyCode/Wireguard-Debian/blob/main/bowboycode-vpn.png)

# Personal Wireguard VPN configuration.
This is my personal VPN using Debian 12 NetworkManager and Wireguard.

## Features
- NetworkManager configuration setup.
- Wireguard configuration setup.

## Image

![Project Screenshot](https://github.com/username/repo-name/blob/main/path-to-image.png)

# Installation notes
#### Copying from Local to Remote
scp /path/to/local/file username@remote_host:/path/to/remote/directory
scp myfile.txt user@192.168.1.100:/home/user/

#### Copying from Remote to Local
scp username@remote_host:/path/to/remote/file /path/to/local/directory
scp user@192.168.1.100:/home/user/myfile.txt /home/localuser/

#### Copying Between Two Remote Hosts
scp username1@remote_host1:/path/to/file username2@remote_host2:/path/to/directory


#### Common Options

##### -r: Copy directories recursively.
##### -P <port>: Specify a custom port if the SSH server is running on a non-default port.
##### -i <identity_file>: Use a specific SSH private key.

#### Example: Copying a Directory Recursively
scp username1@remote_host1:/path/to/file username2@remote_host2:/path/to/directory




