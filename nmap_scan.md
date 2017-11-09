### Look for hosts up and display theyr MAC ADDRESS and VENDOR
```sudo nmap -PU 10.0.0.1/24```

sometime the above command may not work

```sudo nmap -e eth0 -sP -PU161 10.0.0.1/24```

###

