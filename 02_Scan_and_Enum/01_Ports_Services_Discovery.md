## Hosts, Ports and Services Discovery

Port scanning techniques:
https://nmap.org/book/man-port-scanning-techniques.html

## 1. TCP Scan

OS can be detected from the TCP response. Each OS have specific TTL and TCP Window size and in the following table:

| Operating system				| Time to Live	| TCP Window Size 	|
|-------------------------------|---------------|-------------------|
| Linux (Kernel 2.4 and 2.6)	| 64			| 5840				|
| Google Linux					| 64			| 5720				|
| FreeBSD						| 64			| 65535				|
| OpenBSD						| 64			| 16384				|
| Windows 95					| 32			| 8192				|
| Windows 2000					| 128			| 16384				|
| Windows XP					| 128			| 65535				|
| Windows 98, Vista, 7			| 128			| 8192				|
| iOS 12.4 						| 255			| 4128				|
| Solaris 7						| 255			| 8760				|
| AIX 4.3						| 64			| 16384				|

TTL can be viewed within Wireshark.

## a. Open TCP Scan
Description: https://nmap.org/book/scan-methods-connect-scan.html

```console
$ sudo nmap -sT <target>
```

## b. Stealth TCP Scan

##### 1. Half-open scan
Description: https://nmap.org/book/synscan.html

```console
$ sudo nmap -sS <target> 	# Also called SYN stealth scan
```

##### 2. Inverse TCP flag scan - not effective agains windows
Basically manipulation of TCP flags FIN/URG/PSH and using them in wrong connection state.
Description: https://nmap.org/book/scan-methods-null-fin-xmas-scan.html

* XMAS Scan: 	`$ sudo nmap -sX <target>`
* FIN scan: 	`$ sudo nmap -sF <targt>`
* NULL scan: 	`$ sudo nmap -sN <target>` # None of the flags are set.
* Maimon scan: 	`$ sudo nmap -sM <target>` # Here probe is FIN/ACK

Description for maimomn scan: https://nmap.org/book/scan-methods-maimon-scan.html

##### 3. ACK Flag Probe Scan
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

## 2. UDP Scan

UDP response codes:

|Type    |Name                                    |Reference|
|----    |----------------------------------------|---------|
|  0     |Echo Reply                              | [RFC792]|
|  1     |Unassigned                              |    [JBP]|
|  2     |Unassigned                              |    [JBP]|
|  3     |Destination Unreachable                 | [RFC792]|
|  4     |Source Quench                           | [RFC792]|
|  5     |Redirect                                | [RFC792]|
|  6     |Alternate Host Address                  |    [JBP]|
|  7     |Unassigned                              |    [JBP]|
|  8     |Echo                                    | [RFC792]|
|  9     |Router Advertisement                    |[RFC1256]|
| 10     |Router Selection                        |[RFC1256]|
| 11     |Time Exceeded                           | [RFC792]|
| 12     |Parameter Problem                       | [RFC792]|
| 13     |Timestamp                               | [RFC792]|
| 14     |Timestamp Reply                         | [RFC792]|
| 15     |Information Request                     | [RFC792]|
| 16     |Information Reply                       | [RFC792]|
| 17     |Address Mask Request                    | [RFC950]|
| 18     |Address Mask Reply                      | [RFC950]|
| 19     |Reserved (for Security)                 |   [Solo]|
| 20-29  |Reserved (for Robustness Experiment)    |    [ZSu]|
| 30     |Traceroute                              |[RFC1393]|
| 31     |Datagram Conversion Error               |[RFC1475]|
| 32     |Mobile Host Redirect              |[David Johnson]|
| 33     |IPv6 Where-Are-You                 |[Bill Simpson]|
| 34     |IPv6 I-Am-Here                     |[Bill Simpson]|
| 35     |Mobile Registration Request        |[Bill Simpson]|
| 36     |Mobile Registration Reply          |[Bill Simpson]|
| 37     |Domain Name Request                     |[RFC1788]|

UDP Scan with nMap:
```console
$ sudo nmap -sU <target>
```
## 3. SCTP Scan

Stream Control Transport Protocol (SCTP) is a reliable message-oriented transport layer control.

#### a. SCTP Init Scan
```console
$ sudo nmap -sY <target>
```

#### b. SCTP COOKIE/ECHO Scan
```console
$ sudo nmap -sZ <target>
```

## 4. SSDP Scan

Simple Service Discovery Protocol

```console
$ sudo nmap -sL <target>
```

## 5. Service version discovery
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

## 6. Bypaass IPS/IDS

- Packet fragmentation
- Source routing
- Source port manipulation
- IP address decoy
- IP address spoofing
- Creating custom packets
- Randomizing host order
- Sending bad checksums
- Proxy servers
- Anonymizers

Official nmap documentation on Firewall/IDS evading:
https://nmap.org/book/man-bypass-firewalls-ids.html


#### 1. Packet fragmentation
```
$ sudo nmap -f -sS -T4 -A <target_ip>
```

#### 2. Source routing

#### 3. Source port manipulation
```
$ sudo nmap -g <target_port> <target_host>
```

#### 4. IP Address Decoy


## 7. Scanning speed tips

1. Use flag **-n** to disable DNS lookup

