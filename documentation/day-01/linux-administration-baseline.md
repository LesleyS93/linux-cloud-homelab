# Day 1 Step 3 — Linux Administration Baseline

## Objective

Establish a baseline for Linux system administration and troubleshooting using Rocky Linux.

## Environment

- Operating System: Rocky Linux
- Virtualization: VMware
- Hostname: linuxlab01
- Git: Installed
- GitHub: Configured
- Homelab Repository: linux-cloud-homelab

## Linux Administration Tasks

### System Information

Commands used:

```bash
hostnamectl
cat /etc/os-release
whoami
id
```

Purpose:

These commands were used to identify the Linux operating system, hostname, current user, system architecture, and user/group information.

### System Resources

Commands used:

```bash
uptime
free -h
df -h
ps aux
```

Purpose:

These commands were used to inspect system uptime, memory usage, disk usage, and running processes.

### User and Group Management

Created a practice Linux group:

```bash
sudo groupadd homelab
```

Created a practice Linux user:

```bash
sudo useradd -m -s /bin/bash labadmin
```

Added the user to the homelab group:

```bash
sudo usermod -aG homelab labadmin
```

Set the user's password:

```bash
sudo passwd labadmin
```

Verified the account:

```bash
id labadmin
```

### File Permissions

Created a test file and inspected its permissions:

```bash
touch permissions-lab.txt
ls -l permissions-lab.txt
```

Changed the permissions:

```bash
chmod 640 permissions-lab.txt
```

Verified the result:

```bash
ls -l permissions-lab.txt
```

### System Services

Inspected the SSH service using systemd:

```bash
sudo systemctl status sshd
```

Checked whether SSH is enabled:

```bash
sudo systemctl is-enabled sshd
```

Listed running services:

```bash
systemctl list-units --type=service --state=running
```

### System Logs

Reviewed recent system logs:

```bash
sudo journalctl -n 50
```

Reviewed SSH logs:

```bash
sudo journalctl -u sshd -n 30
```

## Troubleshooting Notes

No major issues encountered during the initial Linux administration baseline.

Future troubleshooting incidents will be documented here with:

1. Problem
2. Symptoms
3. Investigation
4. Root cause
5. Resolution
6. Lessons learned

## Skills Demonstrated

- Linux system administration
- User and group management
- File permissions
- Process management
- System resource monitoring
- systemd service management
- Linux logging
- Basic troubleshooting
- Git documentation

## Lessons Learned

This exercise established the basic Linux administration workflow required for managing a Linux server.

The next stage will focus on SSH administration, remote access, security, and server hardening.

## Next Steps

- Configure SSH administration
- Understand SSH keys
- Harden SSH
- Configure the firewall
- Test remote administration
- Document the configuration
