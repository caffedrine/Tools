# Bypass firewall with nMap

Official nMap page on subject: https://nmap.org/book/man-bypass-firewalls-ids.html

## 1. Packet fragmentation
```console
$ sudo nmap -sS -A -f <target>
```

## 2. Source routing

## 3. Source port manipulation
```console
$ sudo nmap -sS -A -g <src_port> <target>
```

## 4. IP Address decoy

Generate random Ip addresses:
```console
$ sudo nmap -D RND:10 <target>
```

Specify manually IP addresses:
```console
$ sudo nmap -D ip1,ip2,ip3,ME,ip4,ip5,etc <target>  # if ME is not provided, nmap will automatically place it at a random position, where ME is attacker's ip address
```

## 5. IP Address SPoofing
```console
$ sudo nmap -S <spoofed_ip> <target>
```
or
```console
$ sudo hping3 <target> -a <spoofed_ip>
```