# Host discovery using nMap

1. ARP Scan
```
$ sudo nmap -sn -PR <target>
```

2. UDP Ping Scan
```
$ sudo nmap -sn -PU <target>
```

3. ICMP Echo Scan
```
$ sudo nmap -sn -PE <target>
```

4. ICMP Timestamp Ping Scan
```
$ sudo nmap -sn -PP <target>
```