# Linux privileges escalation

### Tools:
1. LinPostExp

# Abusing sudo

Editing /etc/sudoers or /etc/shadow if allowed


# Abusing SUID or SGID permissions

Files that are temporarily alowed to run with elevated privileges.

To find these files:
```
$ find / -perm -u=s -type f 2>/dev/null
$ find / -perm -g=s -type f 2>/dev/null
```

# Setuid and Setgid


# Kernel exploits


Use linprivchecker.py to detect available kernel exploits.