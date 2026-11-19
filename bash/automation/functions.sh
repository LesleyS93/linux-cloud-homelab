#!/bin/bash

show_hostname() {
    echo "Hostname: $(hostname)"
}

show_memory() {
    echo "Memory Information:"
    free -h
}

show_disk() {
    echo "Disk Information:"
    df -h
}

show_hostname
show_memory
show_disk
