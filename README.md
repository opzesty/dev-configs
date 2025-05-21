If you are using fedora 42 Sericea on an NVIDA GPU, current you need to be a little hacky.  The open source driver 'nouveau' can seize up and cause wayland to crash, so you might need to use the nvidia proprietary drivers.  First you'll need to install nvidia drivers since the Universal Blue container seems to have dropped support for Fedora 42.
https://rpmfusion.org/Howto/OSTree#Hardware_codecs_with_NVIDIA
https://rpmfusion.org/Howto/NVIDIA#OSTree_.28Silverblue.2FKinoite.2Fetc.29

Then, due to sway developers being unwilling to make using propriety software easy, you'll have to edit the wayland_sessions configuration to exec "sway --unsupported-gpu".  To do that on Sericea...you'll have to get fancy and use `ostree admin unlock --hotfix`

https://www.reddit.com/r/Fedora/comments/y7msf7/how_to_specify_unsupportedgpu_for_swaynvidia/
https://github.com/swaywm/sway/issues/6760
https://discussion.fedoraproject.org/t/how-do-i-edit-a-script-in-usr-bin-on-silverblue/36611

There's more to come to make the nvidia drivers secure-bootable, but I wanted to just get this path documented before I forgot about it.

To install the screenshot script:
make install -f .local/bin/makefile

VPNS
----
Let's assume we are dealing with Network Manager.  You'll need a VPN that looks like the reference VPN file.

### ca, cert/key, and ta files

### Variables to prompt user for passwords

There are two passwords that you might need for a VPN:

1. **VPN password** – used when the VPN requires username/password authentication.
2. **Certificate password** – used to decrypt your private key, if the key is encrypted.

You can configure NetworkManager to prompt for either or both passwords by setting specific flags in your `.nmconnection` file.

---

#### 🔑 Prompting for the VPN password

If your VPN uses `password-tls` and requires a password (in addition to certs), use the following configuration:

```ini
[vpn]
connection-type=password-tls
username=your-username
password-flags=1
```

password-flags=1 ensures NetworkManager prompts the user at connection time.

#### 🔐 Prompting for the certificate password

If your private key (.key.pem) is encrypted, you must tell NetworkManager to prompt for the decryption password:

```ini
[vpn]
cert=/path/to/your/client.crt
key=/path/to/your/client.key
cert-pass-flags=1
```

cert-pass-flags=1 tells NetworkManager to prompt for the password used to decrypt the private key.

#### 🔐🔑 Prompting for both passwords

If your VPN requires both a user password and an encrypted certificate key, your config should include both flags:

```ini
[vpn]
connection-type=password-tls
username=your-username
password-flags=1
cert=/path/to/your/client.crt
key=/path/to/your/client.key
cert-pass-flags=1
```

In all cases, do not include a [vpn-secrets] section with password=  or cert-pass= if you want the prompt.

#### 💡 Applying the configuration
After editing the .nmconnection file, make sure to fix the permissions and reload NetworkManager:

```bash
sudo chown root:root /etc/NetworkManager/system-connections/your-vpn.nmconnection
sudo chmod 600 /etc/NetworkManager/system-connections/your-vpn.nmconnection
sudo nmcli connection reload
nmcli connection up 'your-vpn'
```

User mileage may vary.
