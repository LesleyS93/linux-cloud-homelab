# Day 1 Step 13 — Linux Environment Variables, Shell Configuration and Bash Administration

## Objective

Develop practical knowledge of the Linux shell environment, environment variables, the `PATH` variable, Bash configuration, aliases, command history, and command exit codes.

These concepts form the foundation for Linux administration and Bash automation.

## Environment

- Operating System: Rocky Linux
- Shell: Bash
- Virtualization Platform: VMware
- Project: Linux Cloud Career Homelab

## 1. Shell Identification

The current shell environment was inspected using:

```bash
echo $SHELL
echo $0
```

User and environment information was inspected using:

```bash
echo $USER
echo $HOME
echo $PWD
```

These variables provide information about the current user, home directory, shell, and working directory.

## 2. Environment Variables

Environment variables were inspected with:

```bash
env
printenv
```

Individual variables can be queried directly:

```bash
printenv HOME
printenv USER
printenv SHELL
```

Environment variables are commonly used by operating systems, applications, scripts, and services to obtain configuration information.

## 3. PATH Management

The executable search path was inspected:

```bash
echo $PATH
```

Command locations were identified using:

```bash
which bash
which systemctl
which ssh
```

The `PATH` variable determines which directories Linux searches when a command is entered without its full path.

## 4. Shell Variables

A temporary shell variable was created:

```bash
LAB_NAME="linux-cloud-homelab"
```

The variable was displayed using:

```bash
echo $LAB_NAME
```

The variable was then exported:

```bash
export LAB_NAME="linux-cloud-homelab"
```

Exporting a variable allows child processes to inherit the variable.

## 5. Custom Administration Script

A personal executable directory was created:

```bash
mkdir -p ~/bin
```

A system information script was created:

```bash
nano ~/bin/system-info
```

The script provides basic information about the Linux environment:

```bash
#!/bin/bash

echo "Linux Cloud Homelab"
echo "Hostname: $(hostname)"
echo "User: $USER"
echo "Kernel: $(uname -r)"
```

The script was made executable:

```bash
chmod +x ~/bin/system-info
```

It can be executed directly:

```bash
~/bin/system-info
```

## 6. PATH Customization

The personal executable directory was added to the current `PATH`:

```bash
export PATH="$HOME/bin:$PATH"
```

The script could then be executed using:

```bash
system-info
```

Its location was confirmed with:

```bash
which system-info
```

This demonstrates how administrators can maintain personal or project-specific command-line utilities.

## 7. Bash Configuration

The user's Bash configuration was inspected:

```bash
ls -la ~
cat ~/.bashrc
```

A custom environment variable was added to `.bashrc`:

```bash
export HOMELAB_ENV="rocky-linux"
```

The configuration was reloaded:

```bash
source ~/.bashrc
```

The variable was then available to the current shell:

```bash
echo $HOMELAB_ENV
```

## 8. Bash Aliases

A useful administrative alias was added:

```bash
alias ll='ls -lah'
```

After reloading `.bashrc`, the alias can be used as:

```bash
ll
```

Aliases can simplify frequently used commands while maintaining the underlying Linux command structure.

## 9. Command History

Shell history was inspected using:

```bash
history
```

Specific administrative commands can be located with:

```bash
history | grep systemctl
history | grep dnf
```

Command history is useful when reviewing previous administrative actions and troubleshooting changes made to a system.

## 10. Command Exit Codes

Linux commands return an exit status.

A successful command normally returns:

```text
0
```

The status can be checked with:

```bash
echo $?
```

A failed command normally returns a non-zero exit status.

For example:

```bash
this-command-does-not-exist
echo $?
```

Understanding exit codes is essential when developing Bash scripts because automation can use these values to determine whether an operation succeeded or failed.

## 11. Administrative Relevance

Environment variables and Bash configuration are important in Linux administration because they influence:

- Application configuration
- Shell behavior
- Command execution
- Automation
- User environments
- Administrative scripts
- Software configuration
- System troubleshooting

The `PATH` variable is particularly important because it determines where the shell searches for executable commands.

## Skills Demonstrated

- Bash shell administration
- Environment variables
- `PATH` management
- Shell variables
- Exported variables
- Bash configuration
- `.bashrc` management
- Command aliases
- Command history
- Exit codes
- Basic Bash scripting
- Linux command discovery

## Conclusion

Understanding the Linux shell environment is an important step toward advanced Linux administration and automation.

Linux administrators do not need to memorize every command. They need to understand how the operating system, shell, configuration files, environment variables, and commands work together.

This knowledge provides the foundation for the next stage of the homelab: Bash automation and administrative scripting.

---

**Portfolio:** Linux Cloud Career Homelab  
**Phase:** Day 1 — Linux Administration  
**Exercise:** Step 13 — Environment Variables, Shell Configuration and Bash Administration
