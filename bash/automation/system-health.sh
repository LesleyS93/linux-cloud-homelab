#!/bin/bash

# Linux System Health Monitoring
# Linux Cloud Career Homelab

HOSTNAME=$(hostname)
DATE=$(date)
KERNEL=$(uname -r)

echo "======================================"
echo "       LINUX SYSTEM HEALTH REPORT"
echo "======================================"

echo "Hostname: $HOSTNAME"
echo "Date: $DATE"
echo "Kernel: $KERNEL"

echo
echo "--------- CPU INFORMATION ---------"

nproc
