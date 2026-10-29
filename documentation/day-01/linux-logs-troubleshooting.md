# Day 1 Step 10 — Linux Logs and Troubleshooting

## Objective

Develop practical Linux troubleshooting skills by using systemd-journald and journalctl to investigate system, service, boot, kernel, and error logs.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Logging System: systemd-journald
- Log Management Tool: journalctl
- Service Manager: systemd
- Portfolio: Linux Cloud Career Homelab

## 1. systemd-journald

The systemd journal provides centralized logging for the Linux operating system and its services.

The journal service was inspected using:

```bash
systemctl status systemd-journald
systemctl is-active systemd-journald
```

## 2. View Recent Logs

Recent system logs were viewed using:

```bash
sudo journalctl -n 50
```

Real-time log monitoring was performed using:

```bash
sudo journalctl -f
```

Real-time monitoring is useful when reproducing a problem and observing log entries as they occur.

## 3. Current Boot Logs

Logs from the current system boot were inspected:

```bash
sudo journalctl -b
```

Errors from the current boot were filtered using:

```bash
sudo journalctl -p err -b
```

Warnings and errors were reviewed using:

```bash
sudo journalctl -p warning -b
```

## 4. Service-Specific Logs

SSH service logs were inspected using:

```bash
sudo journalctl -u sshd
```

The most recent SSH entries were viewed using:

```bash
sudo journalctl -u sshd -n 50
```

Service-specific logging allows administrators to narrow troubleshooting to a particular application or system service.

## 5. Time-Based Log Searching

Today's logs were displayed using:

```bash
sudo journalctl --since today
```

Recent logs were searched using:

```bash
sudo journalctl --since "1 hour ago"
```

Specific time ranges can also be used:

```bash
sudo journalctl --since "2026-10-28 18:00:00" --until "2026-10-28 19:00:00"
```

## 6. Searching Logs

Error messages were searched using:

```bash
sudo journalctl -b | grep -i "error"
```

SSH-related messages were searched using:

```bash
sudo journalctl -b | grep -i "ssh"
```

These filters help reduce large amounts of log data and focus the investigation on relevant information.

## 7. Kernel Logs

Kernel messages were inspected using:

```bash
sudo journalctl -k -b
```

Recent kernel messages were displayed using:

```bash
sudo journalctl -k -n 50
```

The traditional `dmesg` command was also used:

```bash
sudo dmesg -T | tail -50
```

Kernel logs can provide information about hardware, drivers, filesystems, storage, and other low-level system events.

## 8. Failed Services

Failed systemd services were identified using:

```bash
systemctl --failed
```

This provides a quick overview of services that failed to start or entered a failed state.

## 9. Storage and Filesystem Troubleshooting

Storage-related messages can be filtered using:

```bash
sudo journalctl -b | grep -Ei "disk|mount|filesystem|xfs"
```

This is useful when troubleshooting mount failures, filesystem problems, or storage-related events.

## 10. Troubleshooting Methodology

A structured troubleshooting process was used:

```text
Problem
   ↓
Check System Status
   ↓
Check Failed Services
   ↓
Review Recent Logs
   ↓
Filter by Service
   ↓
Check Warnings and Errors
   ↓
Identify Root Cause
   ↓
Apply Controlled Fix
   ↓
Verify the Result
```

The objective is to identify the root cause before making configuration changes.

## 11. Skills Demonstrated

- systemd-journald administration.
- journalctl usage.
- Service-specific log analysis.
- Boot log analysis.
- Kernel log investigation.
- Error and warning filtering.
- Time-based log searches.
- Failed-service identification.
- Linux troubleshooting methodology.
- Root-cause analysis.

## Conclusion

Log analysis is one of the most important Linux administration skills. Administrators use logs to understand what happened on a system, identify failures, investigate services, and determine the root cause of problems.

The ability to systematically investigate logs will be used throughout the Linux Cloud Career Homelab, particularly during networking, storage, security, automation, Docker, monitoring, and cloud infrastructure projects.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 10 — Linux Logs and Troubleshooting
