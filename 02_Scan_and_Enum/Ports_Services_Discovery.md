# 1. TCP Scan

## a. Open TCP Scan

Description:
https://nmap.org/book/scan-methods-connect-scan.html

```console
$ sudo nmap -sT <target>
```

## b. Stealth TCP Scan

1. Half-open scan
```console
$ sudo nmap -sS <target> 	# Also called SYN stealth scan
```

2. Inverse TCP flag scan - not effective agains windows
Basically manipulation of TCP flags FIN/URG/PSH and using them in wrong connection state.
* XMAS Scan: `$ sudo nmap -sX <target>`
* FIN scan: `$ sudo nmap -sF <targt>`
* NULL scan: `$ sudo nmap -sN <target>` # None od the flags are set.
* Maimon scan: `$ sudo nmap -sM <target>` # Here probe is FIN/ACK

3. ACK Flag Probe Scan

## c. Thirdparty/Spoofed TCP Scan 

# 2. UDP Scan

# 3. SCTP Scan

## a. SCTP Init Scan

## b. SCTP COOKIE/ECHO Scan

# 4. SSDP Scan