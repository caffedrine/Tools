# Linux delete logs

Delete relevant entries from */var/log/*
Delete relevant entries from */var/log/messages*

## covering bash logs

1. Clear stored bash history: **history -c**
2. Clear bash history for current shell: **history -w**
3. Clear user's complete history: 
```
cat /dev/null > ~.bash_history && history -c && exit
```

Shredding history:
```
shred ~/.bash_history
```

For current session to diable recording, use HISTSIZE:
```
$ export HISTSIZE=0
```