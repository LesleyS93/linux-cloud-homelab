# Day 1 Step 12 — Linux File Permissions and ACLs

## Objective

Extend Linux access-control knowledge by working with standard file permissions, ownership, and Access Control Lists (ACLs).

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Permission Model: Linux POSIX permissions
- Advanced Access Control: ACL
- Portfolio: Linux Cloud Career Homelab

## 1. Standard File Permissions

A permissions laboratory was created:

```bash
mkdir -p ~/Projects/linux-cloud-homelab/linux/permissions
cd ~/Projects/linux-cloud-homelab/linux/permissions
```

A test file was created:

```bash
touch access-control.txt
```

Permissions were configured:

```bash
chmod 640 access-control.txt
```

The resulting access model allows:

- Owner: read and write
- Group: read
- Others: no access

Permissions were verified using:

```bash
ls -l access-control.txt
```

## 2. File Metadata

Detailed file information was inspected:

```bash
stat access-control.txt
```

The `stat` command provides information about ownership, permissions, timestamps, size, and inode information.

## 3. ACL Utilities

The ACL package was verified:

```bash
rpm -q acl
```

If required, it can be installed with:

```bash
sudo dnf install acl -y
```

## 4. ACL Inspection

Existing ACL information was displayed using:

```bash
getfacl access-control.txt
```

ACLs provide additional access-control entries beyond the traditional owner, group, and other permission model.

## 5. User-Specific ACL

A temporary user was created:

```bash
sudo useradd -m acluser
sudo passwd acluser
```

The user was granted read access to the test file:

```bash
setfacl -m u:acluser:r access-control.txt
```

The ACL was verified:

```bash
getfacl access-control.txt
```

The user's permissions were then changed to read/write:

```bash
setfacl -m u:acluser:rw access-control.txt
```

## 6. Removing an ACL Entry

The user-specific ACL was removed:

```bash
setfacl -x u:acluser access-control.txt
```

The result was verified using:

```bash
getfacl access-control.txt
```

## 7. Directory ACLs

A dedicated ACL directory was created:

```bash
mkdir acl-project
```

The temporary user was granted access:

```bash
setfacl -m u:acluser:rwx acl-project
```

The resulting ACL was inspected:

```bash
getfacl acl-project
```

## 8. Default ACLs

A default ACL was configured:

```bash
setfacl -d -m u:acluser:rwx acl-project
```

A test file was created:

```bash
touch acl-project/test.txt
```

The inherited permissions were inspected:

```bash
getfacl acl-project/test.txt
```

Default ACLs can be useful when multiple users need consistent access to files created within a shared directory.

## 9. Lab Cleanup

The temporary ACL test account was removed:

```bash
sudo userdel -r acluser
```

## 10. Standard Permissions vs ACLs

Traditional Linux permissions provide three primary access categories:

```text
Owner
Group
Others
```

ACLs provide additional control by allowing specific users or groups to receive permissions without changing the primary ownership model.

## 11. Skills Demonstrated

- Linux file permissions.
- File ownership.
- Permission inspection with `ls` and `stat`.
- ACL inspection with `getfacl`.
- ACL configuration with `setfacl`.
- User-specific access control.
- Directory access control.
- Default ACL inheritance.
- Secure Linux access management.

## Conclusion

Linux permissions provide the basic access-control model used on Linux systems. ACLs extend this model when more granular access is required.

Understanding both systems is important when administering shared directories, application servers, infrastructure systems, and enterprise Linux environments.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 12 — Linux File Permissions and ACLs
