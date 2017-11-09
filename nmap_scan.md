### Look for hosts up and display theyr MAC ADDRESS and VENDOR
```sudo nmap -n -sP 10.0.0.1/24```

and a beautiful format:

```sudo nmap -n -sP 10.0.0.1/24 | awk '/Nmap scan report/{printf $5;printf "\t";getline;getline;printf $3; printf " "; print $4}'```

###

