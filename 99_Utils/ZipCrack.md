# Cracking ZIP archive

1. Extract file hash to be fed into JTR:
```
$ zip2john zipfile > john_input.txt
```

2. Start JTR:
```
$ john john_input.txt --wordlist /usr/share/seclists/Passwords/xato-net-10-million-passwords-1000000.txt
```