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


## Get live hosts using ARP requests (Kali Linux)
```$ sudo netdiscover```