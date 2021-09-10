Port scanning techniques:
https://nmap.org/book/man-port-scanning-techniques.html

# 1. TCP Scan

## a. Open TCP Scan
Description:https://nmap.org/book/scan-methods-connect-scan.html

```console
$ sudo nmap -sT <target>
```

## b. Stealth TCP Scan

1. Half-open scan
Description: https://nmap.org/book/synscan.html

```console
$ sudo nmap -sS <target> 	# Also called SYN stealth scan
```

2. Inverse TCP flag scan - not effective agains windows
Basically manipulation of TCP flags FIN/URG/PSH and using them in wrong connection state.
Description: https://nmap.org/book/scan-methods-null-fin-xmas-scan.html

* XMAS Scan: 	`$ sudo nmap -sX <target>`
* FIN scan: 	`$ sudo nmap -sF <targt>`
* NULL scan: 	`$ sudo nmap -sN <target>` # None of the flags are set.
* Maimon scan: 	`$ sudo nmap -sM <target>` # Here probe is FIN/ACK

Description for maimomn scan: https://nmap.org/book/scan-methods-maimon-scan.html

3. ACK Flag Probe Scan
Basic usage: https://nmap.org/book/scan-methods-ack-scan.html
Used to map out *firewalls*.
```console
$ sudo nmap -sA <target>
```

* TTL-based ACK Flag Probe Scan: `$ sudo nmap -ttl <time> <target>`
* Window-based ACK Flag Probe scan `$ sudo nmap -sW <target>`

## c. Thirdparty/Spoofed TCP Scan 

* IDLE/IPID Scan

```console
$ sudo nmap -sI <zombie> -Pn <target>  
```

# 2. UDP Scan
```console
$ sudo nmap -sU <target>
```
# 3. SCTP Scan

Stream Control Transport Protocol (SCTP) is a reliable message-oriented transport layer control.

## a. SCTP Init Scan
```console
$ sudo nmap -sY <target>
```

## b. SCTP COOKIE/ECHO Scan
```console
$ sudo nmap -sZ <target>
```

# 4. SSDP Scan

Simple Service Discovery Protocol

```console
$ sudo nmap -sL <target>
```

# 5. Service version discovery
```console
$ sudo nmap -sV <target>
```

Additionaly, default scripts can be enabled by providing -sC:
```console
$ sudo nmap -sV -sC <target>
```

Additionaly, OS detection + version detection + script scanning + traceroute could be enabled with -A:
```console
$ sudo nmap -A <target>
```