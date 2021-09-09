# Host discovery using nMap

### 1. ARP Scan
```console
$ sudo nmap -sn -PR <target>
```

### 2. UDP Ping Scan
```console
$ sudo nmap -sn -PU <target>
```

### 3. ICMP Echo Scan
```console
$ sudo nmap -sn -PE <target>
```

### 4. ICMP Timestamp Ping Scan
```console
$ sudo nmap -sn -PP <target>
```