# Day 1 Step 6 — Linux Storage Management

## Objective

Configure and manage additional Linux storage on a Rocky Linux virtual machine.

The exercise covers disk identification, partitioning, filesystem creation, mounting, filesystem verification, and persistent storage configuration.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Filesystem: XFS
- Storage Mount Point: `/data`
- Version Control: Git
- Portfolio Platform: GitHub

## 1. Storage Inspection

Existing storage was inspected using:

```bash
lsblk
lsblk -f
df -h
sudo fdisk -l
```

These commands provide information about disks, partitions, filesystems, mount points, and available storage.

## 2. Additional Virtual Disk

A dedicated virtual disk was added to the Rocky Linux VMware virtual machine for storage administration practice.

The additional disk was identified using:

```bash
lsblk
```

The dedicated lab disk was used for the storage configuration to avoid modifying the operating system disk.

## 3. Partition Creation

The additional disk was partitioned using:

```bash
sudo fdisk /dev/sdb
```

The resulting partition was:

```text
/dev/sdb1
```

## 4. Filesystem Creation

An XFS filesystem was created:

```bash
sudo mkfs.xfs /dev/sdb1
```

The filesystem was verified using:

```bash
lsblk -f
```

## 5. Mount Point Configuration

A dedicated mount point was created:

```bash
sudo mkdir -p /data
```

The filesystem was mounted:

```bash
sudo mount /dev/sdb1 /data
```

The mounted filesystem was verified using:

```bash
df -h /data
mount | grep /data
```

## 6. Storage Testing

A project directory was created on the new filesystem:

```bash
sudo mkdir -p /data/projects
```

A test file was created:

```bash
sudo touch /data/projects/storage-test.txt
```

The contents of the directory were verified:

```bash
ls -la /data/projects
```

## 7. Persistent Mount Configuration

The filesystem UUID was obtained using:

```bash
sudo blkid /dev/sdb1
```

The `/etc/fstab` configuration was backed up:

```bash
sudo cp -a /etc/fstab /etc/fstab.backup
```

The filesystem was configured to mount automatically:

```text
UUID=YOUR-UUID-HERE /data xfs defaults 0 0
```

The configuration was tested with:

```bash
sudo umount /data
sudo mount -a
```

The mount was then verified:

```bash
df -h /data
findmnt /data
```

## 8. Skills Demonstrated

This exercise developed practical skills in:

- Linux disk identification.
- Partition management.
- Filesystem creation.
- XFS filesystem administration.
- Linux mount points.
- Persistent filesystem configuration.
- `/etc/fstab` administration.
- Filesystem UUID management.
- Storage troubleshooting.
- VMware virtual disk management.

## 9. Conclusion

Linux storage management is a fundamental system administration skill. This exercise demonstrated how to attach additional virtual storage, create a partition, format it with XFS, mount it to the filesystem, and configure persistent mounting through `/etc/fstab`.

The resulting `/data` filesystem provides dedicated storage that can be reused in later homelab projects involving databases, application deployments, backups, containers, and monitoring.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 6 — Linux Storage Management
