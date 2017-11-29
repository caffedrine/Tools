### Hosts UP scan
```nmap -sP 10.0.0.1/24```

and a beautiful format

```nmap -sP 192.168.88.1/24 | awk '/Nmap scan report/{print $5}'```

and if the above it's not working: 
```
sudo nmap -sP -PS22,3389 10.0.0.1/24
sudo nmap -sP -PU161 10.0.0.1/24 
```

### Look for hosts up and display theyr MAC ADDRESS and VENDOR
```sudo nmap -n -sP 10.0.0.1/24```

and a beautiful format:

```sudo nmap -n -sP 10.0.0.1/24 | awk '/Nmap scan report/{printf $5;printf "\t";getline;getline;printf $3; printf " "; print $4}'```
