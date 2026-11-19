#!/bin/bash

echo "Checking SSH service..."

if systemctl is-active --quiet sshd; then
    echo "SUCCESS: SSH service is running."
    exit 0
else
    echo "ERROR: SSH service is not running."
    exit 1
fi
