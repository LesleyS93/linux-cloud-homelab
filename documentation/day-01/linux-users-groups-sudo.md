# Day 1 Step 11 — Linux Users, Groups, Sudo and Access Control

## Objective

Develop practical Linux administration skills for managing users, groups, privileges, file ownership, permissions, and sudo access.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Account Management: Linux users and groups
- Privilege Management: sudo
- Portfolio: Linux Cloud Career Homelab

## 1. User Identification

The current Linux account was inspected using:

```bash
whoami
id
groups
getent passwd "$USER"
```

These commands provide information about the current user, UID, GID, group memberships, and account configuration.

## 2. Administration Group

A dedicated Linux administration group was created:

```bash
sudo groupadd linuxadmins
```

The group was verified using:

```bash
getent group linuxadmins
```

Groups allow administrators to manage permissions for multiple users without assigning permissions individually.

## 3. Lab User

A dedicated administration test account was created:

```bash
sudo useradd -m -s /bin/bash sysadmin
sudo passwd sysadmin
```

The account was verified using:

```bash
id sysadmin
getent passwd sysadmin
```

## 4. Group Membership

The test account was added to the administration group:

```bash
sudo usermod -aG linuxadmins sysadmin
```

Membership was verified using:

```bash
id sysadmin
```

## 5. Sudo Administration

Current sudo privileges were inspected using:

```bash
sudo -l
```

The test account's sudo configuration was inspected using:

```bash
sudo -l -U sysadmin
```

Sudo configuration was validated using:

```bash
sudo visudo -c
```

The `visudo` utility should be used when modifying sudo configuration because it validates the configuration before saving changes.

## 6. Linux Account Files

Linux account information is stored in several important files:

```text
/etc/passwd
/etc/shadow
/etc/group
```

These files contain information related to users, authentication, and group membership.

They were inspected using:

```bash
cat /etc/passwd
cat /etc/group
```

Sensitive account information should be handled carefully, and these files should not be modified manually without understanding the consequences.

## 7. File Ownership

A dedicated administration lab directory was created:

```bash
sudo mkdir -p /srv/linux-admin-lab
```

A test file was created:

```bash
sudo touch /srv/linux-admin-lab/admin-test.txt
```

File ownership was inspected:

```bash
ls -l /srv/linux-admin-lab/admin-test.txt
```

The group ownership was changed:

```bash
sudo chown :linuxadmins /srv/linux-admin-lab/admin-test.txt
```

Ownership was verified again using:

```bash
ls -l /srv/linux-admin-lab/admin-test.txt
```

## 8. Directory Permissions

The administration directory was assigned to the `linuxadmins` group:

```bash
sudo chown root:linuxadmins /srv/linux-admin-lab
```

Group permissions were configured:

```bash
sudo chmod 770 /srv/linux-admin-lab
```

The resulting permissions were inspected:

```bash
ls -ld /srv/linux-admin-lab
```

This demonstrated the relationship between user ownership, group ownership, and Linux permissions.

## 9. Lab Cleanup

The temporary administration account was removed:

```bash
sudo userdel -r sysadmin
```

The account was verified:

```bash
id sysadmin
```

The temporary administration group can also be removed when no longer required:

```bash
sudo groupdel linuxadmins
```

## 10. Skills Demonstrated

- Linux user administration.
- Linux group administration.
- User and group identification.
- Sudo privilege management.
- Account-file awareness.
- File ownership management.
- Group-based access control.
- Linux permission management.
- Secure privilege delegation.
- Basic account lifecycle management.

## Conclusion

Linux user and group management is a fundamental system administration responsibility.

Understanding users, groups, ownership, permissions, and sudo provides the foundation for controlling access to Linux servers securely.

These concepts will be used throughout the homelab when configuring services, SSH access, automation, containers, monitoring, and cloud infrastructure.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 11 — Linux Users, Groups, Sudo and Access Control
