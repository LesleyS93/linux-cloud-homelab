# Day 1 Step 4 — SSH Administration and Linux Server Hardening

## 1. Objective

Configure and manage secure remote access to a Rocky Linux server using Secure Shell (SSH). This exercise covers SSH service management, network connectivity, firewall configuration, and basic server security.

## 2. Lab Environment

- **Operating System:** Rocky Linux
- **Virtualization:** VMware
- **SSH Service:** OpenSSH Server (`sshd`)
- **Default SSH Port:** TCP 22
- **Version Control:** Git
- **Portfolio:** GitHub

## 3. SSH Overview

SSH is an encrypted network protocol used to access and administer remote systems securely. Linux administrators use SSH to manage servers, execute commands remotely, transfer files, and troubleshoot infrastructure.

SSH is an essential skill for Linux administration, cloud engineering, and DevOps because servers are commonly managed remotely.

## 4. Verify OpenSSH Installation

Check whether OpenSSH Server is installed:

```bash
rpm -q openssh-server
```

Install it if necessary:

```bash
sudo dnf install openssh-server -y
```

## 5. Start and Enable the SSH Service

Start SSH and configure it to launch automatically at boot:

```bash
sudo systemctl enable --now sshd
```

Check the service status:

```bash
sudo systemctl status sshd
```

Verify that the service is enabled:

```bash
sudo systemctl is-enabled sshd
```

The service should report as active and enabled when operating correctly.

## 6. Verify the SSH Listening Port

Inspect listening TCP ports:

```bash
sudo ss -tlnp | grep ':22'
```

SSH commonly listens on TCP port 22 unless a different port has been configured.

## 7. Inspect the Firewall

Check the firewall status:

```bash
sudo firewall-cmd --state
```

Identify active firewall zones:

```bash
sudo firewall-cmd --get-active-zones
```

Inspect the applicable zone:

```bash
sudo firewall-cmd --list-all
```

If SSH access is required and the appropriate zone does not permit it, allow SSH on the intended trusted lab network:

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
```

Firewall changes should be limited to the network where SSH access is required.

## 8. Identify Network Configuration

Display IPv4 addresses:

```bash
ip -4 addr
```

Inspect the routing table:

```bash
ip route
```

These commands help identify the server's IP address, network interfaces, and default route.

## 9. Back Up and Validate SSH Configuration

The main SSH server configuration file is:

```text
/etc/ssh/sshd_config
```

Create a backup before making changes:

```bash
sudo cp -a /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
```

Validate the configuration syntax:

```bash
sudo sshd -t
```

No output normally indicates that the configuration passes the syntax check.

## 10. Test Remote SSH Connectivity

From an authorized Windows computer, test whether port 22 is reachable:

```powershell
Test-NetConnection SERVER_IP -Port 22
```

Replace `SERVER_IP` with the Rocky Linux server's actual IP address.

Connect to the server:

```bash
ssh YOUR_USERNAME@SERVER_IP
```

Replace the placeholders with the appropriate username and server address. Verify the server's host-key fingerprint through a trusted channel before accepting it.

## 11. Troubleshooting

Useful diagnostic commands include:

```bash
sudo systemctl status sshd
sudo ss -tlnp
sudo firewall-cmd --list-all
sudo journalctl -u sshd -n 50
ip -4 addr
ip route
```

A systematic troubleshooting process checks:

1. Whether the virtual machine is running.
2. Whether the server has the expected IP address.
3. Whether the SSH service is active.
4. Whether SSH is listening on the expected port.
5. Whether firewall rules permit the connection.
6. Whether VMware networking allows connectivity.
7. Whether SSH logs contain relevant errors.

## 12. Security Practices

- Restrict SSH access to trusted networks.
- Use strong, unique passwords.
- Protect private keys and credentials.
- Verify host keys before connecting.
- Back up configuration files before editing them.
- Validate SSH configuration before applying changes.
- Keep the VMware console available while testing remote access.
- Avoid exposing SSH directly to the public internet.
- Test SSH key authentication before tightening password-based access.

## 13. Skills Developed

This exercise covers practical skills in:

- Rocky Linux system administration.
- OpenSSH service management.
- `systemd` service control.
- TCP port inspection.
- Linux networking and IP addressing.
- Firewall administration with `firewalld`.
- SSH configuration backup and validation.
- Remote access troubleshooting.
- Linux server security.
- Technical documentation and Git version control.

## 14. Conclusion

SSH provides secure remote administration for Linux infrastructure. Understanding its service configuration, network requirements, firewall rules, and troubleshooting process establishes a foundation for managing on-premises servers and cloud virtual machines.

This exercise forms part of the Linux Cloud Career Homelab portfolio and supports the development of practical Linux infrastructure, cloud operations, and DevOps skills.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 4 — SSH Administration and Linux Server Hardening
