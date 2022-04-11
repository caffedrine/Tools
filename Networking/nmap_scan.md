## Hosts UP scan

Ping sweep:
```$ nmap -sP 10.0.0.1/24```

and a beautiful output format:

```
$ nmap -sP 10.0.0.1/24 | awk '/Nmap scan report/{print $5}'
```

and if the above it's not working, be more specific: 

```
$ sudo nmap -sP -PS22,3389 10.0.0.1/24
$ sudo nmap -sP -PU161 10.0.0.1/24 
```

## Get MAC ADDRESSES and VENDORS
```$ sudo nmap -n -sP 10.0.0.1/24```

and a beautiful format:

```
$ sudo nmap -n -sP 10.0.0.1/24 | awk '/Nmap scan report/ {printf $5;printf "\t";getline;getline;printf $3; printf " "; printf $4; printf " "; printf $5; printf " "; printf $6; printf " "; print $7}'
```

## ARP scan for sensitive networks

```
$ sudo nmap -PR 10.0.0.1/24 -sn
```

## Scan for open ports and service version

```
$ sudo nmap -sV 10.0.0.1 -p-

$ nmap -A -T4 10.0.0.1 -p5900	#better

$ sudo nmap -n -PN -sT -sU -p- remote_host	# all tcp and udp ports

$ sudo nmap -n -PN -sT -sU -sC -sV -p- <target_ip>
```



## Aggresive scan

"enable OS detection and Version detection, Script scanning and Traceroute"

```
sudo nmap -A -T4 10.0.0.1
```

## Get live hosts using ARP requests (Kali Linux)
```$ sudo netdiscover```

## Utils:
https://github.com/gnebbia/nmap_tutorial/tree/master/sections