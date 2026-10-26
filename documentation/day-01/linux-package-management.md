# Day 1 Step 8 — Linux Package Management with DNF

## Objective

Learn to manage software packages on Rocky Linux using DNF and RPM. This exercise covers package discovery, installation, verification, updates, removal, transaction history, and repository inspection.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Package Manager: DNF
- Package Query Tool: RPM
- Portfolio: Linux Cloud Career Homelab

## 1. Verify the Operating System and Package Manager

```bash
cat /etc/os-release
dnf --version
sudo dnf repolist
```

These commands identify the operating system, confirm the package manager is available, and display configured repositories.

## 2. Search for Packages

```bash
dnf search nginx
dnf info nginx
dnf list installed
rpm -q nginx
```

DNF searches repositories and displays package information. RPM checks whether a package is installed locally.

## 3. Install and Verify Software

The `tree` utility was selected as an example package.

```bash
sudo dnf install tree -y
rpm -q tree
tree ~/Projects/linux-cloud-homelab
```

The utility displays directories and files in a hierarchical structure.

## 4. Check for and Apply Updates

```bash
sudo dnf check-update
sudo dnf upgrade -y
```

Package updates provide software improvements, bug fixes, and security patches. Update output should be reviewed, particularly on systems running important services.

## 5. Remove Software

```bash
sudo dnf remove tree -y
rpm -q tree
```

Package removal should be performed only after reviewing the software's purpose and dependencies.

## 6. Inspect Transaction History

```bash
sudo dnf history
```

Inspect an individual transaction:

```bash
sudo dnf history info TRANSACTION_ID
```

DNF history helps administrators investigate package changes and identify when software was installed, updated, or removed.

## 7. Inspect Repositories

```bash
sudo dnf repolist --enabled
sudo dnf repoinfo
ls -l /etc/yum.repos.d/
```

Repositories provide package files and metadata. Administrators should use trusted sources and maintain appropriate repository configuration.

## 8. Clean Package Metadata

```bash
sudo dnf clean all
sudo dnf makecache
```

These commands clear cached package-manager data and rebuild the metadata cache.

## 9. Skills Developed

- DNF package management.
- RPM package queries.
- Software installation and removal.
- Package update management.
- Repository inspection.
- Package transaction auditing.
- Linux software troubleshooting.
- Basic system maintenance.

## Conclusion

Package management is a fundamental Linux administration responsibility. DNF simplifies software installation and maintenance, while RPM provides useful local package information. Understanding these tools supports reliable server maintenance, security patching, and infrastructure troubleshooting.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 8 — Linux Package Management
