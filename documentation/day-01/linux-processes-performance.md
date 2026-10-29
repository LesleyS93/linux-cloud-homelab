# Day 1 Step 9 — Linux Processes and System Performance

## Objective

Develop practical Linux administration skills for monitoring processes, CPU usage, memory utilization, system load, disk usage, services, and system logs.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Monitoring Tools: `top`, `ps`, `free`, `uptime`, `df`, `du`
- Service Manager: systemd
- Logging: systemd-journald
- Portfolio: Linux Cloud Career Homelab

## 1. System Uptime and Load

System uptime was checked using:

```bash
uptime
uptime -p
```

These commands provide information about system uptime and load averages.

Load averages represent the amount of work waiting for CPU or other system resources over 1, 5, and 15 minute periods.

## 2. CPU Information

CPU information was inspected using:

```bash
lscpu
nproc
```

These commands provide information about the processor architecture and available CPU processing units.

## 3. Memory Monitoring

Memory utilization was checked using:

```bash
free -h
```

Continuous monitoring can be performed with:

```bash
watch -n 2 free -h
```

Understanding available, used, and cached memory is important when investigating server performance issues.

## 4. Process Management

Running processes were inspected using:

```bash
ps aux
```

A process tree was displayed using:

```bash
ps -ef --forest
```

Specific processes can be located using:

```bash
ps aux | grep sshd
```

Process information allows administrators to identify applications currently running on the server.

## 5. Real-Time Process Monitoring

The `top` utility was used:

```bash
top
```

`top` provides real-time information about CPU utilization, memory usage, process IDs, system load, and running processes.

The application can be exited using:

```text
q
```

## 6. Service Monitoring

Running system services were inspected using:

```bash
systemctl list-units --type=service --state=running
```

The SSH service was inspected using:

```bash
systemctl status sshd
```

systemd provides centralized control over Linux services and their operational state.

## 7. Disk Usage

Filesystem usage was checked using:

```bash
df -h
```

Directory usage was inspected using:

```bash
sudo du -sh /var/*
```

The homelab project directory was also checked:

```bash
du -sh ~/Projects/linux-cloud-homelab
```

Disk usage monitoring helps identify filesystems that are approaching capacity.

## 8. Resource-Heavy Processes

CPU-intensive processes were identified using:

```bash
ps -eo pid,comm,%cpu --sort=-%cpu | head
```

Memory-intensive processes were identified using:

```bash
ps -eo pid,comm,%mem --sort=-%mem | head
```

These commands provide a quick way to identify processes that may be contributing to performance problems.

## 9. Kernel and System Logs

Recent kernel messages were inspected:

```bash
sudo dmesg -T | tail -50
```

System logs were reviewed using:

```bash
sudo journalctl -n 50
sudo journalctl -b
sudo journalctl -p warning -b
```

Logs are an important source of information when troubleshooting system and application problems.

## 10. Performance Troubleshooting Methodology

A structured approach was used when investigating poor server performance:

```text
System Symptoms
      ↓
Check Uptime and Load
      ↓
Check CPU
      ↓
Check Memory
      ↓
Check Processes
      ↓
Check Disk Usage
      ↓
Check Services
      ↓
Check System Logs
      ↓
Identify Root Cause
```

The objective is to identify the actual resource or service causing the problem rather than making unnecessary configuration changes.

## 11. Skills Demonstrated

- Linux process management.
- CPU monitoring.
- Memory monitoring.
- System load analysis.
- Disk-space analysis.
- systemd service management.
- Real-time performance monitoring.
- Linux log analysis.
- Basic performance troubleshooting.
- Structured troubleshooting methodology.

## Conclusion

Linux administrators must understand how to identify resource problems and determine which processes or services are responsible.

This exercise established the foundation for monitoring and troubleshooting Linux servers before moving into more advanced monitoring, automation, cloud infrastructure, and DevOps projects.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 9 — Linux Processes and System Performance
