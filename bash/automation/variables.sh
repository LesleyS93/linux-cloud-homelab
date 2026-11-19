#!/bin/bash

SERVER_NAME=$(hostname)
ADMIN_USER=$(whoami)
OPERATING_SYSTEM=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f 2)

echo "Server Name: $SERVER_NAME"
echo "Administrator: $ADMIN_USER"
echo "Operating System: $OPERATING_SYSTEM"
