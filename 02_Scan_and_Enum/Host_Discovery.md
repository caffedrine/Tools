# Host discovery using nMap

### 1. ARP Scan
```console
$ sudo nmap -sn -PR <target>
```

### 2. UDP Ping Scan
```console
$ sudo nmap -sn -PU <target>		# Default port is 40125
$ sudo nmap -sn -PU53 <target>		# Specify different port
```

### 3. ICMP Echo Scan
```console
$ sudo nmap -sn -PE <target>
```

### 4. ICMP Timestamp Ping Scan
```console
$ sudo nmap -sn -PP <target>
```

### 5. ICMP Address Mask Ping Scan
```console
$ sudo nmap -sn -PM <target>
```

### 6. TCP SYN Ping Scan
```console
$ sudo nmap -sn -PS <target> 		# Port 80 used by default
$ sudo nmap -sn -PS22,443 <target>	# Use custom TCP ports
```

### 7. TCP ACK Ping Scan
```console
$ sudo nmap -sn -PA <target>
```

### 8. IP Protocol Ping Scan
```console
$ sudo nmap -sn -PO <target>
```
