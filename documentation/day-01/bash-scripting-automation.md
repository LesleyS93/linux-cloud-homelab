# Day 1 Step 14 — Bash Scripting and Linux Administration Automation

## Objective

Develop practical Bash scripting skills for automating routine Linux administration activities.

This exercise introduces script structure, variables, user input, conditional statements, loops, exit codes, error handling, functions, and system health monitoring.

## Environment

- Operating System: Rocky Linux
- Shell: Bash
- Virtualization: VMware
- Project: Linux Cloud Career Homelab

## 1. Bash Script Structure

Bash scripts begin with a shebang identifying the interpreter:

```bash
#!/bin/bash
```

Scripts contain commands that execute sequentially and can be made executable using:

```bash
chmod +x script-name.sh
```

A script can then be executed using:

```bash
./script-name.sh
```

## 2. Variables

Variables store information that can be reused throughout a script.

Example:

```bash
SERVER_NAME=$(hostname)
ADMIN_USER=$(whoami)
```

Variables improve script flexibility and reduce repetitive command execution.

## 3. User Input

The `read` command allows scripts to accept user input.

Example:

```bash
read -p "Enter server name: " SERVER_NAME
```

User input is useful when creating reusable administration utilities.

## 4. Conditional Statements

Conditional statements allow scripts to make decisions based on command results.

Example:

```bash
if systemctl is-active --quiet sshd; then
    echo "SSH is running."
else
    echo "SSH is not running."
fi
```

This structure is commonly used when monitoring services and validating system conditions.

## 5. Loops

Loops automate repetitive operations.

Example:

```bash
SERVICES=("sshd" "NetworkManager" "firewalld")

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE: RUNNING"
    else
        echo "$SERVICE: NOT RUNNING"
    fi
done
```

This allows multiple Linux services to be checked using a single script.

## 6. Exit Codes and Error Handling

Linux commands return exit statuses.

- `0`: Successful execution.
- Non-zero: Unsuccessful execution or another defined status.

Example:

```bash
if systemctl is-active --quiet sshd; then
    exit 0
else
    exit 1
fi
```

Exit codes allow scripts and automation systems to identify unsuccessful operations.

## 7. System Health Monitoring

A system health script was developed to collect basic infrastructure information.

The script reports:

- Hostname
- Current date
- Kernel version
- CPU information
- Memory usage
- Disk usage
- System uptime
- Failed systemd services
- SSH service status

The monitoring script uses commands including:

```bash
hostname
date
uname -r
nproc
free -h
df -h
uptime
systemctl --failed
systemctl is-active sshd
```

This demonstrates how individual Linux commands can be combined into a reusable administrative tool.

## 8. Script Validation and Troubleshooting

Bash syntax validation can be performed with:

```bash
bash -n script-name.sh
```

Execution tracing can be enabled with:

```bash
bash -x script-name.sh
```

These tools help administrators identify syntax problems and understand script execution.

## 9. Bash Functions

Functions allow frequently used operations to be grouped into reusable blocks.

Example:

```bash
show_memory() {
    free -h
}

show_disk() {
    df -h
}
```

Functions improve maintainability and reduce duplicated code.

## 10. Administrative Applications

Bash scripting is widely useful in Linux infrastructure environments.

Common applications include:

- Server health monitoring.
- Service availability checks.
- Disk capacity monitoring.
- Log analysis.
- Backup automation.
- User administration.
- System maintenance.
- Deployment automation.
- Operational reporting.

## Skills Demonstrated

- Bash scripting fundamentals.
- Script execution and permissions.
- Variables and command substitution.
- User input.
- Conditional statements.
- Loops and arrays.
- Exit codes.
- Basic error handling.
- Bash functions.
- Script syntax validation.
- Execution tracing.
- Linux system health monitoring.

## Conclusion

Bash scripting is an essential Linux administration skill.

It allows administrators to transform repetitive command-line operations into reusable and maintainable automation tools.

These fundamentals provide a foundation for more advanced infrastructure automation using Bash, Python, Ansible, Terraform, and CI/CD platforms.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 14 — Bash Scripting and Linux Administration Automation
