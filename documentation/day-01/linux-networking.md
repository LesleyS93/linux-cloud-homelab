# Day 1 Step 7 — Linux Networking and Troubleshooting

## Objective

Develop practical Linux networking and troubleshooting skills by inspecting network interfaces, IP addressing, routing, DNS, connectivity, firewall configuration, and listening network services.

## Environment

- Operating System: Rocky Linux
- Virtualization Platform: VMware
- Network Management: NetworkManager
- Network Configuration: IPv4
- Portfolio: Linux Cloud Career Homelab

## 1. Network Interface Inspection

Network interfaces were inspected using:

```bash
ip addr
ip -br addr
ip link
```

These commands provide information about network interfaces, IP addresses, interface states, and link configuration.

## 2. Routing

The routing table was inspected using:

```bash
ip route
```

The routing table identifies the default gateway and determines how network traffic is forwarded to other networks.

## 3. Connectivity Testing

Local connectivity was tested using:

```bash
ping -c 4 127.0.0.1
```

Gateway connectivity was tested using:

```bash
ping -c 4 YOUR_GATEWAY_IP
```

External connectivity was tested using:

```bash
ping -c 4 8.8.8.8
```

These tests help determine whether the server can communicate with local and external network destinations.

## 4. DNS Testing

DNS resolution was tested using:

```bash
getent hosts google.com
```

The DNS configuration was inspected using:

```bash
cat /etc/resolv.conf
```

DNS testing helps determine whether a connectivity problem is related to name resolution rather than basic network connectivity.

## 5. NetworkManager

The NetworkManager service was inspected:

```bash
sudo systemctl status NetworkManager
```

Network connections were displayed using:

```bash
nmcli connection show
```

Network devices were inspected using:

```bash
nmcli device status
```

Detailed device information was obtained using:

```bash
nmcli device show
```

## 6. Network Service Inspection

Listening network services were inspected using:

```bash
sudo ss -tulpn
```

SSH was specifically checked using:

```bash
sudo ss -tlnp | grep ':22'
```

This provides visibility into services accepting network connections on the Linux server.

## 7. TCP Connectivity Testing

TCP connectivity to a service can be tested using:

```bash
nc -zv SERVER_IP 22
```

The `nmap-ncat` package can be installed when required:

```bash
sudo dnf install nmap-ncat -y
```

## 8. Network Path Testing

The `traceroute` utility was used to inspect the path between the Linux server and a remote destination.

Installation:

```bash
sudo dnf install traceroute -y
```

Testing:

```bash
traceroute 8.8.8.8
```

## 9. Network Troubleshooting Methodology

A structured troubleshooting approach was used:

```text
Network Interface
        ↓
IP Address
        ↓
Default Gateway
        ↓
Routing
        ↓
DNS
        ↓
Firewall
        ↓
Application / Service
```

This approach helps isolate problems systematically rather than changing multiple configurations at once.

## 10. Important Commands

The following commands are useful during Linux network troubleshooting:

```bash
ip -br addr
ip route
ping
getent hosts
nmcli
ss
firewall-cmd
traceroute
```

## 11. Skills Demonstrated

This exercise developed practical skills in:

- Linux IP addressing.
- Network interface management.
- Routing-table inspection.
- Network connectivity testing.
- DNS troubleshooting.
- NetworkManager administration.
- TCP port troubleshooting.
- Listening-service identification.
- Firewall troubleshooting.
- Network path analysis.
- Systematic troubleshooting methodology.

## 12. Conclusion

Linux networking is a core system administration skill. Understanding interfaces, IP addressing, routing, DNS, firewalls, and listening services provides the foundation required to troubleshoot Linux servers and infrastructure.

These skills will also be applied later in the homelab when working with cloud networking, containers, monitoring, automation, and infrastructure-as-code.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 7 — Linux Networking and Troubleshooting
