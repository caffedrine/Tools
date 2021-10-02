## Web enumeration methodology

## Identify website technology
```
$ whatweb -v 10.10.10.46
```

#### Brouteforce directories
```
$ gobuster dir -w /usr/share/seclists/Discovery/Web-Content/big.txt -u <target>
```

### Website crawler
```
$ gospider -s http://10.10.10.46
```

## Generate dictionary from html pages 
```
html2dic 
```